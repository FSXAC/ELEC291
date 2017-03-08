;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Wed Mar 08 14:02:39 2017
;--------------------------------------------------------
$name lab5
$optc51 --model-small
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _initializePin_PARM_2
	public _main
	public _LED_write_PARM_2
	public __c51_external_startup
	public _delayUs
	public _delay
	public _initializeADC
	public _initializePin
	public _getADCAtPin
	public _getVoltageAtPin
	public _LED_spi
	public _LED_pulse
	public _LED_clear
	public _LED_init
	public _LED_write
	public _LED_test
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_P0             DATA 0x80
_SP             DATA 0x81
_DPL            DATA 0x82
_DPH            DATA 0x83
_EMI0TC         DATA 0x84
_EMI0CF         DATA 0x85
_OSCLCN         DATA 0x86
_PCON           DATA 0x87
_TCON           DATA 0x88
_TMOD           DATA 0x89
_TL0            DATA 0x8a
_TL1            DATA 0x8b
_TH0            DATA 0x8c
_TH1            DATA 0x8d
_CKCON          DATA 0x8e
_PSCTL          DATA 0x8f
_P1             DATA 0x90
_TMR3CN         DATA 0x91
_TMR4CN         DATA 0x91
_TMR3RLL        DATA 0x92
_TMR4RLL        DATA 0x92
_TMR3RLH        DATA 0x93
_TMR4RLH        DATA 0x93
_TMR3L          DATA 0x94
_TMR4L          DATA 0x94
_TMR3H          DATA 0x95
_TMR4H          DATA 0x95
_USB0ADR        DATA 0x96
_USB0DAT        DATA 0x97
_SCON           DATA 0x98
_SCON0          DATA 0x98
_SBUF           DATA 0x99
_SBUF0          DATA 0x99
_CPT1CN         DATA 0x9a
_CPT0CN         DATA 0x9b
_CPT1MD         DATA 0x9c
_CPT0MD         DATA 0x9d
_CPT1MX         DATA 0x9e
_CPT0MX         DATA 0x9f
_P2             DATA 0xa0
_SPI0CFG        DATA 0xa1
_SPI0CKR        DATA 0xa2
_SPI0DAT        DATA 0xa3
_P0MDOUT        DATA 0xa4
_P1MDOUT        DATA 0xa5
_P2MDOUT        DATA 0xa6
_P3MDOUT        DATA 0xa7
_IE             DATA 0xa8
_CLKSEL         DATA 0xa9
_EMI0CN         DATA 0xaa
__XPAGE         DATA 0xaa
_SBCON1         DATA 0xac
_P4MDOUT        DATA 0xae
_PFE0CN         DATA 0xaf
_P3             DATA 0xb0
_OSCXCN         DATA 0xb1
_OSCICN         DATA 0xb2
_OSCICL         DATA 0xb3
_SBRLL1         DATA 0xb4
_SBRLH1         DATA 0xb5
_FLSCL          DATA 0xb6
_FLKEY          DATA 0xb7
_IP             DATA 0xb8
_CLKMUL         DATA 0xb9
_SMBTC          DATA 0xb9
_AMX0N          DATA 0xba
_AMX0P          DATA 0xbb
_ADC0CF         DATA 0xbc
_ADC0L          DATA 0xbd
_ADC0H          DATA 0xbe
_SFRPAGE        DATA 0xbf
_SMB0CN         DATA 0xc0
_SMB1CN         DATA 0xc0
_SMB0CF         DATA 0xc1
_SMB1CF         DATA 0xc1
_SMB0DAT        DATA 0xc2
_SMB1DAT        DATA 0xc2
_ADC0GTL        DATA 0xc3
_ADC0GTH        DATA 0xc4
_ADC0LTL        DATA 0xc5
_ADC0LTH        DATA 0xc6
_P4             DATA 0xc7
_TMR2CN         DATA 0xc8
_TMR5CN         DATA 0xc8
_REG01CN        DATA 0xc9
_TMR2RLL        DATA 0xca
_TMR5RLL        DATA 0xca
_TMR2RLH        DATA 0xcb
_TMR5RLH        DATA 0xcb
_TMR2L          DATA 0xcc
_TMR5L          DATA 0xcc
_TMR2H          DATA 0xcd
_TMR5H          DATA 0xcd
_SMB0ADM        DATA 0xce
_SMB1ADM        DATA 0xce
_SMB0ADR        DATA 0xcf
_SMB1ADR        DATA 0xcf
_PSW            DATA 0xd0
_REF0CN         DATA 0xd1
_SCON1          DATA 0xd2
_SBUF1          DATA 0xd3
_P0SKIP         DATA 0xd4
_P1SKIP         DATA 0xd5
_P2SKIP         DATA 0xd6
_USB0XCN        DATA 0xd7
_PCA0CN         DATA 0xd8
_PCA0MD         DATA 0xd9
_PCA0CPM0       DATA 0xda
_PCA0CPM1       DATA 0xdb
_PCA0CPM2       DATA 0xdc
_PCA0CPM3       DATA 0xdd
_PCA0CPM4       DATA 0xde
_P3SKIP         DATA 0xdf
_ACC            DATA 0xe0
_XBR0           DATA 0xe1
_XBR1           DATA 0xe2
_XBR2           DATA 0xe3
_IT01CF         DATA 0xe4
_CKCON1         DATA 0xe4
_SMOD1          DATA 0xe5
_EIE1           DATA 0xe6
_EIE2           DATA 0xe7
_ADC0CN         DATA 0xe8
_PCA0CPL1       DATA 0xe9
_PCA0CPH1       DATA 0xea
_PCA0CPL2       DATA 0xeb
_PCA0CPH2       DATA 0xec
_PCA0CPL3       DATA 0xed
_PCA0CPH3       DATA 0xee
_RSTSRC         DATA 0xef
_B              DATA 0xf0
_P0MDIN         DATA 0xf1
_P1MDIN         DATA 0xf2
_P2MDIN         DATA 0xf3
_P3MDIN         DATA 0xf4
_P4MDIN         DATA 0xf5
_EIP1           DATA 0xf6
_EIP2           DATA 0xf7
_SPI0CN         DATA 0xf8
_PCA0L          DATA 0xf9
_PCA0H          DATA 0xfa
_PCA0CPL0       DATA 0xfb
_PCA0CPH0       DATA 0xfc
_PCA0CPL4       DATA 0xfd
_PCA0CPH4       DATA 0xfe
_VDM0CN         DATA 0xff
_DPTR           DATA 0x8382
_TMR2RL         DATA 0xcbca
_TMR3RL         DATA 0x9392
_TMR4RL         DATA 0x9392
_TMR5RL         DATA 0xcbca
_TMR2           DATA 0xcdcc
_TMR3           DATA 0x9594
_TMR4           DATA 0x9594
_TMR5           DATA 0xcdcc
_SBRL1          DATA 0xb5b4
_ADC0           DATA 0xbebd
_ADC0GT         DATA 0xc4c3
_ADC0LT         DATA 0xc6c5
_PCA0           DATA 0xfaf9
_PCA0CP1        DATA 0xeae9
_PCA0CP2        DATA 0xeceb
_PCA0CP3        DATA 0xeeed
_PCA0CP0        DATA 0xfcfb
_PCA0CP4        DATA 0xfefd
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_TF1            BIT 0x8f
_TR1            BIT 0x8e
_TF0            BIT 0x8d
_TR0            BIT 0x8c
_IE1            BIT 0x8b
_IT1            BIT 0x8a
_IE0            BIT 0x89
_IT0            BIT 0x88
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_S0MODE         BIT 0x9f
_SCON0_6        BIT 0x9e
_MCE0           BIT 0x9d
_REN0           BIT 0x9c
_TB80           BIT 0x9b
_RB80           BIT 0x9a
_TI0            BIT 0x99
_RI0            BIT 0x98
_SCON_6         BIT 0x9e
_MCE            BIT 0x9d
_REN            BIT 0x9c
_TB8            BIT 0x9b
_RB8            BIT 0x9a
_TI             BIT 0x99
_RI             BIT 0x98
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P2_7           BIT 0xa7
_EA             BIT 0xaf
_ESPI0          BIT 0xae
_ET2            BIT 0xad
_ES0            BIT 0xac
_ET1            BIT 0xab
_EX1            BIT 0xaa
_ET0            BIT 0xa9
_EX0            BIT 0xa8
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_5           BIT 0xb5
_P3_6           BIT 0xb6
_P3_7           BIT 0xb7
_IP_7           BIT 0xbf
_PSPI0          BIT 0xbe
_PT2            BIT 0xbd
_PS0            BIT 0xbc
_PT1            BIT 0xbb
_PX1            BIT 0xba
_PT0            BIT 0xb9
_PX0            BIT 0xb8
_MASTER0        BIT 0xc7
_TXMODE0        BIT 0xc6
_STA0           BIT 0xc5
_STO0           BIT 0xc4
_ACKRQ0         BIT 0xc3
_ARBLOST0       BIT 0xc2
_ACK0           BIT 0xc1
_SI0            BIT 0xc0
_MASTER1        BIT 0xc7
_TXMODE1        BIT 0xc6
_STA1           BIT 0xc5
_STO1           BIT 0xc4
_ACKRQ1         BIT 0xc3
_ARBLOST1       BIT 0xc2
_ACK1           BIT 0xc1
_SI1            BIT 0xc0
_TF2            BIT 0xcf
_TF2H           BIT 0xcf
_TF2L           BIT 0xce
_TF2LEN         BIT 0xcd
_TF2CEN         BIT 0xcc
_T2SPLIT        BIT 0xcb
_TR2            BIT 0xca
_T2CSS          BIT 0xc9
_T2XCLK         BIT 0xc8
_TF5H           BIT 0xcf
_TF5L           BIT 0xce
_TF5LEN         BIT 0xcd
_TMR5CN_4       BIT 0xcc
_T5SPLIT        BIT 0xcb
_TR5            BIT 0xca
_TMR5CN_1       BIT 0xc9
_T5XCLK         BIT 0xc8
_CY             BIT 0xd7
_AC             BIT 0xd6
_F0             BIT 0xd5
_RS1            BIT 0xd4
_RS0            BIT 0xd3
_OV             BIT 0xd2
_F1             BIT 0xd1
_PARITY         BIT 0xd0
_CF             BIT 0xdf
_CR             BIT 0xde
_PCA0CN_5       BIT 0xde
_CCF4           BIT 0xdc
_CCF3           BIT 0xdb
_CCF2           BIT 0xda
_CCF1           BIT 0xd9
_CCF0           BIT 0xd8
_ACC_7          BIT 0xe7
_ACC_6          BIT 0xe6
_ACC_5          BIT 0xe5
_ACC_4          BIT 0xe4
_ACC_3          BIT 0xe3
_ACC_2          BIT 0xe2
_ACC_1          BIT 0xe1
_ACC_0          BIT 0xe0
_AD0EN          BIT 0xef
_AD0TM          BIT 0xee
_AD0INT         BIT 0xed
_AD0BUSY        BIT 0xec
_AD0WINT        BIT 0xeb
_AD0CM2         BIT 0xea
_AD0CM1         BIT 0xe9
_AD0CM0         BIT 0xe8
_B_7            BIT 0xf7
_B_6            BIT 0xf6
_B_5            BIT 0xf5
_B_4            BIT 0xf4
_B_3            BIT 0xf3
_B_2            BIT 0xf2
_B_1            BIT 0xf1
_B_0            BIT 0xf0
_SPIF           BIT 0xff
_WCOL           BIT 0xfe
_MODF           BIT 0xfd
_RXOVRN         BIT 0xfc
_NSSMD1         BIT 0xfb
_NSSMD0         BIT 0xfa
_TXBMT          BIT 0xf9
_SPIEN          BIT 0xf8
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_LED_write_PARM_2:
	ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
_initializePin_PARM_2:
	ds 1
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:10: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	using	0
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:13: printf("\x1b[2J");
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:20: );
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:19: __FILE__, __DATE__, __TIME__
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:18: "===================\n",
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf4
	mov	sp,a
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:49: while (1) {
L002002?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:50: LED_CLK = HIGH;
	setb	_P2_5
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:51: delay(2000);
	mov	dptr,#0x07D0
	lcall	_delay
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:52: LED_CLK = LOW;
	clr	_P2_5
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:53: delay(2000);
	mov	dptr,#0x07D0
	lcall	_delay
	sjmp	L002002?
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:57: char _c51_external_startup(void) {
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:58: PCA0MD &= (~0x40) ;    // DISABLE WDT: clear Watchdog Enable bit
	anl	_PCA0MD,#0xBF
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:59: VDM0CN  = 0x80; // enable VDD monitor
	mov	_VDM0CN,#0x80
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:60: RSTSRC  = 0x02|0x04; // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:66: CLKSEL|=0b_0000_0010; // SYSCLK derived from the Internal High-Frequency Oscillator / 2.
	orl	_CLKSEL,#0x02
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:73: OSCICN |= 0x03; // Configure internal oscillator for its maximum frequency
	orl	_OSCICN,#0x03
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:76: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:78: TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	mov	_TH1,#0x98
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:79: CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	anl	_CKCON,#0xF4
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:80: CKCON |=  0x08;
	orl	_CKCON,#0x08
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:94: TL1   = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:95: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	anl	_TMOD,#0x0F
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:96: TMOD |= 0x20;
	orl	_TMOD,#0x20
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:97: TR1   = 1; // START Timer1
	setb	_TR1
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:98: TI    = 1;  // Indicate TX0 ready
	setb	_TI
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:101: P0MDOUT |= 0x01;  // set P0.0 and P0.4 as push-pull outputs
	orl	_P0MDOUT,#0x01
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:102: XBR0 = 0x01;      // Enable UART0 on P0.4(TX0) and P0.5(RX0)
	mov	_XBR0,#0x01
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:103: XBR1 = 0x40;      // enable crossbar
	mov	_XBR1,#0x40
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:105: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'delayUs'
;------------------------------------------------------------
;us                        Allocated to registers r2 
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:109: void delayUs(unsigned char us) {
;	-----------------------------------------
;	 function delayUs
;	-----------------------------------------
_delayUs:
	mov	r2,dpl
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:111: CKCON  |= 0b_0100_0000;
	orl	_CKCON,#0x40
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:112: TMR3RL  = (-(SYSCLK)/1000000L);
	mov	_TMR3RL,#0xE8
	mov	(_TMR3RL >> 8),#0xFF
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:113: TMR3    = TMR3RL;
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:114: TMR3CN  = 0x04;
	mov	_TMR3CN,#0x04
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:117: for (i = 0; i < us; i++) {
	mov	r3,#0x00
L004004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L004007?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:118: while (!(TMR3CN & 0x80));
L004001?:
	mov	a,_TMR3CN
	jnb	acc.7,L004001?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:119: TMR3CN &= ~(0x80);
	anl	_TMR3CN,#0x7F
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:117: for (i = 0; i < us; i++) {
	inc	r3
	sjmp	L004004?
L004007?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:121: TMR3CN = 0;
	mov	_TMR3CN,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'delay'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:125: void delay(unsigned int ms) {
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	mov	r2,dpl
	mov	r3,dph
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:127: for (j = 0; j < ms; j++) {
	mov	r4,#0x00
	mov	r5,#0x00
L005001?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L005005?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:128: delayUs(249);
	mov	dpl,#0xF9
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_delayUs
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:129: delayUs(249);
	mov	dpl,#0xF9
	lcall	_delayUs
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:130: delayUs(249);
	mov	dpl,#0xF9
	lcall	_delayUs
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:131: delayUs(250);
	mov	dpl,#0xFA
	lcall	_delayUs
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:127: for (j = 0; j < ms; j++) {
	inc	r4
	cjne	r4,#0x00,L005001?
	inc	r5
	sjmp	L005001?
L005005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'initializeADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:136: void initializeADC(void) {
;	-----------------------------------------
;	 function initializeADC
;	-----------------------------------------
_initializeADC:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:137: ADC0CF = 0xF8; // SAR clock = 31, Right-justified result
	mov	_ADC0CF,#0xF8
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:138: ADC0CN = 0b_1000_0000; // AD0EN=1, AD0TM=0
	mov	_ADC0CN,#0x80
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:139: REF0CN = 0b_0000_1000; // Select VDD as the voltage reference
	mov	_REF0CN,#0x08
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'initializePin'
;------------------------------------------------------------
;pin                       Allocated with name '_initializePin_PARM_2'
;port                      Allocated to registers r2 
;mask                      Allocated to registers r3 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:143: void initializePin(unsigned char port, unsigned char pin) {
;	-----------------------------------------
;	 function initializePin
;	-----------------------------------------
_initializePin:
	mov	r2,dpl
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:145: mask = 1 << pin;
	mov	b,_initializePin_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	L007012?
L007010?:
	add	a,acc
L007012?:
	djnz	b,L007010?
	mov	r3,a
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:146: switch (port) {
	mov	a,r2
	add	a,#0xff - 0x03
	jc	L007007?
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#L007014?
	jmp	@a+dptr
L007014?:
	ljmp	L007001?
	ljmp	L007002?
	ljmp	L007003?
	ljmp	L007004?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:147: case 0:
L007001?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:148: P0MDIN &= (~mask);
	mov	a,r3
	cpl	a
	anl	_P0MDIN,a
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:149: P0SKIP |= mask;
	mov	a,r3
	orl	_P0SKIP,a
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:150: break;
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:151: case 1:
	ret
L007002?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:152: P1MDIN &= (~mask);
	mov	a,r3
	cpl	a
	anl	_P1MDIN,a
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:153: P1SKIP |= mask;
	mov	a,r3
	orl	_P1SKIP,a
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:154: break;
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:155: case 2:
	ret
L007003?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:156: P2MDIN &= (~mask);
	mov	a,r3
	cpl	a
	anl	_P2MDIN,a
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:157: P2SKIP |= mask;
	mov	a,r3
	orl	_P2SKIP,a
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:158: break;
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:159: case 3:
	ret
L007004?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:160: P3MDIN &= (~mask);
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P3MDIN,a
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:161: P3SKIP |= mask;
	mov	a,r3
	orl	_P3SKIP,a
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:164: }
L007007?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getADCAtPin'
;------------------------------------------------------------
;pin                       Allocated to registers 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:167: unsigned int getADCAtPin(unsigned char pin) {
;	-----------------------------------------
;	 function getADCAtPin
;	-----------------------------------------
_getADCAtPin:
	mov	_AMX0P,dpl
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:169: AMX0N = LQFP32_MUX_GND;  // GND is negative input (Single-ended Mode)
	mov	_AMX0N,#0x1F
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:171: AD0BUSY = 1;
	setb	_AD0BUSY
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:172: while (AD0BUSY); // Wait for dummy conversion to finish
L008001?:
	jb	_AD0BUSY,L008001?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:174: AD0BUSY = 1;
	setb	_AD0BUSY
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:175: while (AD0BUSY); // Wait for conversion to complete
L008004?:
	jb	_AD0BUSY,L008004?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:176: return (ADC0L+(ADC0H*0x100));
	mov	r2,_ADC0L
	mov	r3,#0x00
	mov	r5,_ADC0H
	mov	r4,#0x00
	mov	a,r4
	add	a,r2
	mov	dpl,a
	mov	a,r5
	addc	a,r3
	mov	dph,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getVoltageAtPin'
;------------------------------------------------------------
;pin                       Allocated to registers 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:179: float getVoltageAtPin(unsigned char pin) {
;	-----------------------------------------
;	 function getVoltageAtPin
;	-----------------------------------------
_getVoltageAtPin:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:180: return ((getADCAtPin(pin) * VDD / 1024.0));
	lcall	_getADCAtPin
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x3333
	mov	b,#0x93
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_spi'
;------------------------------------------------------------
;value                     Allocated to registers r2 
;j                         Allocated to registers r3 
;temp                      Allocated to registers r4 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:185: void LED_spi(unsigned char value) {
;	-----------------------------------------
;	 function LED_spi
;	-----------------------------------------
_LED_spi:
	mov	r2,dpl
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:187: for (j = 1; j <= 8; j++) {
	mov	r3,#0x01
L010001?:
	mov	a,r3
	add	a,#0xff - 0x08
	jc	L010005?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:188: temp = value & 0x80;
	mov	a,#0x80
	anl	a,r2
	mov	r4,a
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:189: LED_DATA = (temp == 0x80) ? HIGH : LOW;
	cjne	r4,#0x80,L010011?
	setb	c
	sjmp	L010012?
L010011?:
	clr	c
L010012?:
	mov	_P2_6,c
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:192: LED_CLK = HIGH;
	setb	_P2_5
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:193: delayUs(20);
	mov	dpl,#0x14
	push	ar2
	push	ar3
	lcall	_delayUs
	pop	ar3
	pop	ar2
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:194: LED_CLK = LOW;
	clr	_P2_5
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:197: value = value << 1;
	mov	a,r2
	add	a,r2
	mov	r2,a
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:187: for (j = 1; j <= 8; j++) {
	inc	r3
	sjmp	L010001?
L010005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_pulse'
;------------------------------------------------------------
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:201: void LED_pulse(void) {
;	-----------------------------------------
;	 function LED_pulse
;	-----------------------------------------
_LED_pulse:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:202: LED_CS = HIGH;
	setb	_P2_7
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:203: delay(1);
	mov	dptr,#0x0001
	lcall	_delay
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:204: LED_CS = LOW;
	clr	_P2_7
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_clear'
;------------------------------------------------------------
;j                         Allocated to registers r2 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:208: void LED_clear(void) {
;	-----------------------------------------
;	 function LED_clear
;	-----------------------------------------
_LED_clear:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:210: for (j = 1; j <= 8; j++) {
	mov	r2,#0x01
L012001?:
	mov	a,r2
	add	a,#0xff - 0x08
	jc	L012004?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:211: LED_spi(j);
	mov	dpl,r2
	push	ar2
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:212: LED_spi(0x00);
	mov	dpl,#0x00
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:213: LED_pulse();
	lcall	_LED_pulse
	pop	ar2
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:214: printf("%x ", j);
	mov	ar3,r2
	mov	r4,#0x00
	push	ar2
	push	ar3
	push	ar4
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	pop	ar2
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:210: for (j = 1; j <= 8; j++) {
	inc	r2
	sjmp	L012001?
L012004?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:216: printf("\n");
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_init'
;------------------------------------------------------------
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:220: void LED_init(void) {
;	-----------------------------------------
;	 function LED_init
;	-----------------------------------------
_LED_init:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:221: LED_CS = LOW;
	clr	_P2_7
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:224: LED_spi(0x09);
	mov	dpl,#0x09
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:226: LED_spi(0x00);
	mov	dpl,#0x00
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:227: LED_pulse();
	lcall	_LED_pulse
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:228: printf("decoder set\n");
	mov	a,#__str_7
	push	acc
	mov	a,#(__str_7 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:231: LED_spi(0x0A);
	mov	dpl,#0x0A
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:232: LED_spi(0x0D);
	mov	dpl,#0x0D
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:233: LED_pulse();
	lcall	_LED_pulse
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:234: printf("intensity set\n");
	mov	a,#__str_8
	push	acc
	mov	a,#(__str_8 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:237: LED_spi(0x0b);
	mov	dpl,#0x0B
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:238: LED_spi(0x07);
	mov	dpl,#0x07
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:239: LED_pulse();
	lcall	_LED_pulse
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:240: printf("scan limit set\n");
	mov	a,#__str_9
	push	acc
	mov	a,#(__str_9 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:243: printf("clearing: ");
	mov	a,#__str_10
	push	acc
	mov	a,#(__str_10 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:244: LED_clear();
	lcall	_LED_clear
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:247: LED_spi(0x0C);
	mov	dpl,#0x0C
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:248: LED_spi(0x01);
	mov	dpl,#0x01
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:249: LED_pulse();
	lcall	_LED_pulse
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:250: printf("normal operation set\n");
	mov	a,#__str_11
	push	acc
	mov	a,#(__str_11 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_write'
;------------------------------------------------------------
;value                     Allocated with name '_LED_write_PARM_2'
;address                   Allocated to registers r2 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:254: void LED_write(char address, char value) {
;	-----------------------------------------
;	 function LED_write
;	-----------------------------------------
_LED_write:
	mov	r2,dpl
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:255: if ((address < 1) || (address > 8)) return;
	clr	c
	mov	a,r2
	xrl	a,#0x80
	subb	a,#0x81
	jc	L014001?
	mov	a,#(0x08 ^ 0x80)
	mov	b,r2
	xrl	b,#0x80
	subb	a,b
	jnc	L014002?
L014001?:
	ret
L014002?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:256: LED_spi(address);
	mov	dpl,r2
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:257: LED_spi(value);
	mov	dpl,_LED_write_PARM_2
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:258: LED_pulse();
	ljmp	_LED_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_test'
;------------------------------------------------------------
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:262: void LED_test(void) {
;	-----------------------------------------
;	 function LED_test
;	-----------------------------------------
_LED_test:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:263: LED_spi(0x0F);
	mov	dpl,#0x0F
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:264: LED_spi(0x01);
	mov	dpl,#0x01
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:265: LED_pulse();
	lcall	_LED_pulse
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:266: delay(1000);
	mov	dptr,#0x03E8
	lcall	_delay
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:267: LED_spi(0x0F);
	mov	dpl,#0x0F
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:268: LED_spi(0x00);
	mov	dpl,#0x00
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c:269: LED_pulse();
	ljmp	_LED_pulse
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 0x1B
	db '[2J'
	db 0x00
__str_1:
	db 'Lab 5 - Phasor Detector'
	db 0x0A
	db 'Author:   Muchen He (44638154)'
	db 0x0A
	db 'File:'
	db '     %s'
	db 0x0A
	db 'Compiled: %s, %s'
	db 0x0A
	db '==================='
	db 0x0A
	db 0x00
__str_2:
	db 'F:'
	db 0x5C
	db 'OneDrive'
	db 0x5C
	db 'Documents'
	db 0x5C
	db '2017 UBC'
	db 0x5C
	db 'ELEC 291'
	db 0x5C
	db 'Lab 5'
	db 0x5C
	db 'src'
	db 0x5C
	db 'lab5.c'
	db 0x00
__str_3:
	db 'Mar  8 2017'
	db 0x00
__str_4:
	db '14:02:39'
	db 0x00
__str_5:
	db '%x '
	db 0x00
__str_6:
	db 0x0A
	db 0x00
__str_7:
	db 'decoder set'
	db 0x0A
	db 0x00
__str_8:
	db 'intensity set'
	db 0x0A
	db 0x00
__str_9:
	db 'scan limit set'
	db 0x0A
	db 0x00
__str_10:
	db 'clearing: '
	db 0x00
__str_11:
	db 'normal operation set'
	db 0x0A
	db 0x00

	CSEG

end
