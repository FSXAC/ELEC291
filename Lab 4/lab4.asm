;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Wed Mar 01 22:27:12 2017
;--------------------------------------------------------
$name lab4
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
	public _LCD_print_PARM_3
	public _LCD_print_PARM_2
	public _overflow_count
	public _PORT_init
	public _SYSCLK_init
	public _UART0_init
	public _TIMER0_init
	public _delayUs
	public _delay
	public _LCD_pulse
	public _LCD_byte
	public _LCD_write
	public _LCD_cmd
	public _LCD_init
	public _LCD_print
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
_overflow_count:
	ds 1
_main_freq_1_59:
	ds 4
_main_freq_prime_1_59:
	ds 4
_main_capacitance_1_59:
	ds 4
_main_sample_time_1_59:
	ds 2
_main_string_buffer_1_59:
	ds 20
_main_unit_prefix_1_59:
	ds 5
_main_unit_prefix_mult_1_59:
	ds 4
_main_impedence_1_59:
	ds 4
_main_sloc0_1_0:
	ds 4
_LCD_print_PARM_2:
	ds 1
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
_LCD_print_PARM_3:
	DBIT	1
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
;freq                      Allocated with name '_main_freq_1_59'
;freq_prime                Allocated with name '_main_freq_prime_1_59'
;capacitance               Allocated with name '_main_capacitance_1_59'
;sample_time               Allocated with name '_main_sample_time_1_59'
;string_buffer             Allocated with name '_main_string_buffer_1_59'
;unit_prefix               Allocated with name '_main_unit_prefix_1_59'
;unit_prefix_select        Allocated to registers r2 r3 
;unit_prefix_mult          Allocated with name '_main_unit_prefix_mult_1_59'
;impedence                 Allocated with name '_main_impedence_1_59'
;sloc0                     Allocated with name '_main_sloc0_1_0'
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:12: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	using	0
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:19: char unit_prefix[]     = "pnum";
	mov	_main_unit_prefix_1_59,#0x70
	mov	(_main_unit_prefix_1_59 + 0x0001),#0x6E
	mov	(_main_unit_prefix_1_59 + 0x0002),#0x75
	mov	(_main_unit_prefix_1_59 + 0x0003),#0x6D
	mov	(_main_unit_prefix_1_59 + 0x0004),#0x00
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:20: int unit_prefix_select = 2;
	mov	r2,#0x02
	mov	r3,#0x00
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:26: PCA0MD &= ~0x40;
	anl	_PCA0MD,#0xBF
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:29: PORT_init();
	push	ar2
	push	ar3
	lcall	_PORT_init
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:30: SYSCLK_init();
	lcall	_SYSCLK_init
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:31: UART0_init();
	lcall	_UART0_init
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:32: TIMER0_init();
	lcall	_TIMER0_init
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:33: LCD_init();
	lcall	_LCD_init
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:36: LCD_print("Capacitance:", 1, 1);
	mov	_LCD_print_PARM_2,#0x01
	setb	_LCD_print_PARM_3
	mov	dptr,#__str_1
	mov	b,#0x80
	lcall	_LCD_print
	pop	ar3
	pop	ar2
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:38: sample_time = 100;
	mov	_main_sample_time_1_59,#0x64
	clr	a
	mov	(_main_sample_time_1_59 + 1),a
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:41: while (1) {
L002037?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:43: TL0 = 0;
	push	ar2
	push	ar3
	mov	_TL0,#0x00
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:44: TH0 = 0;
	mov	_TH0,#0x00
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:45: overflow_count = 0;
	mov	_overflow_count,#0x00
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:48: TF0 = 0;
	clr	_TF0
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:49: TR0 = 1;
	setb	_TR0
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:50: delay(sample_time);
	mov	dpl,_main_sample_time_1_59
	mov	dph,(_main_sample_time_1_59 + 1)
	push	ar2
	push	ar3
	lcall	_delay
	pop	ar3
	pop	ar2
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:53: TR0 = 0;
	clr	_TR0
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:56: freq_prime = (overflow_count * 0x10000L + TH0 * 0x100L + TL0) * 1000.0 / sample_time;
	mov	r6,_overflow_count
	mov	r7,#0x00
	mov	(_main_sloc0_1_0 + 3),r7
	mov	(_main_sloc0_1_0 + 2),r6
	mov	(_main_sloc0_1_0 + 1),#0x00
	mov	_main_sloc0_1_0,#0x00
	mov	r2,_TH0
	mov	r3,#0x00
	mov	r4,#0x00
	mov	ar5,r4
	mov	ar4,r3
	mov	ar3,r2
	clr	a
	add	a,_main_sloc0_1_0
	mov	_main_sloc0_1_0,a
	mov	a,r3
	addc	a,(_main_sloc0_1_0 + 1)
	mov	(_main_sloc0_1_0 + 1),a
	mov	a,r4
	addc	a,(_main_sloc0_1_0 + 2)
	mov	(_main_sloc0_1_0 + 2),a
	mov	a,r5
	addc	a,(_main_sloc0_1_0 + 3)
	mov	(_main_sloc0_1_0 + 3),a
	mov	r6,_TL0
	clr	a
	mov	r7,a
	rlc	a
	subb	a,acc
	mov	r2,a
	mov	r3,a
	mov	a,r6
	add	a,_main_sloc0_1_0
	mov	r6,a
	mov	a,r7
	addc	a,(_main_sloc0_1_0 + 1)
	mov	r7,a
	mov	a,r2
	addc	a,(_main_sloc0_1_0 + 2)
	mov	r2,a
	mov	a,r3
	addc	a,(_main_sloc0_1_0 + 3)
	mov	dpl,r6
	mov	dph,r7
	mov	b,r2
	lcall	___slong2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
	mov	dpl,_main_sample_time_1_59
	mov	dph,(_main_sample_time_1_59 + 1)
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	push	ar2
	push	ar3
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fsdiv
	mov	_main_freq_prime_1_59,dpl
	mov	(_main_freq_prime_1_59 + 1),dph
	mov	(_main_freq_prime_1_59 + 2),b
	mov	(_main_freq_prime_1_59 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:57: freq = freq_prime;
	mov	dpl,_main_freq_prime_1_59
	mov	dph,(_main_freq_prime_1_59 + 1)
	mov	b,(_main_freq_prime_1_59 + 2)
	mov	a,(_main_freq_prime_1_59 + 3)
	lcall	___fs2ulong
	mov	_main_freq_1_59,dpl
	mov	(_main_freq_1_59 + 1),dph
	mov	(_main_freq_1_59 + 2),b
	mov	(_main_freq_1_59 + 3),a
	pop	ar3
	pop	ar2
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:60: if (freq < 1)           continue;
	clr	c
	mov	a,_main_freq_1_59
	subb	a,#0x01
	mov	a,(_main_freq_1_59 + 1)
	subb	a,#0x00
	mov	a,(_main_freq_1_59 + 2)
	subb	a,#0x00
	mov	a,(_main_freq_1_59 + 3)
	subb	a,#0x00
	pop	ar3
	pop	ar2
	jnc	L002066?
	ljmp	L002037?
L002066?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:61: else if (freq < 5)      sample_time = 3000;
	clr	c
	mov	a,_main_freq_1_59
	subb	a,#0x05
	mov	a,(_main_freq_1_59 + 1)
	subb	a,#0x00
	mov	a,(_main_freq_1_59 + 2)
	subb	a,#0x00
	mov	a,(_main_freq_1_59 + 3)
	subb	a,#0x00
	jnc	L002005?
	mov	_main_sample_time_1_59,#0xB8
	mov	(_main_sample_time_1_59 + 1),#0x0B
	sjmp	L002009?
L002005?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:62: else if (freq < 30)     sample_time = 500;
	clr	c
	mov	a,_main_freq_1_59
	subb	a,#0x1E
	mov	a,(_main_freq_1_59 + 1)
	subb	a,#0x00
	mov	a,(_main_freq_1_59 + 2)
	subb	a,#0x00
	mov	a,(_main_freq_1_59 + 3)
	subb	a,#0x00
	jnc	L002002?
	mov	_main_sample_time_1_59,#0xF4
	mov	(_main_sample_time_1_59 + 1),#0x01
	sjmp	L002009?
L002002?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:63: else                    sample_time = 300;
	mov	_main_sample_time_1_59,#0x2C
	mov	(_main_sample_time_1_59 + 1),#0x01
L002009?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:66: capacitance = 295.3200 / freq_prime;
	push	ar2
	push	ar3
	push	_main_freq_prime_1_59
	push	(_main_freq_prime_1_59 + 1)
	push	(_main_freq_prime_1_59 + 2)
	push	(_main_freq_prime_1_59 + 3)
	mov	dptr,#0xA8F6
	mov	b,#0x93
	mov	a,#0x43
	lcall	___fsdiv
	mov	_main_capacitance_1_59,dpl
	mov	(_main_capacitance_1_59 + 1),dph
	mov	(_main_capacitance_1_59 + 2),b
	mov	(_main_capacitance_1_59 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:69: switch (unit_prefix_select) {
	cjne	r2,#0x00,L002069?
	cjne	r3,#0x00,L002069?
	sjmp	L002010?
L002069?:
	cjne	r2,#0x01,L002070?
	cjne	r3,#0x00,L002070?
	sjmp	L002011?
L002070?:
	cjne	r2,#0x02,L002071?
	cjne	r3,#0x00,L002071?
	sjmp	L002012?
L002071?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:70: case 0: unit_prefix_mult = 1000L * 1000L; break;
	cjne	r2,#0x03,L002014?
	cjne	r3,#0x00,L002014?
	sjmp	L002013?
L002010?:
	mov	_main_unit_prefix_mult_1_59,#0x00
	mov	(_main_unit_prefix_mult_1_59 + 1),#0x24
	mov	(_main_unit_prefix_mult_1_59 + 2),#0x74
	mov	(_main_unit_prefix_mult_1_59 + 3),#0x49
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:71: case 1: unit_prefix_mult = 1000; break;
	sjmp	L002015?
L002011?:
	mov	_main_unit_prefix_mult_1_59,#0x00
	mov	(_main_unit_prefix_mult_1_59 + 1),#0x00
	mov	(_main_unit_prefix_mult_1_59 + 2),#0x7A
	mov	(_main_unit_prefix_mult_1_59 + 3),#0x44
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:72: case 2: unit_prefix_mult = 1; break;
	sjmp	L002015?
L002012?:
	mov	_main_unit_prefix_mult_1_59,#0x00
	mov	(_main_unit_prefix_mult_1_59 + 1),#0x00
	mov	(_main_unit_prefix_mult_1_59 + 2),#0x80
	mov	(_main_unit_prefix_mult_1_59 + 3),#0x3F
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:73: case 3: unit_prefix_mult = 0.001; break;
	sjmp	L002015?
L002013?:
	mov	_main_unit_prefix_mult_1_59,#0x6F
	mov	(_main_unit_prefix_mult_1_59 + 1),#0x12
	mov	(_main_unit_prefix_mult_1_59 + 2),#0x83
	mov	(_main_unit_prefix_mult_1_59 + 3),#0x3A
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:74: default: unit_prefix_mult = 1;
	sjmp	L002015?
L002014?:
	mov	_main_unit_prefix_mult_1_59,#0x00
	mov	(_main_unit_prefix_mult_1_59 + 1),#0x00
	mov	(_main_unit_prefix_mult_1_59 + 2),#0x80
	mov	(_main_unit_prefix_mult_1_59 + 3),#0x3F
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:75: }
L002015?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:76: capacitance *= unit_prefix_mult;
	push	ar2
	push	ar3
	push	_main_unit_prefix_mult_1_59
	push	(_main_unit_prefix_mult_1_59 + 1)
	push	(_main_unit_prefix_mult_1_59 + 2)
	push	(_main_unit_prefix_mult_1_59 + 3)
	mov	dpl,_main_capacitance_1_59
	mov	dph,(_main_capacitance_1_59 + 1)
	mov	b,(_main_capacitance_1_59 + 2)
	mov	a,(_main_capacitance_1_59 + 3)
	lcall	___fsmul
	mov	_main_capacitance_1_59,dpl
	mov	(_main_capacitance_1_59 + 1),dph
	mov	(_main_capacitance_1_59 + 2),b
	mov	(_main_capacitance_1_59 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:80: while (capacitance <= 0.8 && unit_prefix_select > 0) {
	mov	_main_sloc0_1_0,r2
	mov	(_main_sloc0_1_0 + 1),r3
L002017?:
	mov	a,#0xCD
	push	acc
	mov	a,#0xCC
	push	acc
	mov	a,#0x4C
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_capacitance_1_59
	mov	dph,(_main_capacitance_1_59 + 1)
	mov	b,(_main_capacitance_1_59 + 2)
	mov	a,(_main_capacitance_1_59 + 3)
	lcall	___fsgt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r4
	jnz	L002056?
	clr	c
	clr	a
	subb	a,_main_sloc0_1_0
	clr	a
	xrl	a,#0x80
	mov	b,(_main_sloc0_1_0 + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L002056?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:81: capacitance *= 1000;
	push	_main_capacitance_1_59
	push	(_main_capacitance_1_59 + 1)
	push	(_main_capacitance_1_59 + 2)
	push	(_main_capacitance_1_59 + 3)
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	_main_capacitance_1_59,dpl
	mov	(_main_capacitance_1_59 + 1),dph
	mov	(_main_capacitance_1_59 + 2),b
	mov	(_main_capacitance_1_59 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:82: unit_prefix_select--;
	dec	_main_sloc0_1_0
	mov	a,#0xff
	cjne	a,_main_sloc0_1_0,L002075?
	dec	(_main_sloc0_1_0 + 1)
L002075?:
	mov	r2,_main_sloc0_1_0
	mov	r3,(_main_sloc0_1_0 + 1)
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:84: while (capacitance > 800 && unit_prefix_select < 2) {
	sjmp	L002017?
L002056?:
	mov	r4,_main_sloc0_1_0
	mov	r5,(_main_sloc0_1_0 + 1)
L002021?:
	push	ar4
	push	ar5
	clr	a
	push	acc
	push	acc
	mov	a,#0x48
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,_main_capacitance_1_59
	mov	dph,(_main_capacitance_1_59 + 1)
	mov	b,(_main_capacitance_1_59 + 2)
	mov	a,(_main_capacitance_1_59 + 3)
	lcall	___fsgt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	mov	a,r6
	jz	L002065?
	clr	c
	mov	a,r4
	subb	a,#0x02
	mov	a,r5
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L002065?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:85: capacitance /= 1000;
	push	ar4
	push	ar5
	clr	a
	push	acc
	push	acc
	mov	a,#0x7A
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,_main_capacitance_1_59
	mov	dph,(_main_capacitance_1_59 + 1)
	mov	b,(_main_capacitance_1_59 + 2)
	mov	a,(_main_capacitance_1_59 + 3)
	lcall	___fsdiv
	mov	_main_capacitance_1_59,dpl
	mov	(_main_capacitance_1_59 + 1),dph
	mov	(_main_capacitance_1_59 + 2),b
	mov	(_main_capacitance_1_59 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:86: unit_prefix_select++;
	inc	r4
	cjne	r4,#0x00,L002078?
	inc	r5
L002078?:
	mov	ar2,r4
	mov	ar3,r5
	sjmp	L002021?
L002065?:
	mov	ar2,r4
	mov	ar3,r5
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:90: printf("f=%luHz\t", freq);
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	_main_freq_1_59
	push	(_main_freq_1_59 + 1)
	push	(_main_freq_1_59 + 2)
	push	(_main_freq_1_59 + 3)
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	pop	ar5
	pop	ar4
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:91: printf("%f%cF\n", capacitance, unit_prefix[unit_prefix_select]);
	mov	a,r4
	add	a,#_main_unit_prefix_1_59
	mov	r0,a
	mov	a,@r0
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
	push	ar4
	push	ar5
	push	ar0
	push	ar6
	push	ar7
	push	_main_capacitance_1_59
	push	(_main_capacitance_1_59 + 1)
	push	(_main_capacitance_1_59 + 2)
	push	(_main_capacitance_1_59 + 3)
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf7
	mov	sp,a
	pop	ar0
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:94: if (BTN_0) {
	jnb	_P2_7,L002079?
	ljmp	L002034?
L002079?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:95: switch (unit_prefix_select) {
	cjne	r4,#0x00,L002080?
	cjne	r5,#0x00,L002080?
	sjmp	L002024?
L002080?:
	cjne	r4,#0x01,L002081?
	cjne	r5,#0x00,L002081?
	ljmp	L002025?
L002081?:
	cjne	r4,#0x02,L002082?
	cjne	r5,#0x00,L002082?
	ljmp	L002026?
L002082?:
	cjne	r4,#0x03,L002083?
	cjne	r5,#0x00,L002083?
	ljmp	L002027?
L002083?:
	ljmp	L002028?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:96: case 0: impedence = capacitance / 1000 / 1000 / 1000 / 1000 * freq * 2 * M_PI; break;
L002024?:
	push	ar2
	push	ar3
	push	ar2
	push	ar3
	clr	a
	push	acc
	push	acc
	mov	a,#0x7A
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,_main_capacitance_1_59
	mov	dph,(_main_capacitance_1_59 + 1)
	mov	b,(_main_capacitance_1_59 + 2)
	mov	a,(_main_capacitance_1_59 + 3)
	lcall	___fsdiv
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x7A
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fsdiv
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x7A
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fsdiv
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x7A
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fsdiv
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
	mov	dpl,_main_freq_1_59
	mov	dph,(_main_freq_1_59 + 1)
	mov	b,(_main_freq_1_59 + 2)
	mov	a,(_main_freq_1_59 + 3)
	lcall	___ulong2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0FDB
	mov	b,#0xC9
	mov	a,#0x40
	lcall	___fsmul
	mov	_main_impedence_1_59,dpl
	mov	(_main_impedence_1_59 + 1),dph
	mov	(_main_impedence_1_59 + 2),b
	mov	(_main_impedence_1_59 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
	pop	ar3
	pop	ar2
	ljmp	L002029?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:97: case 1: impedence = capacitance / 1000 / 1000 / 1000 * freq * 2 * M_PI; break;
L002025?:
	push	ar2
	push	ar3
	push	ar2
	push	ar3
	clr	a
	push	acc
	push	acc
	mov	a,#0x7A
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,_main_capacitance_1_59
	mov	dph,(_main_capacitance_1_59 + 1)
	mov	b,(_main_capacitance_1_59 + 2)
	mov	a,(_main_capacitance_1_59 + 3)
	lcall	___fsdiv
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x7A
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fsdiv
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x7A
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fsdiv
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
	mov	dpl,_main_freq_1_59
	mov	dph,(_main_freq_1_59 + 1)
	mov	b,(_main_freq_1_59 + 2)
	mov	a,(_main_freq_1_59 + 3)
	lcall	___ulong2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0FDB
	mov	b,#0xC9
	mov	a,#0x40
	lcall	___fsmul
	mov	_main_impedence_1_59,dpl
	mov	(_main_impedence_1_59 + 1),dph
	mov	(_main_impedence_1_59 + 2),b
	mov	(_main_impedence_1_59 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
	pop	ar3
	pop	ar2
	ljmp	L002029?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:98: case 2: impedence = capacitance / 1000 / 1000 * freq * 2 * M_PI; break;
L002026?:
	push	ar2
	push	ar3
	push	ar2
	push	ar3
	clr	a
	push	acc
	push	acc
	mov	a,#0x7A
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,_main_capacitance_1_59
	mov	dph,(_main_capacitance_1_59 + 1)
	mov	b,(_main_capacitance_1_59 + 2)
	mov	a,(_main_capacitance_1_59 + 3)
	lcall	___fsdiv
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x7A
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fsdiv
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
	mov	dpl,_main_freq_1_59
	mov	dph,(_main_freq_1_59 + 1)
	mov	b,(_main_freq_1_59 + 2)
	mov	a,(_main_freq_1_59 + 3)
	lcall	___ulong2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0FDB
	mov	b,#0xC9
	mov	a,#0x40
	lcall	___fsmul
	mov	_main_impedence_1_59,dpl
	mov	(_main_impedence_1_59 + 1),dph
	mov	(_main_impedence_1_59 + 2),b
	mov	(_main_impedence_1_59 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
	pop	ar3
	pop	ar2
	ljmp	L002029?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:99: case 3: impedence = capacitance / 1000 * freq * 2 * M_PI; break;
L002027?:
	push	ar2
	push	ar3
	push	ar2
	push	ar3
	clr	a
	push	acc
	push	acc
	mov	a,#0x7A
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,_main_capacitance_1_59
	mov	dph,(_main_capacitance_1_59 + 1)
	mov	b,(_main_capacitance_1_59 + 2)
	mov	a,(_main_capacitance_1_59 + 3)
	lcall	___fsdiv
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
	mov	dpl,_main_freq_1_59
	mov	dph,(_main_freq_1_59 + 1)
	mov	b,(_main_freq_1_59 + 2)
	mov	a,(_main_freq_1_59 + 3)
	lcall	___ulong2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0FDB
	mov	b,#0xC9
	mov	a,#0x40
	lcall	___fsmul
	mov	_main_impedence_1_59,dpl
	mov	(_main_impedence_1_59 + 1),dph
	mov	(_main_impedence_1_59 + 2),b
	mov	(_main_impedence_1_59 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
	pop	ar3
	pop	ar2
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:100: default: impedence = 1;
	sjmp	L002029?
L002028?:
	mov	_main_impedence_1_59,#0x00
	mov	(_main_impedence_1_59 + 1),#0x00
	mov	(_main_impedence_1_59 + 2),#0x80
	mov	(_main_impedence_1_59 + 3),#0x3F
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:101: }
L002029?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:102: impedence = -1.0 / impedence;
	push	ar2
	push	ar3
	push	_main_impedence_1_59
	push	(_main_impedence_1_59 + 1)
	push	(_main_impedence_1_59 + 2)
	push	(_main_impedence_1_59 + 3)
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0xBF
	lcall	___fsdiv
	mov	_main_impedence_1_59,dpl
	mov	(_main_impedence_1_59 + 1),dph
	mov	(_main_impedence_1_59 + 2),b
	mov	(_main_impedence_1_59 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:104: if (BTN_2) {
	jnb	_P2_3,L002084?
	ljmp	L002031?
L002084?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:105: sprintf(string_buffer, "Z=%.2f%c-90%c", abs(impedence), 0xDA, 0xDF);
	push	ar2
	push	ar3
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,_main_impedence_1_59
	mov	dph,(_main_impedence_1_59 + 1)
	mov	b,(_main_impedence_1_59 + 2)
	mov	a,(_main_impedence_1_59 + 3)
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
	mov	a,r4
	jz	L002041?
	mov	r4,_main_impedence_1_59
	mov	r5,(_main_impedence_1_59 + 1)
	mov	r6,(_main_impedence_1_59 + 2)
	mov	a,(_main_impedence_1_59 + 3)
	cpl	acc.7
	mov	r7,a
	sjmp	L002042?
L002041?:
	mov	r4,_main_impedence_1_59
	mov	r5,(_main_impedence_1_59 + 1)
	mov	r6,(_main_impedence_1_59 + 2)
	mov	r7,(_main_impedence_1_59 + 3)
L002042?:
	push	ar2
	push	ar3
	mov	a,#0xDF
	push	acc
	clr	a
	push	acc
	mov	a,#0xDA
	push	acc
	clr	a
	push	acc
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_string_buffer_1_59
	push	acc
	mov	a,#(_main_string_buffer_1_59 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf2
	mov	sp,a
	pop	ar3
	pop	ar2
	sjmp	L002035?
L002031?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:107: sprintf(string_buffer, "Z=%.2fj%c", impedence, 0xF4);
	push	ar2
	push	ar3
	mov	a,#0xF4
	push	acc
	clr	a
	push	acc
	push	_main_impedence_1_59
	push	(_main_impedence_1_59 + 1)
	push	(_main_impedence_1_59 + 2)
	push	(_main_impedence_1_59 + 3)
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_string_buffer_1_59
	push	acc
	mov	a,#(_main_string_buffer_1_59 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf4
	mov	sp,a
	pop	ar3
	pop	ar2
	sjmp	L002035?
L002034?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:110: sprintf(string_buffer, "C=%.4f%cF", capacitance, unit_prefix[unit_prefix_select]);
	mov	a,@r0
	mov	r4,a
	rlc	a
	subb	a,acc
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	_main_capacitance_1_59
	push	(_main_capacitance_1_59 + 1)
	push	(_main_capacitance_1_59 + 2)
	push	(_main_capacitance_1_59 + 3)
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_string_buffer_1_59
	push	acc
	mov	a,#(_main_string_buffer_1_59 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf4
	mov	sp,a
	pop	ar3
	pop	ar2
L002035?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:112: LCD_print(string_buffer, 2, 1);
	mov	_LCD_print_PARM_2,#0x02
	setb	_LCD_print_PARM_3
	mov	dptr,#_main_string_buffer_1_59
	mov	b,#0x40
	push	ar2
	push	ar3
	lcall	_LCD_print
	pop	ar3
	pop	ar2
	ljmp	L002037?
;------------------------------------------------------------
;Allocation info for local variables in function 'PORT_init'
;------------------------------------------------------------
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:119: void PORT_init(void) {
;	-----------------------------------------
;	 function PORT_init
;	-----------------------------------------
_PORT_init:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:121: P0MDOUT |= 0x10;
	orl	_P0MDOUT,#0x10
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:124: XBR0 = 0b_0000_0001;
	mov	_XBR0,#0x01
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:127: XBR1 = 0b_0101_0000;
	mov	_XBR1,#0x50
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:128: XBR2 = 0b_0000_0000;
	mov	_XBR2,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SYSCLK_init'
;------------------------------------------------------------
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:132: void SYSCLK_init(void) {
;	-----------------------------------------
;	 function SYSCLK_init
;	-----------------------------------------
_SYSCLK_init:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:139: CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
	orl	_CLKSEL,#0x03
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:143: OSCICN |= 0x03;   // Configure internal oscillator for its maximum frequency
	orl	_OSCICN,#0x03
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:144: RSTSRC  = 0x04;   // Enable missing clock detector
	mov	_RSTSRC,#0x04
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UART0_init'
;------------------------------------------------------------
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:148: void UART0_init(void) {
;	-----------------------------------------
;	 function UART0_init
;	-----------------------------------------
_UART0_init:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:149: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:151: TH1    = 0x10000-((SYSCLK/BAUDRATE)/2L);
	mov	_TH1,#0x30
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:152: CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	anl	_CKCON,#0xF4
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:153: CKCON |= 0x08;
	orl	_CKCON,#0x08
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:166: TL1   = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:167: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	anl	_TMOD,#0x0F
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:168: TMOD |= 0x20;
	orl	_TMOD,#0x20
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:169: TR1   = 1; // START Timer1
	setb	_TR1
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:170: TI    = 1;  // Indicate TX0 ready
	setb	_TI
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'TIMER0_init'
;------------------------------------------------------------
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:174: void TIMER0_init(void) {
;	-----------------------------------------
;	 function TIMER0_init
;	-----------------------------------------
_TIMER0_init:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:175: TMOD &= 0b_1111_0000; // Set the bits of Timer/Counter 0 to zero
	anl	_TMOD,#0xF0
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:176: TMOD |= 0b_0000_0101; // Timer/Counter 0 used as a 16-bit counter
	orl	_TMOD,#0x05
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:177: TR0   = 0; // Stop Timer/Counter 0
	clr	_TR0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'delayUs'
;------------------------------------------------------------
;us                        Allocated to registers r2 
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:181: void delayUs(unsigned char us) {
;	-----------------------------------------
;	 function delayUs
;	-----------------------------------------
_delayUs:
	mov	r2,dpl
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:186: CKCON |= 0b_0100_0000;
	orl	_CKCON,#0x40
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:189: TMR3RL = (-(SYSCLK)/1000000L);
	mov	_TMR3RL,#0xD0
	mov	(_TMR3RL >> 8),#0xFF
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:192: TMR3 = TMR3RL;
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:195: TMR3CN = 0x04;
	mov	_TMR3CN,#0x04
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:196: for (i = 0; i < us; i++) {
	mov	r3,#0x00
L007006?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L007009?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:197: while (!(TMR3CN & 0x80));
L007001?:
	mov	a,_TMR3CN
	jnb	acc.7,L007001?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:198: TMR3CN &= ~(0x80);
	anl	_TMR3CN,#0x7F
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:201: if (TF0 == 1) {
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:202: TF0 = 0;
	jbc	_TF0,L007019?
	sjmp	L007008?
L007019?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:203: overflow_count++;
	inc	_overflow_count
L007008?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:196: for (i = 0; i < us; i++) {
	inc	r3
	sjmp	L007006?
L007009?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:206: TMR3CN = 0;
	mov	_TMR3CN,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'delay'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:210: void delay(unsigned int ms) {
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	mov	r2,dpl
	mov	r3,dph
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:212: for (j = ms; j != 0; j--) {
L008001?:
	cjne	r2,#0x00,L008010?
	cjne	r3,#0x00,L008010?
	ret
L008010?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:213: delayUs(249);
	mov	dpl,#0xF9
	push	ar2
	push	ar3
	lcall	_delayUs
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:214: delayUs(249);
	mov	dpl,#0xF9
	lcall	_delayUs
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:215: delayUs(249);
	mov	dpl,#0xF9
	lcall	_delayUs
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:216: delayUs(250);
	mov	dpl,#0xFA
	lcall	_delayUs
	pop	ar3
	pop	ar2
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:212: for (j = ms; j != 0; j--) {
	dec	r2
	cjne	r2,#0xff,L008011?
	dec	r3
L008011?:
	sjmp	L008001?
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_pulse'
;------------------------------------------------------------
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:221: void LCD_pulse(void) {
;	-----------------------------------------
;	 function LCD_pulse
;	-----------------------------------------
_LCD_pulse:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:222: LCD_E = 1;
	setb	_P2_0
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:223: delayUs(40);
	mov	dpl,#0x28
	lcall	_delayUs
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:224: LCD_E = 0;
	clr	_P2_0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_byte'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:228: void LCD_byte(unsigned char x) {
;	-----------------------------------------
;	 function LCD_byte
;	-----------------------------------------
_LCD_byte:
	mov	r2,dpl
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:230: ACC    = x;
	mov	_ACC,r2
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:231: LCD_D7 = ACC_7;
	mov	c,_ACC_7
	mov	_P1_0,c
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:232: LCD_D6 = ACC_6;
	mov	c,_ACC_6
	mov	_P1_1,c
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:233: LCD_D5 = ACC_5;
	mov	c,_ACC_5
	mov	_P1_2,c
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:234: LCD_D4 = ACC_4;
	mov	c,_ACC_4
	mov	_P1_3,c
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:235: LCD_pulse();
	push	ar2
	lcall	_LCD_pulse
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:236: delayUs(40);
	mov	dpl,#0x28
	lcall	_delayUs
	pop	ar2
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:237: ACC    = x;
	mov	_ACC,r2
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:238: LCD_D7 = ACC_3;
	mov	c,_ACC_3
	mov	_P1_0,c
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:239: LCD_D6 = ACC_2;
	mov	c,_ACC_2
	mov	_P1_1,c
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:240: LCD_D5 = ACC_1;
	mov	c,_ACC_1
	mov	_P1_2,c
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:241: LCD_D4 = ACC_0;
	mov	c,_ACC_0
	mov	_P1_3,c
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:242: LCD_pulse();
	ljmp	_LCD_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_write'
;------------------------------------------------------------
;x                         Allocated to registers 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:246: void LCD_write(unsigned char x) {
;	-----------------------------------------
;	 function LCD_write
;	-----------------------------------------
_LCD_write:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:247: LCD_RS = 1;
	setb	_P2_2
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:248: LCD_byte(x);
	lcall	_LCD_byte
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:249: delay(2);
	mov	dptr,#0x0002
	ljmp	_delay
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_cmd'
;------------------------------------------------------------
;x                         Allocated to registers 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:253: void LCD_cmd(unsigned char x) {
;	-----------------------------------------
;	 function LCD_cmd
;	-----------------------------------------
_LCD_cmd:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:254: LCD_RS = 0;
	clr	_P2_2
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:255: LCD_byte(x);
	lcall	_LCD_byte
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:256: delay(5);
	mov	dptr,#0x0005
	ljmp	_delay
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_init'
;------------------------------------------------------------
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:260: void LCD_init(void) {
;	-----------------------------------------
;	 function LCD_init
;	-----------------------------------------
_LCD_init:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:261: LCD_E = 0;
	clr	_P2_0
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:262: LCD_RW = 0;
	clr	_P2_1
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:263: LCD_A  = 0;
	clr	_P0_7
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:264: LCD_K  = 1;
	setb	_P0_6
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:265: delay(20);
	mov	dptr,#0x0014
	lcall	_delay
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:268: LCD_cmd(0x33);
	mov	dpl,#0x33
	lcall	_LCD_cmd
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:269: LCD_cmd(0x33);
	mov	dpl,#0x33
	lcall	_LCD_cmd
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:270: LCD_cmd(0x32);
	mov	dpl,#0x32
	lcall	_LCD_cmd
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:273: LCD_cmd(0x28);
	mov	dpl,#0x28
	lcall	_LCD_cmd
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:274: LCD_cmd(0x0c);
	mov	dpl,#0x0C
	lcall	_LCD_cmd
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:275: LCD_cmd(0x01);
	mov	dpl,#0x01
	lcall	_LCD_cmd
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:276: delay(20);
	mov	dptr,#0x0014
	ljmp	_delay
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_print'
;------------------------------------------------------------
;line                      Allocated with name '_LCD_print_PARM_2'
;string                    Allocated to registers r2 r3 r4 
;j                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:280: void LCD_print(char *string, unsigned char line, bit fillLine) {
;	-----------------------------------------
;	 function LCD_print
;	-----------------------------------------
_LCD_print:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:282: LCD_cmd(line == 2 ? 0xc0: 0x80);
	mov	a,#0x02
	cjne	a,_LCD_print_PARM_2,L014012?
	mov	r5,#0xC0
	sjmp	L014013?
L014012?:
	mov	r5,#0x80
L014013?:
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	lcall	_LCD_cmd
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:283: delay(3);
	mov	dptr,#0x0003
	lcall	_delay
	pop	ar4
	pop	ar3
	pop	ar2
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:290: while (string[j] != 0) LCD_write(string[j++]);
	mov	r5,#0x00
	mov	r6,#0x00
L014001?:
	mov	a,r5
	add	a,r2
	mov	r7,a
	mov	a,r6
	addc	a,r3
	mov	r0,a
	mov	ar1,r4
	mov	dpl,r7
	mov	dph,r0
	mov	b,r1
	lcall	__gptrget
	jz	L014003?
	mov	ar7,r5
	mov	ar0,r6
	inc	r5
	cjne	r5,#0x00,L014024?
	inc	r6
L014024?:
	mov	a,r7
	add	a,r2
	mov	r7,a
	mov	a,r0
	addc	a,r3
	mov	r0,a
	mov	ar1,r4
	mov	dpl,r7
	mov	dph,r0
	mov	b,r1
	lcall	__gptrget
	mov	dpl,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_LCD_write
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	sjmp	L014001?
L014003?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\lab4.c:291: if (fillLine) for (; j < CHARS_PER_LINE; j++) LCD_write(' ');
	jnb	_LCD_print_PARM_3,L014010?
	mov	ar2,r5
	mov	ar3,r6
L014006?:
	clr	c
	mov	a,r2
	subb	a,#0x10
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L014010?
	mov	dpl,#0x20
	push	ar2
	push	ar3
	lcall	_LCD_write
	pop	ar3
	pop	ar2
	inc	r2
	cjne	r2,#0x00,L014006?
	inc	r3
	sjmp	L014006?
L014010?:
	ret
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_1:
	db 'Capacitance:'
	db 0x00
__str_2:
	db 'f=%luHz'
	db 0x09
	db 0x00
__str_3:
	db '%f%cF'
	db 0x0A
	db 0x00
__str_4:
	db 'Z=%.2f%c-90%c'
	db 0x00
__str_5:
	db 'Z=%.2fj%c'
	db 0x00
__str_6:
	db 'C=%.4f%cF'
	db 0x00

	CSEG

end
