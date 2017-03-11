// system constants
#define SYSCLK 24000000L
#define BAUDRATE 115200L

// make programmer's life easier preprocessors
#define HIGH 1
#define LOW 0

// function prototypes
/* C51 bullshit */
char _c51_external_startup(void);

/* delay microseconds */
void delayUs(unsigned char us);

/* delay milliseconds */
void delay(unsigned int ms);

/* ===[MAX7219 CONTROL]=== */
#define LED_CS P2_5
#define LED_DATA P2_4
#define LED_CLK P2_3

#define LED_INTENSITY 0x01

/* Toggles CS */
void LED_pulse(void);

/* send one byte */
void LED_spi(unsigned char value);

/* clear all MAX7219s */
void LED_clear(void);

/* initialize the LED */
void LED_init(void);

/* write to MAX7219 */
void LED_write(unsigned char address, unsigned char value);

/* test LED matrix */
void LED_test(void);

void LED_display(unsigned char *grid);
void LED_animate(unsigned char grid[][8], unsigned char frames, int fps);
