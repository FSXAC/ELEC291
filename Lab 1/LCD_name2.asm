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
BUZZER  equ P2.0

; data in the memory
data_name1:
	db		'MUCHEN HE', 0
data_name2:
    db      '------', 0
data_name3:
    db      'MANSUR', 0
data_number1:
    db      '00000000', 0
data_stdid:
	db		'45138644', 0
string1:
    db      '                ', 0
string2:
	db 		'We are', 0
string3:
	db		'number one!', 0

;---------------------------------;
; Wait (R0) microsecond           ;
;---------------------------------;
sleepu:
    push    AR1
sleepu_L1:
    mov     R1, #7
sleepu_L0:
    djnz    R1, sleepu_L0
    djnz    R0, sleepu_L1
    pop     AR1
    ret

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
; Wait 50 milliseconds            ;
;---------------------------------;
sleep50:
    push    AR0
    mov     R0, #50
    lcall   sleep
    pop     AR0
    ret

;---------------------------------;
; Wait 1 second                   ;
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
    clr     LCD_E				; Resting state of LCD's enable is zero
    clr     LCD_RW				; We are only writing to the LCD in this program
    mov     a,  #0x33			; check 8 bit mode
    lcall   LCD_writeCommand
    mov     a,  #0x33
    lcall   LCD_writeCommand
    mov     a,  #0x32 			; change to 4-bit mode
    lcall   LCD_writeCommand
    mov     a,  #0x28			; Configure the LCD
    lcall   LCD_writeCommand
    mov     a,  #0x0c
    lcall   LCD_writeCommand
    mov     a,  #0x01 			; clear screen command (takes some time)
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
    mov     a,  #0x01
    lcall   LCD_writeCommand
    mov     R0, #3
    lcall   sleep
    ret

;---------------------------------;
; Shift mode for LCD              ;
;---------------------------------;
LCD_shiftCursor:
	mov		a, 	#0x06
	sjmp	LCD_shift_return
LCD_shiftDisplay:
	mov 	a,  #0x07
LCD_shift_return:
	lcall	LCD_writeCommand
	ret

;---------------------------------;
; resets cursor at home           ;
;---------------------------------;
LCD_home:
	mov 	a,	#0x02
	lcall	LCD_writeCommand
	ret

;---------------------------------;
; move cursor back one            ;
;---------------------------------;
LCD_back:
    mov     a,  #0x10
    lcall   LCD_writeCommand
    ret

;---------------------------------;
; Simply print name in the middle ;
;---------------------------------;
LCD_print:
    clr     a
    movc    a,  @a+dptr
    jz      LCD_print_return
    lcall   LCD_writeData
    inc     dptr
    lcall   sleep50
    cpl		BUZZER
    cpl		LED_RED
    sjmp    LCD_print
LCD_print_return:
    ret

;---------------------------------;
; Simply print name in the middle ;
;---------------------------------;
LCD_printMore:
    clr     a
    movc    a,  @a+dptr
    jz      LCD_printMore_return
    lcall   LCD_writeData
    mov     a,  #']'
    lcall   LCD_writeData
    mov     a,  #0x10
    lcall   LCD_writeCommand
    inc     dptr
    lcall   sleep50
    cpl		BUZZER
    cpl		LED_RED
    sjmp    LCD_printMore
LCD_printMore_return:
    ret

;---------------------------------;
; Simply print name in the middle ;
;---------------------------------;
LCD_printNoDelay:
    clr     a
    movc    a,  @a+dptr
    jz      LCD_printNoDelay_return
    lcall   LCD_writeData
    inc     dptr
    sjmp    LCD_printNoDelay
LCD_printNoDelay_return:
    ret

;---------------------------------;
; Prints out a single digit       ;
; R0 is the parameter             ;
;---------------------------------;
LCD_scrollDigit:
    push    AR1
    mov     a,  #'0'
LCD_scrollDigit_L1:
    lcall   LCD_writeData
    mov     R1, a                   ; put a somewhere else
    clr     c                       ; if R0 == a
    subb    a, R0
    jz      LCD_scrollDigit_L0
    mov     a, #0x10
    lcall   LCD_writeCommand        ; left shift cursor
    mov     a, R1
    inc     a
    lcall	sleep50
    cpl		LED_RED
    cpl		BUZZER
    sjmp    LCD_scrollDigit_L1
LCD_scrollDigit_L0:
	pop 	AR1
    ret

;---------------------------------;
; moves a square from A to B      ;
;---------------------------------;
moveSquare:
    push    AR1
    mov     R1, #0x8F
LCD_shiftNameOut_L1:
    lcall   LCD_clearTop        ; clear top half of the screen first
    mov     a,  R1              ; loop to print out each character in the name
    lcall   LCD_writeCommand
    mov     a,  #'['
    lcall   LCD_writeData
    mov     a,  #']'
    lcall   LCD_writeData
    cjne    R1, #0x83,  LCD_shiftNameOut_L0
    pop     AR1
    ret
LCD_shiftNameOut_L0:
    dec     R1                  ; decrement cursor position to the left
    lcall   sleep50             ; time delay
    cpl     LED_RED
    cpl     BUZZER
    sjmp    LCD_shiftNameOut_L1 ; loop

;---------------------------------;
; fancy animation for student ID  ;
;---------------------------------;
studentNumber:
    mov     a,  #0xCB
    lcall	LCD_writeCommand
    mov     dptr,   #data_stdid
studentNumber_L0:
    clr     a
    movc    a,  @a+dptr
    jz      studentNumber_return
    mov     R0, a
    lcall   LCD_scrollDigit
    lcall   LCD_back
    lcall   LCD_back
    inc     dptr
    sjmp    studentNumber_L0
studentNumber_return:
    ret

;---------------------------------;
; fancy animation for student ID  ;
;---------------------------------;
studentNumberArrow:
    push    AR0
    push    AR1
    mov     R0, #0xC0
    mov     R1, #0xCF
studentNumberArrow_L0:
    mov     a,  R0
    lcall   LCD_writeCommand
    mov     a,  R2
    lcall   LCD_writeData
    mov     a,  R1
    lcall   LCD_writeCommand
    mov     a,  R3
    lcall   LCD_writeData
    cjne    R0, #0xC3, studentNumberArrow_L1
    sjmp    studentNumberArrow_return
studentNumberArrow_L1:
    cjne    R1, #0xCB,  studentNumberArrow_L2
studentNumberArrow_return:
    pop     AR1
    pop     AR0
    ret
studentNumberArrow_L2:
    inc     R0
    dec     R1
    lcall   sleep50
    sjmp    studentNumberArrow_L0

;---------------------------------;
; Sound test                      ;
;---------------------------------;
tone:
soundtest_L1:
	mov		a,	R4
    mov     R2, a
soundtest_L0:
	cpl		BUZZER
    mov     a, R6
    mov     R1, a
X1:	mov		a,	R5
    mov		R0,	a
	lcall	sleepu
    djnz    R1, X1
	djnz	R2,	soundtest_L0
	djnz	R3,	soundtest_L1
	ret

;---------------------------------;
; We are number one               ;
; except it's on the AT89LP52     ;
;---------------------------------;
WANO:
	; D 196 cycles
    ; 23 * 37 us delay between half cycles
    mov		R3,	#4
    mov     R4, #55
    mov     R5, #23
    mov     R6, #38
	lcall	tone

    ; 1/2 rest
    mov     R0, #188
    lcall   sleep

    ; A 330 cycles, 8*71 delay
    mov     R3, #2
    mov     R4, #165
    mov     R5, #8
    mov     R6, #71
    lcall   tone

    ; G#
    mov     R3, #1
    mov     R4, #156
    mov     R5, #14
    mov     R6, #43
    lcall   tone

    ; A
    mov     R3, #1
    mov     R4, #165
    mov     R5, #8
    mov     R6, #71
    lcall   tone

    ; G#
    mov     R3, #1
    mov     R4, #156
    mov     R5, #14
    mov     R6, #43
    lcall   tone

    ; A
    mov     R3, #1
    mov     R4, #165
    mov     R5, #8
    mov     R6, #71
    lcall   tone

    ; G#
    mov     R3, #2
    mov     R4, #156
    mov     R5, #14
    mov     R6, #43
    lcall   tone

    ; A
    mov     R3, #2
    mov     R4, #165
    mov     R5, #8
    mov     R6, #71
    lcall   tone

    ; F 524 cycles, 4*179 delay
    mov     R3, #3
    mov     R4, #131
    mov     R5, #4
    mov     R6, #165
    lcall   tone

    ; D
    mov		R3,	#4
    mov     R4, #55
    mov     R5, #23
    mov     R6, #38
	lcall	tone

    ; 1/2 rest
    mov     R0, #188
    lcall   sleep

    ; D
    mov		R3,	#2
    mov     R4, #55
    mov     R5, #23
    mov     R6, #38
	lcall	tone

    ; F
    mov     R3, #2
    mov     R4, #131
    mov     R5, #4
    mov     R6, #165
    lcall   tone

    ; A
    mov     R3, #2
    mov     R4, #165
    mov     R5, #8
    mov     R6, #71
    lcall   tone

    ; A# 741 cycles,22*23 delay
    mov     R3, #6
    mov     R4, #93
    mov     R5, #22
    mov     R6, #26
    lcall   tone

    ; F
    mov     R3, #3
    mov     R4, #131
    mov     R5, #4
    mov     R6, #165
    lcall   tone

    ; A#
    mov     R3, #6
    mov     R4, #93
    mov     R5, #22
    mov     R6, #26
    lcall   tone

    ; C 785 cycles, 2 * 239 delay
    mov     R3, #6
    mov     R4, #93
    mov     R5, #22
    mov     R6, #23
    lcall   tone

    ; A
    mov     R3, #2
    mov     R4, #135
    mov     R5, #8
    mov     R6, #71
    lcall   tone

    ; A#
    mov     R3, #4
    mov     R4, #74
    mov     R5, #22
    mov     R6, #26
    lcall   tone

    ; A
    mov     R3, #2
    mov     R4, #135
    mov     R5, #8
    mov     R6, #71
    lcall   tone

    ; A#
    mov     R3, #4
    mov     R4, #74
    mov     R5, #22
    mov     R6, #26
    lcall   tone

    ; A
    mov     R3, #3
    mov     R4, #135
    mov     R5, #8
    mov     R6, #71
    lcall   tone
    
    ; 1/2 rest
    mov     R0, #188
    lcall   sleep
    lcall	sleep
    mov		a,	R7
	jz    	WANO_return
	dec		R7
    ljmp	WANO
WANO_return:
	ret

;###################################
;# Main functions                  #
;# SETUP function runs onces       #
;###################################
setup:
    mov     SP,     #7FH
    mov     PMOD,   #0
    lcall   LCD_configure_4bit
    lcall	LCD_shiftCursor
    mov     R4,     #3

;---------------------------------;
; Main functions                  ;
; LOOP function runs forever      ;
;---------------------------------;
loop:
	lcall	LCD_clear
	lcall	LCD_home

    ;-[ Main code goes here ]-------------;
    mov     a,      #0x8F
    lcall   LCD_writeCommand
    lcall   moveSquare
    lcall   sleep50

    mov     a,      #0x84
    lcall   LCD_writeCommand
    mov     dptr,   #data_name1
    lcall   LCD_printMore
    lcall   sleep50

    mov     a,      #0xC4
    lcall   LCD_writeCommand
    mov     dptr,   #data_number1
    lcall   LCD_print
    lcall   sleep50

    lcall   studentNumber
    lcall   sleeps

    mov     a,      #0x84
    lcall   LCD_writeCommand
    mov     dptr,   #data_name2
    lcall   LCD_print
    mov     a,      #0x84
    lcall   LCD_writeCommand
    mov     dptr,   #data_name3
    lcall   LCD_print

    mov     R0,     #4
loop_loop1:
    mov     R2,     #'>'
    mov     R3,     #'<'
    lcall   studentNumberArrow
    lcall   sleep50
    mov     R2,     #' '
    mov     R3,     #' '
    lcall   studentNumberArrow
    lcall   sleep50
    djnz    R0, loop_loop1

    mov     R2,     #'>'
    mov     R3,     #'<'
    lcall   studentNumberArrow
    lcall   sleeps

    mov     a,      #0x84
    lcall   LCD_writeCommand
    mov     dptr,   #data_name2
    lcall   LCD_print
    mov     a,      #0x84
    lcall   LCD_writeCommand
    mov     dptr,   #data_name1
    lcall   LCD_print
    lcall   sleeps

    mov     a,      #0xCF
    lcall	LCD_writeCommand
    mov     dptr,   #string1
    lcall   LCD_shiftDisplay
    lcall   LCD_print
    lcall   LCD_clear
    lcall   LCD_home
    lcall   LCD_shiftCursor
    mov 	dptr,	#string2
    lcall	LCD_print
    mov 	a,		#0xC3
    lcall	LCD_writeCommand
    mov		dptr,	#string3
    lcall	LCD_print
    lcall	sleeps
	
	mov 	R7,	#1
    lcall   WANO

    ljmp    loop

; end of program
END
