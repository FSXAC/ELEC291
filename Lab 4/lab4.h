// preprocessor constants
// timing
#define SYSCLK 48000000L  // SYSCLK frequency in Hz
#define BAUDRATE 115200L  // Baud rate of UART in bps
#define M_PI 3.14159265358979323846

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

// buttons (inverted)
#define BTN_0 !P2_7
#define BTN_1 !P2_5
#define BTN_2 !P2_3

// macros
#define abs(x) (x<0) ? -1*x : x

// function prototypes
char _c51_external_startup(void);
void PORT_init(void);
void SYSCLK_init(void);
void UART0_init(void);
void TIMER0_init(void);
void delayUs(unsigned char us);
void delay(unsigned int ms);

void LCD_pulse(void);
void LCD_byte(unsigned char x);
void LCD_write(unsigned char x);
void LCD_cmd(unsigned char x);
void LCD_init(void);
void LCD_print(char *string, unsigned char line, bit clear);
