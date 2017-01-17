cseg
; When using a 22.1184MHz crystal in fast mode
; one cycle takes 1.0/22.1184MHz = 45.21123 ns

;---------------------------------;
; Wait 40 microseconds            ;
;---------------------------------;
sleep40us:
	push   AR0
	mov    R0, #177
sleep40us_L0:
	nop
	nop
	djnz   R0, sleep40us_L0 ; 1+1+3 cycles->5*45.21123ns*177=40us
	pop    AR0
    ret

;---------------------------------;
; Wait 'R2' milliseconds          ;
;---------------------------------;
sleep mac
	push   AR2
	mov    R2, %0
	lcall  ?sleep
	pop    AR2
endmac

?sleep:
	push   AR0
	push   AR1
sleep_L2:
    mov    R1, #45
sleep_L1:
    mov    R0, #166
sleep_L0:
    djnz   R0, sleep_L0 ; 3 cycles->3*45.21123ns*166=22.51519us
    djnz   R1, sleep_L1 ; 22.51519us*45=1.013ms
    djnz   R2, sleep_L2 ; number of millisecons to wait passed in R2
    pop    AR1
    pop    AR0
    ret

;---------------------------------;
; Toggles the 'E' pin in the LCD  ;
;---------------------------------;
LCD_pulse:
	setb   LCD_E
	lcall  sleep40us
	clr    LCD_E
    ret

;---------------------------------;
; Writes acc to LCD in 4-bit mode ;
;---------------------------------;
LCD_byte:
	; Write high 4 bits first
	mov    c,      ACC.7
	mov    LCD_D7, c
	mov    c,      ACC.6
	mov    LCD_D6, c
	mov    c,      ACC.5
	mov    LCD_D5, c
	mov    c,      ACC.4
	mov    LCD_D4, c
    lcall  LCD_pulse
    lcall  sleep40us

	; Write low 4 bits next
	mov    c,      ACC.3
	mov    LCD_D7, c
	mov    c,      ACC.2
	mov    LCD_D6, c
	mov    c,      ACC.1
	mov    LCD_D5, c
	mov    c,      ACC.0
	mov    LCD_D4, c
    lcall  LCD_pulse
	ret

;---------------------------------;
; Write data to LCD               ;
;---------------------------------;
LCD_writeData mac
	mov    a,  %0
	lcall  ?LCD_writeData
endmac

?LCD_writeData:
	setb   LCD_RS
	ljmp   LCD_byte

;---------------------------------;
; Write command to LCD            ;
;---------------------------------;
LCD_writeCmd mac
	mov    a,  %0
	lcall  ?LCD_writeCmd
endmac

?LCD_writeCmd:
	clr    LCD_RS
	ljmp   LCD_byte

;---------------------------------;
; Configure LCD in 4-bit mode     ;
;---------------------------------;
LCD_configure4Bit:
	clr    LCD_E   ; Resting state of LCD's enable pin is zero
	clr    LCD_RW  ; We are only writing to the LCD in this program

	; After power on, let the LCD start up before initializing
	; NOTE: the preprogrammed power-on delay of 16 ms on the AT89LP52
	; seems to be enough.  That is why this line is commented out.
	; Wait_Milli_Seconds(#40)

	; First make sure the LCD is in 8-bit mode and then change to 4-bit mode
	LCD_writeCmd(#0x33)
	LCD_writeCmd(#0x33)
	LCD_writeCmd(#0x32) ; change to 4-bit mode

	; Configure the LCD
	LCD_writeCmd(#0x28)
	LCD_writeCmd(#0x0c)
	LCD_writeCmd(#0x01) ;  Clear screen command (takes some time)

    ;Wait for the clear screen command to finish.
	sleep(#2)
    ret

;---------------------------------;
; Send a constant string to LCD   ;
;---------------------------------;
LCD_printStr mac
    push    dph
    push    dpl
    push    acc
    mov     dptr,   %0
    lcall   ?LCD_printStr
    pop     acc
    pop     dpl
    pop     dph
endmac

?LCD_printStr:
    clr     a
    movc    a,      @a+dptr
    jz      ?LCD_printStr_return
    lcall   ?LCD_writeData
    inc     dptr
    sjmp    ?LCD_printStr
?LCD_printStr_return:
    ret

;---------------------------------;
; Set LCD cursor at row, column   ;
;---------------------------------;
LCD_setCursor mac
    push    acc
    mov     a,  #%1
    dec     a
    lcall   ?LCD_setCursor_%0   ; Select column and row
    pop     acc
endmac

?LCD_setCursor_2:
    orl     a,  #01000000B
?LCD_setCursor_1:
    orl     a,  #10000000B
    ljmp    ?LCD_writeCmd       ; Select column and row

;---------------------------------;
; Display a BCD number in the LCD ;
;---------------------------------;
LCD_printBCD mac
    push    ar0
    mov     r0,     %0
    lcall   ?LCD_printBCD
    pop     ar0
endmac

?LCD_printBCD:
    push    acc

    ; Write most significant digit
    mov     a,      r0
    swap    a
    anl     a,      #0fh
    orl     a,      #30h
    lcall   ?LCD_writeData

    ; write least significant digit
    mov     a,      r0
    anl     a,      #0fh
    orl     a,      #30h
    lcall   ?LCD_writeData
    pop     acc
    ret

;------------------------------------;
; Display a char in the LCD          ;
;------------------------------------;
LCD_printCh mac
    push    acc
    mov     a,      %0
    lcall   ?LCD_writeData
    pop     acc
endmac
