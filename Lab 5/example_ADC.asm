;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Tue Mar 07 00:22:28 2017
;--------------------------------------------------------
$name example_ADC
$optc51 --model-small
$printf_float
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
	public _main
	public _delay
	public _delayUs
	public __c51_external_startup
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
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
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
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:16: char _c51_external_startup (void) {
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:17: PCA0MD &= (~0x40);    // DISABLE WDT: clear Watchdog Enable bit
	anl	_PCA0MD,#0xBF
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:22: CLKSEL |= 0b_0000_0010; // SYSCLK derived from the Internal High-Frequency Oscillator / 2.
	orl	_CLKSEL,#0x02
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:28: OSCICN |= 0x03; // Configure internal oscillator for its maximum frequency
	orl	_OSCICN,#0x03
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:31: P2MDIN &= 0b_1111_1110; // P2.0 only
	anl	_P2MDIN,#0xFE
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:32: P2SKIP |= 0b_0000_0001; // Skip Crossbar decoding for this pin
	orl	_P2SKIP,#0x01
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:38: AMX0P = LQFP32_MUX_P2_0; // Select positive input from P0.0
	mov	_AMX0P,#0x08
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:39: AMX0N = LQFP32_MUX_GND;  // GND is negative input (Single-ended Mode)
	mov	_AMX0N,#0x1F
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:42: ADC0CF   = 0xF8; // SAR clock = 31, Right-justified result
	mov	_ADC0CF,#0xF8
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:43: ADC0CN   = 0b_1000_0000; // AD0EN=1, AD0TM=0
	mov	_ADC0CN,#0x80
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:44: REF0CN = 0b_0000_1000; //Select VDD as the voltage reference
	mov	_REF0CN,#0x08
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:46: VDM0CN   = 0x80;       // enable VDD monitor
	mov	_VDM0CN,#0x80
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:47: RSTSRC   = 0x02|0x04;  // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:48: P0MDOUT |= 0x11;     // Enable Uart TX as push-pull output, P0.0 as output
	orl	_P0MDOUT,#0x11
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:49: XBR0     = 0x01;         // Enable UART on P0.4(TX) and P0.5(RX)
	mov	_XBR0,#0x01
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:50: XBR1     = 0x40;         // Enable crossbar and weak pull-ups
	mov	_XBR1,#0x40
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:53: TH1    = 0x10000-((SYSCLK/BAUDRATE)/2L);
	mov	_TH1,#0x98
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:54: CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	anl	_CKCON,#0xF4
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:55: CKCON |= 0x08;
	orl	_CKCON,#0x08
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:69: TL1   = TH1;     // Init timer 1
	mov	_TL1,_TH1
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:70: TMOD &= 0x0f;  // TMOD: timer 1 in 8-bit autoreload
	anl	_TMOD,#0x0F
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:71: TMOD |= 0x20;
	orl	_TMOD,#0x20
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:72: TR1   = 1;       // Start timer1
	setb	_TR1
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:73: SCON  = 0x52;
	mov	_SCON,#0x52
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:75: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'delayUs'
;------------------------------------------------------------
;us                        Allocated to registers r2 
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:79: void delayUs(unsigned char us) {
;	-----------------------------------------
;	 function delayUs
;	-----------------------------------------
_delayUs:
	mov	r2,dpl
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:81: CKCON  |= 0b_0100_0000;
	orl	_CKCON,#0x40
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:82: TMR3RL  = (-(SYSCLK)/1000000L);
	mov	_TMR3RL,#0xE8
	mov	(_TMR3RL >> 8),#0xFF
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:83: TMR3    = TMR3RL;
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:84: TMR3CN  = 0x04;
	mov	_TMR3CN,#0x04
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:87: for (i = 0; i < us; i++) {
	mov	r3,#0x00
L003004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L003007?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:88: while (!(TMR3CN & 0x80));
L003001?:
	mov	a,_TMR3CN
	jnb	acc.7,L003001?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:89: TMR3CN &= ~(0x80);
	anl	_TMR3CN,#0x7F
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:87: for (i = 0; i < us; i++) {
	inc	r3
	sjmp	L003004?
L003007?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:91: TMR3CN = 0;
	mov	_TMR3CN,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'delay'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;k                         Allocated to registers r6 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:95: void delay(unsigned int ms) {
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	mov	r2,dpl
	mov	r3,dph
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:98: for (j = 0; j < ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L004005?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L004009?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:99: for (k = 0; k < 4; k++) delayUs(250);
	mov	r6,#0x00
L004001?:
	cjne	r6,#0x04,L004018?
L004018?:
	jnc	L004007?
	mov	dpl,#0xFA
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_delayUs
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r6
	sjmp	L004001?
L004007?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:98: for (j = 0; j < ms; j++)
	inc	r4
	cjne	r4,#0x00,L004005?
	inc	r5
	sjmp	L004005?
L004009?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;val                       Allocated to registers 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:102: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:104: printf("\x1b[2J");
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
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:111: );
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:110: __FILE__, __DATE__, __TIME__
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:109: "===================",
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
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:114: AD0BUSY = 1;
	setb	_AD0BUSY
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:117: while (AD0BUSY);
L005001?:
	jb	_AD0BUSY,L005001?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:119: while (1) {
L005008?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:121: P0_0 = 1;
	setb	_P0_0
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:124: AD0BUSY = 1;
	setb	_AD0BUSY
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:127: while (AD0BUSY);
L005004?:
	jb	_AD0BUSY,L005004?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:130: P0_0 = 0;
	clr	_P0_0
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:133: val = ADC0L + (ADC0H * 0x100);
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
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:135: printf("Voltage (P2.0): %5.3fV\n", (val*VDD)/1023.0);
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0xCCCD
	mov	b,#0x54
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
	mov	a,#0xC0
	push	acc
	mov	a,#0x7F
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
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c:136: delay(100);
	mov	dptr,#0x0064
	lcall	_delay
	ljmp	L005008?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 0x1B
	db '[2J'
	db 0x00
__str_1:
	db 'ADC Example Program'
	db 0x0A
	db 'File:     %s'
	db 0x0A
	db 'Compiled: %s, %s'
	db 0x0A
	db '=========='
	db '========='
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
	db 'example_ADC.c'
	db 0x00
__str_3:
	db 'Mar  7 2017'
	db 0x00
__str_4:
	db '00:22:28'
	db 0x00
__str_5:
	db 'Voltage (P2.0): %5.3fV'
	db 0x0A
	db 0x00

	CSEG

end
