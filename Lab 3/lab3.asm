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
    db      'Voltage: ', 0

DSEG at 30H
    result: ds 		2
    bcd:	ds 		1
    x:		ds 		1
    y:		ds		1

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
    mov     R1,     #0
    mov     R2,     #8
SPIcomm_loop:
    mov     a,      R0
    rlc     a
    mov     R0,     a
    mov     ADC_MOSI,   c
    setb    ADC_MISO
    mov     c,      ADC_MISO
    mov     a,      R1
    rlc     a
    mov     R1,     a
    clr     ADC_SCLK
    djnz    R2,     SPIcomm_loop
    ret

; main program
setup:
    mov     SP,     #7FH
    mov     PMOD,   #0

    ; initialize MCP3008
    setb    ADC_CE
    lcall   SPIInit
    lcall   InitSerialPort

loop:
    clr     ADC_CE

    ; starting bit is 1
    mov     R0,         #0x01
    lcall   SPIcomm

    ; read channel 0 & save to result, only care about lower 2 bits
    mov     R0,         #0x80
    lcall   SPIcomm
    mov     a,          R1
    anl     a,          #0x03
    mov     result+1,   a

    ; read rest of 8-bits
    mov     R0,         #0x00 ; doesn't matter
    lcall   SPIcomm
    mov     result,     R1

    setb    ADC_CE
    sleep(#50)

    ; do something with result
    mov     dptr,   #msg_start
    lcall   putString

    ; convert result into BCD
    mov     a,      result
    da      a
    mov     result, a

    ; print BCD
    putBCD(result)

    mov     dptr,   #msg_endl
    lcall   putString
    ljmp    loop


END
