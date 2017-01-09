; LCD_name.asm: lab using LCD
$NOLIST
$MODLP52
$LIST

org 0000H
    ljmp    setup

org 001BH
    ljmp    181BH

; defines pins for LCD
LCD_RS  equ P1.2
LCD_RW  equ P1.3
LCD_E   equ P1.4
LCD_D4  equ P3.2
LCD_D5  equ P3.3
LCD_D6  equ P3.4
LCD_D7  equ P3.5

;---------------------------------;
; Wait 40 microseconds            ;
;---------------------------------;
sleep40us:
    push    AR0
    mov     R0, #177
L0: nop
    nop
    djnz    R0, L0
    pop     AR0
    ret

;---------------------------------;
; Wait 'R0' milliseconds          ;
;---------------------------------;
sleep:
    push    AR1
    push    AR2
L1: mov     R1, #45
L2: mov     R2, #164
L3: djnz    R2, L3
    djnz    R1, L2
    djnz    R0, L1
    pop     AR2
    pop     AR1
    ret

;---------------------------------;
; Toggles the LCD's 'E' pin       ;
;---------------------------------;
LCD_pulse:
    setb    LCD_E
    lcall   sleep40us
    clr     LCD_E
    ret


;---------------------------------;
; Writes data to LCD              ;
;---------------------------------;
LCD_writeData:
    setb    LCD_RS
    ljmp    LCD_byte

;---------------------------------;
; Writes command to LCD           ;
;---------------------------------;
LCD_writeCommand:
    clr     LCD_RS
    ljmp    LCD_byte


;---------------------------------;
; Writes acc to LCD in 4-bit mode ;
;---------------------------------;
LCD_byte:
    ; Write high 4 bits first
    mov     c,          ACC.7
    mov     LCD_D7,     c
    mov     c,          ACC.6
    mov     LCD_D6,     c
    mov     c,          ACC.5
    mov     LCD_D5,     c
    mov     c,          ACC.4
    mov     LCD_D4,     c
    lcall   LCD_pulse

    ; Write low 4 bits next
    mov     c,          ACC.3
    mov     LCD_D7,     c
    mov     c,          ACC.2
    mov     LCD_D6,     c
    mov     c,          ACC.1
    mov     LCD_D5,     c
    mov     c,          ACC.0
    mov     LCD_D4,     c
    lcall   LCD_pulse
    ret

;---------------------------------;
; Configure LCD in 4-bit mode     ;
;---------------------------------;
LCD_configure_4bit:
    ; Resting state of LCD's enable is zero
    clr     LCD_E

    ; We are only writing to the LCD in this program
    clr     LCD_RW

    ; After power on, wait for LCD start up time before initializing
    ; NOTE: the preprogrammed power-on delay of 16 ms on the AT89LP52
    ; seems to be enough.  That is why these two lines are commented out.
    ; Also, commenting these two lines improves simulation time in Multisim.
    ; mov R2, #40
    ; lcall WaitmilliSec

    ; First make sure the LCD is in 8-bit mode and then change to 4-bit mode
    mov     a,  #0x33
    lcall   LCD_writeCommand
    mov     a,  #0x33
    lcall   LCD_writeCommand
    mov     a,  #0x32 ; change to 4-bit mode
    lcall   LCD_writeCommand

    ; Configure the LCD
    mov     a,  #0x28
    lcall   LCD_writeCommand
    mov     a,  #0x0c
    lcall   LCD_writeCommand
    mov     a,  #0x01 ;  Clear screen command (takes some time)
    lcall   LCD_writeCommand

    ;Wait for clear screen command to finish. Usually takes 1.52ms.
    mov     R0, #2
    lcall   sleep
    ret

;---------------------------------;
; Main functions                  ;
; SETUP function runs onces       ;
;---------------------------------;
setup:
    mov     SP,     #7FH
    mov     PMOD,   #0
    lcall   LCD_configure_4bit

    ; move cursor to line 1 col 1
    mov     a,      #0x80
    lcall   LCD_writeCommand
    mov     a,      #'A'
    lcall   LCD_writeData

    ; move cursor to line 2 col 3
    mov     a,      #0x81
    lcall   LCD_writeCommand
    mov     a,      #'B'
    lcall   LCD_writeData

    mov     a,      #0x82
    lcall   LCD_writeCommand
    mov     a,      #'C'
    lcall   LCD_writeData

    mov     a,      #0x83
    lcall   LCD_writeCommand
    mov     a,      #'D'
    lcall   LCD_writeData

    mov     a,      #0x84
    lcall   LCD_writeCommand
    mov     a,      #'E'
    lcall   LCD_writeData

    mov     a,      #0x8F
    lcall   LCD_writeCommand
    mov     a,      #'?'
    lcall   LCD_writeData

    mov     a,      #0xC0
    lcall   LCD_writeCommand
    mov     a,      #'X'
    lcall   LCD_writeData

    mov     a,      #0xC1
    lcall   LCD_writeCommand
    mov     a,      #'Y'
    lcall   LCD_writeData

    mov     a,      #0xCF
    lcall   LCD_writeCommand
    mov     a,      #'Z'
    lcall   LCD_writeData

    ; setup for animation
    mov     R0,     #255
    mov     R1,     #0x80

;---------------------------------;
; Main functions                  ;
; LOOP function runs forever      ;
;---------------------------------;
loop:
    mov     a,      R1
    lcall   LCD_writeCommand
    mov     a,      #'F'
    lcall   LCD_writeData
    lcall   sleep

    ; increment position of cursor


    sjmp    loop

; end of program
END
