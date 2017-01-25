$MODLP52
org 0000H
    ljmp    setup

; imports
$include(math32.inc)
$include(macros.inc)
;$include(LCD_4BIT.inc)

CLK     equ     22118400
BAUD    equ     115200
T1LOAD  equ     (0x100-CLK/(16*BAUD))

; pins for ADCs
ADC_CE      equ     P2.0
ADC_MOSI    equ     P2.1
ADC_MISO    equ     P2.2
ADC_SCLK    equ     P2.3

; strings
msg:
    db      'THE END IS NEVER ', 0
msg_endl:
    db      '\r', '\n', 0
msg_start:
    db      '> BCD Value: ', 0

DSEG at 30H
    result: ds 		2
    bcd:	ds 		5
    x:		ds 		4
    y:		ds		4
    count:	ds		1

BSEG
	mf:		dbit 	1

CSEG


; configure serial port and baudrate using timer 1
InitSerialPort:
    ; debounce reset button
    mov     R1,     #222
    mov     R0,     #166
    djnz    R0,     $
    djnz    R1,     $-4
    ; set timer
    clr     TR1
    anl     TMOD,   #0x0f
    orl	    TMOD,   #0x20
    orl	    PCON,   #0x80
    mov	    TH1,    #T1LOAD
    mov	    TL1,    #T1LOAD
    setb    TR1
    mov	    SCON,   #0x52
    ret

; send character using serial port
putChar:
    jnb     TI,     putchar
    clr     TI
    mov     SBUF,   a
    ret

; send a string using serial port
putString:
    clr     a
    movc    a,  @a+dptr
    jz      putString_return
    lcall   putChar
    inc     dptr
    sjmp    putString
putString_return:
    ret

; initialize SPI
SPIinit:
    setb    ADC_MISO
    clr     ADC_SCLK
    ret

; send byte in R0, receive byte in R1
SPIcomm:
    push    ACC
    mov     R1,     #0
    mov     R2,     #8
SPIcomm_loop:
    mov     a,      R0
    rlc     a
    mov     R0,     a
    mov     ADC_MOSI,   c
    setb    ADC_SCLK
    mov     c,      ADC_MISO
    mov     a,      R1
    rlc     a
    mov     R1,     a
    clr     ADC_SCLK
    djnz    R2,     SPIcomm_loop
    pop     ACC
    ret

; main program
setup:
    mov     SP,     #7FH
    mov     PMOD,   #0

    ; initialize MCP3008
    setb    ADC_CE
    lcall   SPIInit
    lcall   InitSerialPort

    mov		count,	#0xA0

loop:
	mov	 	a,	count
	add		a,	#0x99
	da		a
	mov 	count,	a

    clr     ADC_CE
    ; starting bit is 1
    mov     R0,         #0x01
    lcall   SPIcomm

    ; read channel 0 & save to result, only care about lower 2 bits
    ; read xxxxxxRR xxxxxxxx
    mov     R0,         #0x80
    lcall   SPIcomm
    mov     a,          R1
    anl     a,          #0x03
    mov     result+1,   a

    ; read rest of 8-bits
    ; read xxxxxxxx RRRRRRRR
    mov     R0,         #0x55       ; doesn't matter
    lcall   SPIcomm
    mov     result,     R1
    setb    ADC_CE
    sleep(#250)

    ; do something with result
    ; print starting string
    putBCD(count)
    mov     dptr,   #msg_start
    lcall   putString

    ; convert result into BCD
    mov     x,      result
    mov     x+1,    result+1
    mov     x+2,    #0x00
    mov     x+3,    #0x00
    lcall   hex2bcd
    mov     result,     x
    mov     result+1,   x+1

    ; print BCD
    putBCD(result+1)
    putBCD(result)

    ; print terminating string
    mov     dptr,   #msg_endl
    lcall   putString

    ; countdown timeout
    mov 	a,	count
    cjne 	a,	#0x00,	loop1
    sjmp	$
loop1:	ljmp	loop
END
