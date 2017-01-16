$NOLIST
$MODLP52
$LIST

; Timing
CLK             equ 221218400   ; Crystal frequency
TIMER0_RATE     equ 4096        ; Generate 2048Hz squarewave
TIMER0_RELOAD   equ ((65536-(CLK/TIMER0_RATE)))
TIMER2_RATE     equ 1000        ; 1000Hz for the audio
TIMER2_RELOAD   equ ((65536-(CLK/TIMER2_RATE)))

; Pin assignment
PIN_BOOT        equ P4.5
PIN_SOUND       equ P3.7
PIN_UPDOWN      equ P0.0

; Vectors
; reset
org 0x0000
    ljmp    setup

; Timer / Counter 0 overflow interrupt vector
org 0x000B
    ljmp    timer0_ISR

; Timer / Counter 2 overflow interrupt vector
org 0x002B
    ljmp    timer2_ISR

; Direct access variables (from 0x30 to 0x7F)
desg            at 0x30
dount1ms:       ds 2            ; used to check if 1/2 second has passed
BCD_counter     ds 1            ; BCD counter incremented in ISR

; 1-bit variables
bseg
half_seconds_flag:  dbit 1

; LCD pin assignment
cseg
LCD_RS  equ P1.2
LCD_RW  equ P1.3
LCD_E   equ P1.4
LCD_D4  equ P3.2
LCD_D5  equ P3.3
LCD_D6  equ P3.4
LCD_D7  equ P3.5

; LCD library
$NOLIST
$include(LCD_4bit2.inc)
$LIST

; LCD strings
initmsg:
    db  'BCD_counter: xx ', 0

;---------------------------------;
; Routine to initialize the ISR   ;
; for timer 0                     ;
;---------------------------------;
timer0_init:
    ; clear bits for the timer
    mov a,      TMOD
    anl a,      #0xF0
    orl a,      #0x01
    mov TMOD,   a

    ; set reload value
    mov TH0,    #high(TIMER0_RELOAD)
    mov TL0,    #low(TIMER0_RELOAD)

    ; enable interrupts
    setb    ET0
    setb    TR0
    ret

;---------------------------------;
; ISR for timer 0.  Set to execute;
; every 1/4096Hz to generate a    ;
; 2048 Hz square wave at pin P3.7 ;
;---------------------------------;
timer0_ISR:
    ; operating in mode 1, reload the timer
    clr     TR0
    mov     TH0,    #high(TIMER0_RELOAD)
    mov     TL0,    #low(TIMER0_RELOAD)
    setb    TR0
    cpl     SOUND_OUT
    reti

;---------------------------------;
; Routine to initialize the ISR   ;
; for timer 2                     ;
;---------------------------------;
timer2_init:
    ; stops timer/counter, reload mode
    mov     T2CON,  #0
    mov     RCAP2H, #high(TIMER2_RELOAD)
    mov     RCAP2L, #low(TIMER2_RELOAD)

    ; init 1ms interrupt counter (16-bit made with 2 8-bits)
    clr     a
    mov     count1ms+0, a
    mov     count1ms+1, a

    ; enable timer and interrupt
    setb    ET2
    setb    TR2
    ret
