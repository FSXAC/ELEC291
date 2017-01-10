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

; defines for the other pins
LED_RED equ P3.7

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
; Wait 'R0' seconds               ;
;---------------------------------;
sleeps:
    push    AR0
    push    AR1
    mov     R0, #250
    mov     R1, #4
sleeps_L0:
    lcall   sleep
    djnz    R1, sleeps_L0
    pop     AR1
    pop     AR0
    ret

;---------------------------------;
; Wait 50 milliseconds            ;
;---------------------------------;
sleep50:
    push    AR0
    mov     R0, #50
    lcall   sleep
    pop     AR0
    ret

;---------------------------------;
; Wait 100 milliseconds           ;
;---------------------------------;
sleep100:
    push    AR0
    mov     R0, #100
    lcall   sleep
    pop     AR0
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
; Clear top half LCD              ;
;---------------------------------;
LCD_clearTop:
    push    AR0
    mov     R0, #0x80
LCD_clearTop_L0:
    mov     a,  R0
    lcall   LCD_writeCommand
    mov     a,  #32
    lcall   LCD_writeData
    cjne    R0, #0x8F,  LCD_clearTop_L1
    pop     AR0
    ret
LCD_clearTop_L1:
    inc     R0
    sjmp    LCD_clearTop_L0

;---------------------------------;
; Clear btm half LCD              ;
;---------------------------------;
LCD_clearBtm:
    push    AR0
    mov     R0, #0xC0
LCD_clearBtm_L0:
    mov     a,  R0
    lcall   LCD_writeCommand
    mov     a,  #32
    lcall   LCD_writeData
    cjne    R0, #0xCF,  LCD_clearBtm_L1
    pop     AR0
    ret
LCD_clearBtm_L1:
    inc     R0
    sjmp    LCD_clearBtm_L0

;---------------------------------;
; Clear all of LCD                ;
;---------------------------------;
LCD_clear:
    lcall   LCD_clearBtm
    lcall   LCD_clearTop
    ret

;---------------------------------;
; Animation to shift name in      ;
;---------------------------------;
LCD_shiftNameIn:
    push    AR0                 ; back up registers
    push    AR1
    mov     R1, #0x8F           ; starting cursor location
LCD_shiftNameIn_L1:
    lcall   LCD_clearTop        ; clear top half of the screen first
    mov     a,  R1              ; loop to print out each character in the name
    lcall   LCD_writeCommand
    mov     a,  #'M'
    lcall   LCD_writeData
    mov     a,  R1
    add     a,  #1
    lcall   LCD_writeCommand
    mov     a,  #'U'
    lcall   LCD_writeData
    mov     a,  R1
    add     a,  #2
    lcall   LCD_writeCommand
    mov     a,  #'C'
    lcall   LCD_writeData
    mov     a,  R1
    add     a,  #3
    lcall   LCD_writeCommand
    mov     a,  #'H'
    lcall   LCD_writeData
    mov     a,  R1
    add     a,  #4
    lcall   LCD_writeCommand
    mov     a,  #'E'
    lcall   LCD_writeData
    mov     a,  R1
    add     a,  #5
    lcall   LCD_writeCommand
    mov     a,  #'N'
    lcall   LCD_writeData
    cjne    R1, #0x85,  LCD_shiftNameIn_L0    ; keep going until name in position
    pop     AR1
    pop     AR0
    ret
LCD_shiftNameIn_L0:
    dec     R1                  ; decrement cursor position to the left
    lcall   sleep50             ; time delay
    cpl     LED_RED
    sjmp    LCD_shiftNameIn_L1  ; loop


;---------------------------------;
; Animation to shift name out     ;
;---------------------------------;
LCD_shiftNameOut:
    push    AR0                 ; back up registers
    push    AR1
    mov     R1, #0x84           ; starting cursor location
LCD_shiftNameOut_L1:
    lcall   LCD_clearTop        ; clear top half of the screen first
    mov     a,  R1              ; loop to print out each character in the name
    lcall   LCD_writeCommand
    mov     a,  #'M'
    lcall   LCD_writeData
    mov     a,  R1
    add     a,  #1
    lcall   LCD_writeCommand
    mov     a,  #'U'
    lcall   LCD_writeData
    mov     a,  R1
    add     a,  #2
    lcall   LCD_writeCommand
    mov     a,  #'C'
    lcall   LCD_writeData
    mov     a,  R1
    add     a,  #3
    lcall   LCD_writeCommand
    mov     a,  #'H'
    lcall   LCD_writeData
    mov     a,  R1
    add     a,  #4
    lcall   LCD_writeCommand
    mov     a,  #'E'
    lcall   LCD_writeData
    mov     a,  R1
    add     a,  #5
    lcall   LCD_writeCommand
    mov     a,  #'N'
    lcall   LCD_writeData
    cjne    R1, #0x7A,  LCD_shiftNameOut_L0   ; keep going until name in position
    pop     AR1
    pop     AR0
    ret
LCD_shiftNameOut_L0:
    dec     R1                  ; decrement cursor position to the left
    lcall   sleep50             ; time delay
    cpl     LED_RED
    sjmp    LCD_shiftNameOut_L1 ; loop

;---------------------------------;
; Simply print name in the middle ;
;---------------------------------;
LCD_printName:
    mov     a,  #0x84
    lcall   LCD_writeCommand
    mov     a,  #'('
    lcall   LCD_writeData
    lcall   sleep50
    mov     a,  #0x85
    lcall   LCD_writeCommand
    mov     a,  #'M'
    lcall   LCD_writeData
    lcall   sleep50
    mov     a,  #0x86
    lcall   LCD_writeCommand
    mov     a,  #'A'
    lcall   LCD_writeData
    lcall   sleep50
    mov     a,  #0x87
    lcall   LCD_writeCommand
    mov     a,  #'N'
    lcall   LCD_writeData
    lcall   sleep50
    mov     a,  #0x88
    lcall   LCD_writeCommand
    mov     a,  #'S'
    lcall   LCD_writeData
    lcall   sleep50
    mov     a,  #0x89
    lcall   LCD_writeCommand
    mov     a,  #'U'
    lcall   LCD_writeData
    lcall   sleep50
    mov     a,  #0x8A
    lcall   LCD_writeCommand
    mov     a,  #'R'
    lcall   LCD_writeData
    lcall   sleep50
    mov     a,  #0x8B
    lcall   LCD_writeCommand
    mov     a,  #')'
    lcall   LCD_writeData
    lcall   sleep50
    ret

;---------------------------------;
; Simply print name in the middle ;
;---------------------------------;
LCD_printName2:
    mov     a,  #0x84
    lcall   LCD_writeCommand
    mov     a,  #' '
    lcall   LCD_writeData
    lcall   sleep50
    mov     a,  #0x85
    lcall   LCD_writeCommand
    mov     a,  #'M'
    lcall   LCD_writeData
    lcall   sleep50
    mov     a,  #0x86
    lcall   LCD_writeCommand
    mov     a,  #'U'
    lcall   LCD_writeData
    lcall   sleep50
    mov     a,  #0x87
    lcall   LCD_writeCommand
    mov     a,  #'C'
    lcall   LCD_writeData
    lcall   sleep50
    mov     a,  #0x88
    lcall   LCD_writeCommand
    mov     a,  #'H'
    lcall   LCD_writeData
    lcall   sleep50
    mov     a,  #0x89
    lcall   LCD_writeCommand
    mov     a,  #'E'
    lcall   LCD_writeData
    lcall   sleep50
    mov     a,  #0x8A
    lcall   LCD_writeCommand
    mov     a,  #'N'
    lcall   LCD_writeData
    lcall   sleep50
    mov     a,  #0x8B
    lcall   LCD_writeCommand
    mov     a,  #' '
    lcall   LCD_writeData
    lcall   sleep50
    ret


;---------------------------------;
; Main functions                  ;
; SETUP function runs onces       ;
;---------------------------------;
setup:
    mov     SP,     #7FH
    mov     PMOD,   #0

    ; configure LCD
    lcall   LCD_configure_4bit

    ; setup for animation
    mov     R1, #0x80
    mov     R2, #'A'
    mov     R3, #0xCF
    mov     R4, #'0'

;---------------------------------;
; Main functions                  ;
; LOOP function runs forever      ;
;---------------------------------;
loop:
    ; clear LCD
    lcall   LCD_clear

    lcall   LCD_shiftNameIn
    mov     R0, #1
    lcall   sleeps

    lcall   LCD_printName
    lcall   sleeps

    lcall   LCD_printName2
    lcall   sleeps

    lcall   LCD_shiftNameOut
    sjmp    loop

; end of program
END
