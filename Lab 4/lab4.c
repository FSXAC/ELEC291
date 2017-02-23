// lab 4

// libarries
#include <C8051F38x.h>
#include <stdio.h>

// timing
#define SYSCLK    24000000L // SYSCLK frequency in Hz
#define BAUDRATE    115200L // Baud rate of UART in bps

// pin assignments
#define LCD_RS P2_2
#define LCD_RW P2_1 // Not used in this code
#define LCD_E  P2_0
#define LCD_D4 P1_3
#define LCD_D5 P1_2
#define LCD_D6 P1_1
#define LCD_D7 P1_0
#define LCD_A  P0_7
#define LCD_K  P0_6
#define CHARS_PER_LINE 16

// init function
char _c51_external_startup (void) {
    PCA0MD &= (~0x40) ;    // DISABLE WDT: clear Watchdog Enable bit
    VDM0CN  = 0x80; // enable VDD monitor
    RSTSRC  = 0x02|0x04; // Enable reset on missing clock detector and VDD

    // CLKSEL&=0b_1111_1000; // Not needed because CLKSEL==0 after reset
    #if (SYSCLK == 12000000L)
        //CLKSEL|=0b_0000_0000;  // SYSCLK derived from the Internal High-Frequency Oscillator / 4
    #elif (SYSCLK == 24000000L)
        CLKSEL|=0b_0000_0010; // SYSCLK derived from the Internal High-Frequency Oscillator / 2.
    #elif (SYSCLK == 48000000L)
        CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
    #else
        #error SYSCLK must be either 12000000L, 24000000L, or 48000000L
    #endif
    OSCICN  |= 0x03; // Configure internal oscillator for its maximum frequency
    P0MDOUT |= 0x10; // Enable Uart TX as push-pull output
    P1MDOUT |= 0b_0000_1111; // LCD's D4 to D7 are connected to P1.3 to P1.0
    P2MDOUT |= 0b_0000_0111; // P2.2 is LCD's RS, P2.1 is LCD's RW, P2.0 is LCD's E
    XBR0     = 0x01; // Enable UART on P0.4(TX) and P0.5(RX)
    XBR1     = 0x40; // Enable crossbar and weak pull-ups

    #if (SYSCLK/BAUDRATE/2L/256L < 1)
        TH1    = 0x10000-((SYSCLK/BAUDRATE)/2L);
        CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
        CKCON |= 0x08;
    #elif (SYSCLK/BAUDRATE/2L/256L < 4)
        TH1    = 0x10000-(SYSCLK/BAUDRATE/2L/4L);
        CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 01
        CKCON |= 0x01;
    #elif (SYSCLK/BAUDRATE/2L/256L < 12)
        TH1    = 0x10000-(SYSCLK/BAUDRATE/2L/12L);
        CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 00
    #else
        TH1    = 0x10000-(SYSCLK/BAUDRATE/2/48);
        CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 10
        CKCON |= 0x02;
    #endif

    TL1   = TH1;     // Init timer 1
    TMOD &= 0x0f;  // TMOD: timer 1 in 8-bit autoreload
    TMOD |= 0x20;
    TR1   = 1;       // Start timer1
    SCON  = 0x52;

    return 0;
}

// using timer3 to delay <us> micro-seconds
void delayUs(unsigned char us) {
    // microsecond counter
    unsigned char i;

    // input for timer 3 is selected as SYSCLK by setting T3ML (bit 6) of CKCON
    CKCON |= 0x40;

    // set overflow / reload value for timer3
    TMR3RL = (-(SYSCLK)/1000000L);

    // Initialize timer3 for first overflow
    TMR3 = TMR3RL;

    // start timer 3, and wait for overflow
    TMR3CN = 0x04;
    for (i = 0; i < us; i++) {
        while (!(TMR3CN & 0x80));
        TMR3CN &= ~(0x80);
    }

    // stop timer3 and clear overflow
    TMR3CN = 0;
}

// delay microseconds
void delay(unsigned int ms) {
    unsigned int i;
    unsigned char j;
    for (i = 0; i < ms; i++) for (j = 0; j < 4; j++) delayUs(250);
}

// port IO initialization
void PORT_init(void) {
    // enable UTX as push-pull output
    P0MDOUT |= 0x10;

    // enable UART on P0.4(TX) and P0.5(RX)
    XBR0     = 0x01;

    // Enable crossbar and weak pull-ups
    XBR1     = 0x40;
}

// oscillator initialization
void SYSCLK_init(void) {
    CKLSEL |= 0x03;
    OSCICN |= 0x03;
    RSTSRC  = 0x04;
}

// UART0 initialization
void UART0_init(void) {
    SCON0  = 0x10;
    TH1    = 0x10000 - ((SYSCLK / BAUDRATE) / 2L);
    CKCON &= ~0x0B;
    CKCON |= 0x08;
    TL1    = TH1;
    TMOD  &= ~0xF0;
    TMOD  |= 0x20;
    TR1    = 1;
    TI     = 1;
}

// pulse LCD clock
void LCD_pulse(void) {
    LCD_E = 1;
    delayUs(40);
    LCD_E = 0;
}

// send byte to LCD
void LCD_byte(unsigned char x) {
    // put x in the accumulator
    ACC    = x;
    LCD_D7 = ACC_7;
    LCD_D6 = ACC_6;
    LCD_D5 = ACC_5;
    LCD_D4 = ACC_4;
    LCD_pulse();
    delayUs(40);
    ACC    = x;
    LCD_D7 = ACC_3;
    LCD_D6 = ACC_2;
    LCD_D5 = ACC_1;
    LCD_D4 = ACC_0;
    LCD_pulse();
}

// write data to LCD
void LCD_write(unsigned char x) {
    LCD_RS = 1;
    LCD_byte(x);
    delay(2);
}

// send command to LCD
void LCD_cmd(unsigned char x) {
    LCD_RS = 0;
    LCD_byte(x);
    delay(5);
}

// initialize the LCD in 4 bit mode
void LCD_init(void) {
    LCD_E = 0;
    LCD_RW = 0;
    LCD_A  = 0;
    LCD_K  = 1;
    delay(20);

    // First make sure the LCD is in 8-bit mode and then change to 4-bit mode
    LCD_cmd(0x33);
    LCD_cmd(0x33);
    LCD_cmd(0x32);

    // Configure the LCD
    LCD_cmd(0x28);
    LCD_cmd(0x0c);
    LCD_cmd(0x01);
    delay(20);
}

void LCD_print(char *string, unsigned char line, bit clear) {
    int j = 0;
    LCD_cmd(line == 2 ? 0xc0: 0x80);
    delay(5);

    // for (j = 0; string[j] != 0; j++) {
    //     LCD_write(string[j]);
    // }
    // while (*string != 0) LCD_write(*string++);

    while (string[j] != 0) LCD_write(string[j++]);
    if (clear) for (; j < CHARS_PER_LINE; j++) LCD_write(' ');
}

void main(void) {
    PCA0MD &= ~0x40;
    // initialize a bunch of stuff
    PORT_init();
    SYSCLK_init();
    UART0_init();
    LCD_init();

    // print to LCD
    LCD_print("This is a test", 1, 1);
    LCD_print("Well Well Well", 2, 1);

    // print to terminal
    printf("Hello bitch!\r\n");
}
