; Blinky.asm: toggles an LED attached to pin 17 (P3.7)
$MODLP52

org 0000H
    ; start of a program
    ljmp myprogram

org 001BH
	ljmp 0x181b

; When using a 22.1184MHz crystal in fast mode
; one cycle takes 1.0/22.1184MHz = 45.21123 ns
WaitHalfSec:
    mov  R2, #(89 * 2)
L3: mov  R1, #250
L2: mov  R0, #166

; decrement R0 and jump to L1 if R0 is not 0
L1: djnz R0, L1     ; 3 cycles->3*45.21123ns*166=22.51519us
    djnz R1, L2     ; 22.51519us*250=5.629ms
    djnz R2, L3     ; 5.629ms*89=0.5s (approximately)
    ret

Strobe:
    cpl P3.7
    mov R2, #12
L6: mov  R1, #250
L5: mov  R0, #166
L4: djnz R0, L4
    djnz R1, L5
    djnz R2, L6
    cpl P3.7
    ret

myprogram:
    mov  SP, #7FH
    mov  PMOD, #0    ; Configure all ports in bidirectional mode
M0:
    lcall Strobe
    lcall WaitHalfSec
    sjmp M0
END
