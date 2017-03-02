// lab 4

// libraries
#include <C8051F38x.h>
#include <stdio.h>
#include <Math.h>
#include "lab4.h"

unsigned char overflow_count;
double bin[3];
double bin_sum;
int bin_index = 0;

void main(void) {
    unsigned long freq;
    double freq_prime;
    double capacitance;
    int sample_time;
    char string_buffer [20];

    char unit_prefix[]     = "pnum";
    int unit_prefix_select = 2;
    double unit_prefix_mult;

    double impedence;

    // moving average
    int x;
    double freq_ave;

    // technicall start
    PCA0MD &= ~0x40;

    // initialize a bunch of stuff
    PORT_init();
    SYSCLK_init();
    UART0_init();
    TIMER0_init();
    LCD_init();

    sample_time = 100;

    // print to terminal
    while (1) {
        // reset clock
        TL0 = 0;
        TH0 = 0;
        overflow_count = 0;

        // start clock
        TF0 = 0;
        TR0 = 1;
        delay(sample_time);

        // stop timer
        TR0 = 0;

        // compute frequency
        freq_prime = (overflow_count * 0x10000L + TH0 * 0x100L + TL0) * 1000.0 / sample_time;
        freq = freq_prime;

        // resample capacitors that are too small/large
        if (freq < 1)           continue;
        else if (freq < 5)      sample_time = 3000;
        else if (freq < 30)     sample_time = 500;
        else                    sample_time = 300;

        // compute average of last 5 records
        bin[bin_index] = freq_prime;
        bin_index = bin_index == 2 ? 0 : bin_index + 1;
        bin_sum = 0;
        for (x = 0; x < 3; x++) {
            bin_sum += bin[bin_index];
        }
        freq_ave = bin_sum / 3;

        // compute capacitance 295.32 = 1.44 / (RA + 2RB) * 1E6 (or other unit prefix)
        capacitance = 295.3200 / freq_ave;

        // select appropriate prefix
        switch (unit_prefix_select) {
            case 0: unit_prefix_mult = 1000L * 1000L; break;
            case 1: unit_prefix_mult = 1000; break;
            case 2: unit_prefix_mult = 1; break;
            case 3: unit_prefix_mult = 0.001; break;
            default: unit_prefix_mult = 1;
        }
        capacitance *= unit_prefix_mult;


        // find the appropriate display config (units)
        while (capacitance <= 0.8 && unit_prefix_select > 0) {
            capacitance *= 1000;
            unit_prefix_select--;
        }
        while (capacitance > 800 && unit_prefix_select < 2) {
            capacitance /= 1000;
            unit_prefix_select++;
        }

        // output capacitance via SPI
        printf("$%lu,%f,%cF\n", freq, capacitance, unit_prefix[unit_prefix_select]);

        // output capacitance to LCD
        if (BTN_0) {
            LCD_print("[] Impedence:", 1, 1);
            switch (unit_prefix_select) {
                case 0: impedence = capacitance / 1000 / 1000 / 1000 / 1000 * freq * 2 * M_PI; break;
                case 1: impedence = capacitance / 1000 / 1000 / 1000 * freq * 2 * M_PI; break;
                case 2: impedence = capacitance / 1000 / 1000 * freq * 2 * M_PI; break;
                case 3: impedence = capacitance / 1000 * freq * 2 * M_PI; break;
                default: impedence = 1;
            }
            impedence = -1.0 / impedence;

            if (BTN_2) sprintf(string_buffer, "|| Z=%.2f%c-90%c%c", abs(impedence), 0xDA, 0xDF, 0xF4);
            else sprintf(string_buffer, "|| Z=%.2fj%c", impedence, 0xF4);
        } else if (BTN_1) {
            // show frequency
            LCD_print("Frequency:", 1, 1);
            if (BTN_2) sprintf(string_buffer, "W=%.2f rad/s", freq * 2 * M_PI);
            else sprintf(string_buffer, "f=%luHz", freq);
        } else {
            LCD_print("[] Capacitance:", 1, 1);
            sprintf(string_buffer, "|| C=%.4f%cF", capacitance, unit_prefix[unit_prefix_select]);
        }

        LCD_print(string_buffer, 2, 1);
    }
}

// port IO initialization
void PORT_init(void) {
    // enable UTX as push-pull output
    P0MDOUT |= 0x10;

    // enable UART on P0.4(TX) and P0.5(RX)
    XBR0 = 0b_0000_0001;

    // Enable crossbar and weak pull-ups
    XBR1 = 0b_0101_0000;
    XBR2 = 0b_0000_0000;
}

// oscillator initialization
void SYSCLK_init(void) {
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
    	OSCICN |= 0x03;   // Configure internal oscillator for its maximum frequency
    	RSTSRC  = 0x04;   // Enable missing clock detector
}

// UART0 initialization
void UART0_init(void) {
    SCON0 = 0x10;
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
        TL1   = TH1;      // Init Timer1
        TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
        TMOD |= 0x20;
        TR1   = 1; // START Timer1
        TI    = 1;  // Indicate TX0 ready
}

// ubutuakuze timer 0
void TIMER0_init(void) {
    TMOD &= 0b_1111_0000; // Set the bits of Timer/Counter 0 to zero
    TMOD |= 0b_0000_0101; // Timer/Counter 0 used as a 16-bit counter
    TR0   = 0; // Stop Timer/Counter 0
}

// using timer3 to delay <us> micro-seconds
void delayUs(unsigned char us) {
    // microsecond counter
    unsigned char i;

    // input for timer 3 is selected as SYSCLK by setting T3ML (bit 6) of CKCON
    CKCON |= 0b_0100_0000;

    // set overflow / reload value for timer3
    TMR3RL = (-(SYSCLK)/1000000L);

    // Initialize timer3 for first overflow
    TMR3 = TMR3RL;

    // start timer 3, and wait for overflow
    TMR3CN = 0x04;
    for (i = 0; i < us; i++) {
        while (!(TMR3CN & 0x80));
        TMR3CN &= ~(0x80);

        // Check overflow of Timer/Counter 0
        if (TF0 == 1) {
            TF0 = 0;
            overflow_count++;
        }
    }
    TMR3CN = 0;
}

// delay microseconds
void delay(unsigned int ms) {
    unsigned int j;
    for (j = ms; j != 0; j--) {
        delayUs(249);
        delayUs(249);
        delayUs(249);
        delayUs(250);
    }
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

// prints a string to LCD
void LCD_print(char *string, unsigned char line, bit fillLine) {
    int j = 0;
    LCD_cmd(line == 2 ? 0xc0: 0x80);
    delay(3);

    // for (j = 0; string[j] != 0; j++) {
    //     LCD_write(string[j]);
    // }
    // while (*string != 0) LCD_write(*string++);

    while (string[j] != 0) LCD_write(string[j++]);
    if (fillLine) for (; j < CHARS_PER_LINE; j++) LCD_write(' ');
}
