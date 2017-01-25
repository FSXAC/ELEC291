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

; pins for shift register
LED_DATA    equ     P2.4
LED_LATCH   equ     P2.5
LED_CLK     equ     P2.6
LED_CLR     equ     P2.7

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

    ; shift register
    clr     LED_DATA
    clr     LED_LATCH
    clr     LED_CLK
    clr     LED_CLR
    sleep(#2)
    setb    LED_CLR

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

    ; toggle things into shift register

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
    Load_y(48500)                    ; * 2000mV reference
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

    ; output to LED
    mov     x,      bcd
    mov     x+1,    bcd+1
    mov     x+2,    bcd+2
    mov     x+3,    bcd+3
    Load_y(1000)
    lcall   LED_low1
;     lcall   x_gteq_y
;     jnb     mf,     low1
;     Load_y(1500)
;     lcall   x_gteq_y
;     jnb     mf,     low2
;     Load_y(2000)
;     lcall   x_gteq_y
;     jnb     mf,     low3
;     Load_y(3000)
;     lcall   x_gteq_y
;     jnb     mf,     low4
;     Load_y(4000)
;     lcall   x_gteq_y
;     jnb     mf,     med1
;     Load_y(5000)
;     lcall   x_gteq_y
;     jnb     mf,     med2
;     Load_y(6000)
;     lcall   x_gteq_y
;     jnb     mf,     high1
;     Load_y(7000)
;     lcall   x_gteq_y
;     jnb     mf,     high2
;     ljmp	loop
; low1:
;     lcall   LED_low1
;     ljmp    loop
; low2:
;     lcall   LED_low2
;     ljmp    loop
; low3:
;     lcall   LED_low3
;     ljmp    loop
; low4:
;     lcall   LED_low4
;     ljmp    loop
; med1:
;     lcall   LED_med1
;     ljmp    loop
; med2:
;     lcall   LED_med2
;     ljmp    loop
; high1:
;     lcall   LED_high1
;     ljmp    loop
; high2:
;     lcall   LED_high2
    ljmp	loop

LED_low1:
    clr     LED_CLR
    clr     LED_CLK
    clr     LED_LATCH
    setb    LED_DATA
    setb    LED_CLR
    
    cpl     LED_CLK
    cpl     LED_CLK
    clr     LED_DATA
    cpl     LED_CLK
    cpl     LED_CLK
    cpl     LED_CLK
    cpl     LED_CLK
    cpl     LED_CLK
    cpl     LED_CLK
    cpl     LED_CLK
    cpl     LED_CLK
    cpl     LED_CLK
    cpl     LED_CLK
    cpl     LED_CLK
    cpl     LED_CLK
    cpl     LED_CLK
    cpl     LED_CLK
    setb    LED_LATCH
END
