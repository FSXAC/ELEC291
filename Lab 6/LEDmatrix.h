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

/* Toggles CS */
void LED_pulse(void);

/* send one byte */
void LED_spi(unsigned char data);

/* clear all MAX7219s */
void LED_clear(void);

/* initialize the LED */
void LED_init(unsigned char intensity);

/* write to MAX7219 */
void LED_write(char address, char data);

/* test LED matrix */
void LED_test(void);
