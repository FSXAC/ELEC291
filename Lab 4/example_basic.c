/* SIMPLE PROGRAM TO PRINT 'HELLO WORLD' VIA UART
*/

#include <C8051f38x.h>
#include <stdio.h>

#define SYSCLK      48000000L  // SYSCLK frequency in Hz
#define BAUDRATE      115200L  // Baud rate of UART in bps

void PORT_Init (void) {
    P0MDOUT |= 0x10; // Enable UTX as push-pull output
    XBR0     = 0x01; // Enable UART on P0.4(TX) and P0.5(RX)
    XBR1     = 0x40; // Enable crossbar and weak pull-ups
}

void SYSCLK_Init (void) {
    CLKSEL |= 0b_0000_0011; // SYSCLK derived from Internal HF Osc / 1.
    OSCICN |= 0x03;   // Configure internal oscillator for its maximum
    RSTSRC  = 0x04;   // Enable missing clock detector
}

void UART0_Init (void) {
    SCON0  = 0x10;
    TH1    = 0x10000-((SYSCLK/BAUDRATE)/2L);
    CKCON &= ~0x0B; // T1M = 1; SCA1:0 = xx
    CKCON |= 0x08;
    TL1    = TH1;      // Init Timer1
    TMOD  &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
    TMOD  |= 0x20;
    TR1    = 1; // START Timer1
    TI     = 1;  // Indicate TX0 ready
}

void main (void) {
    PCA0MD &= ~0x40; // WDTE = 0 (clear watchdog timer enable)
    PORT_Init();     // Initialize Port I/O
    SYSCLK_Init ();  // Initialize Oscillator
    UART0_Init();    // Initialize UART0
    printf("Hello, world!\r\n");
}
