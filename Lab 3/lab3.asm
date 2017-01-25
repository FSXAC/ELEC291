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

DSEG at 30H
    result: ds 		2
    bcd:	ds 		5
    x:		ds 		4
    y:		ds		4

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

; loops forever
loop:
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
    sleep(#50)

    ; convert result into BCD
    mov     x,      result
    mov     x+1,    result+1
    mov     x+2,    #0x00
    mov     x+3,    #0x00
    lcall   hex2bcd
    mov     result,     bcd
    mov     result+1,   bcd+1

    ; ignore 0 values because it's not right
    mov		a,	result
   	jnz		loop_putBCD
   	mov 	a,	result+1
   	jnz		loop_putBCD
   	ljmp	loop

loop_putBCD:
    ; print BCD for ADC value
    putBCD(result+1)
    putBCD(result)
    mov     a,  #'\r'
    lcall   putChar
    mov     a,  #'\n'
    lcall   putChar

    ; compute Vout
    ; x is already loaded
    Load_y(50000)                    ; * 5000mV reference
    lcall   mul32
    Load_y(1023)                    ; / 1023 ratio
    lcall   div32
    Load_y(27300)                     ; - 273mV voltage to convert to celcius
    lcall	sub32
    lcall   hex2bcd
    putBCD(bcd+1)
    putBCD(bcd)
    
    ; print terminating string
    mov     a,  #'\r'
    lcall   putChar
    mov     a,  #'\n'
    lcall   putChar
    ljmp	loop
END
