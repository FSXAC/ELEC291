//#include <intrins.h>
//#include <reg52.h>
#include <at89lp52.h>

//sbit P3_7 = P3 ^ 7;

#define pitch_P		0
#define pitch_C5	64580
#define pitch_Db5	64634
#define pitch_D5	64685
#define pitch_Eb5	64732
#define pitch_E5	64778
#define pitch_F5	64820
#define pitch_Gb5	64860
#define pitch_G5	64898
#define pitch_Ab5	64934
#define pitch_A5	64968
#define pitch_Bb5	65000
#define pitch_B5	65030
#define pitch_C6	65058
#define pitch_Db6	65085
#define pitch_D6	65110
#define pitch_Eb6	65134
#define pitch_E6	65157
#define pitch_F6	65178
#define pitch_Gb6	65198
#define pitch_G6	65217
#define pitch_Ab6	65235
#define pitch_A6	65252
#define pitch_Bb6	65268
#define pitch_B6	65283

#define MelodyPin	P3_7

unsigned int qtrN, qtrN_us, wholeN, wholeN_us, halfN, halfN_us, eighthN, eighthN_us,
			 sixteenN, sixteenN_us, thirtyTwoN, thirtyTwoN_us, sixtyFourN, sixtyFourN_us,
			 sixN, sixN_us, twelveN, twelveN_us, twentyFourN, twentyFourN_us;

void Delay10MC(unsigned char);

void T2ISR(void) interrupt 5 {
	MelodyPin = ~MelodyPin;
	TF2 = 0;
}

void MelodyTempo(int Tempo){
	qtrN = ((60000/Tempo));
	wholeN = qtrN*4;
	halfN = (qtrN*2);
	eighthN = (qtrN/2);
	sixteenN = (qtrN/4);
	thirtyTwoN = (qtrN/8);
	sixtyFourN = (qtrN/16);
	sixN = (wholeN/6);
	twelveN = (wholeN/12);
	twentyFourN = (wholeN/24);
}

void PlayNote(const unsigned char PitchH, const unsigned char PitchL){
	RCAP2H = PitchH;
	RCAP2L = PitchL;
	TH2 = PitchH;
	TL2 = PitchL;
	TF2 = 0;
	TR2 = 1;
	ET2 = 1;
	EA = 1;
}

void EndNote(void){
	EA = 0;
	TR2 = 0;
	TF2 = 0;
	MelodyPin = 1;
}

void delay_ms(unsigned int ms){
	for(;ms>0;ms--)
		Delay10MC(100);
}

void Melodyplay(const int Pitch, unsigned int interval){
	if(Pitch!=0)
		PlayNote(Pitch >> 8, Pitch);
	delay_ms(interval);
	EndNote();
}

void LooneyToons(){ //d=4,o=5,b=140
	MelodyTempo(140);
	Melodyplay(pitch_C6, qtrN); //c6
	Melodyplay(pitch_F6, eighthN); //8f6
	Melodyplay(pitch_E6, eighthN); //8e6
	Melodyplay(pitch_D6, eighthN); //8d6
	Melodyplay(pitch_C6, eighthN); //8c6
	Melodyplay(pitch_A5, qtrN); //a.
	Melodyplay(pitch_A5, eighthN); //a.
	Melodyplay(pitch_C6, eighthN); //8c6
	Melodyplay(pitch_F6, eighthN); //8f6
	Melodyplay(pitch_E6, eighthN); //8e6
	Melodyplay(pitch_D6, eighthN); //8d6
	Melodyplay(pitch_Eb6, eighthN); //8d#6
	Melodyplay(pitch_E6, qtrN); //e.6
	Melodyplay(pitch_E6, eighthN); //e.6
	Melodyplay(pitch_E6, eighthN); //8e6
	Melodyplay(pitch_E6, eighthN); //8e6
	Melodyplay(pitch_C6, eighthN); //8c6
	Melodyplay(pitch_D6, eighthN); //8d6
	Melodyplay(pitch_C6, eighthN); //8c6
	Melodyplay(pitch_E6, eighthN); //8e6
	Melodyplay(pitch_C6, eighthN); //8c6
	Melodyplay(pitch_D6, eighthN); //8d6
	Melodyplay(pitch_C6, eighthN); //8c6
	Melodyplay(pitch_A5, eighthN); //8a
	Melodyplay(pitch_C6, eighthN); //8c6
	Melodyplay(pitch_G5, eighthN); //8g
	Melodyplay(pitch_Bb5, eighthN); //8a#
	Melodyplay(pitch_A5, eighthN); //8a
	Melodyplay(pitch_F5, eighthN); //8f
	Melodyplay(pitch_P, wholeN); //1P
}

void Flintstones(){//d=4,o=5,b=200
	MelodyTempo(200);
	Melodyplay(pitch_Ab5, qtrN); //g#
	Melodyplay(pitch_Db5, qtrN); //c#
	Melodyplay(pitch_P, eighthN); //8p
	Melodyplay(pitch_Db6, qtrN); //c#6
	Melodyplay(pitch_Bb5, eighthN); //8a#
	Melodyplay(pitch_Ab5, qtrN); //g#
	Melodyplay(pitch_Db5, qtrN); //c#
	Melodyplay(pitch_P, eighthN); //8p
	Melodyplay(pitch_Ab5, qtrN); //g#
	Melodyplay(pitch_Gb5, eighthN); //8f#
	Melodyplay(pitch_F5, eighthN); //8f
	Melodyplay(pitch_F5, eighthN); //8f
	Melodyplay(pitch_Gb5, eighthN); //8f#
	Melodyplay(pitch_Ab5, eighthN); //8g#
	Melodyplay(pitch_Db5, qtrN); //c#
	Melodyplay(pitch_Eb5, qtrN); //d#
	Melodyplay(pitch_F5, halfN); //2f
	Melodyplay(pitch_P, halfN); //2p
	Melodyplay(pitch_Ab5, qtrN); //g#
	Melodyplay(pitch_Db5, qtrN); //c#
	Melodyplay(pitch_P, eighthN); //8p
	Melodyplay(pitch_Db6, qtrN); //c#6
	Melodyplay(pitch_Bb5, eighthN); //8a#
	Melodyplay(pitch_Ab5, qtrN); //g#
	Melodyplay(pitch_Db5, qtrN); //c#
	Melodyplay(pitch_P, eighthN); //8p
	Melodyplay(pitch_Ab5, qtrN); //g#
	Melodyplay(pitch_Gb5, eighthN); //8f#
	Melodyplay(pitch_F5, eighthN); //8f
	Melodyplay(pitch_F5, eighthN); //8f
	Melodyplay(pitch_Gb5, eighthN); //8f#
	Melodyplay(pitch_Ab5, eighthN); //8g#
	Melodyplay(pitch_Db5, qtrN); //c#
	Melodyplay(pitch_Eb5, qtrN); //d#
	Melodyplay(pitch_Db5, halfN); //2c#
}

void AdamsFamily(){ //d=4, o=6, b=50
	MelodyTempo(50);
	Melodyplay(pitch_P, thirtyTwoN); //32P
	Melodyplay(pitch_Db6, thirtyTwoN); //32c#
	Melodyplay(pitch_Gb6, sixteenN); //16f#
	Melodyplay(pitch_Bb6, thirtyTwoN); //32a#
	Melodyplay(pitch_Gb6, sixteenN); //16f#
	Melodyplay(pitch_Db6, thirtyTwoN); //32c#
	Melodyplay(pitch_C6, sixteenN); //16c
	Melodyplay(pitch_Ab6, eighthN); //8g#
	Melodyplay(pitch_Gb6, thirtyTwoN); //32f#
	Melodyplay(pitch_F6, sixteenN); //16f
	Melodyplay(pitch_Ab6, thirtyTwoN); //32g#
	Melodyplay(pitch_F6, sixteenN); //16f
	Melodyplay(pitch_Db6, thirtyTwoN); //32c#
	Melodyplay(pitch_Bb5, sixteenN); //16a#5
	Melodyplay(pitch_Gb6, eighthN); //8f#
	Melodyplay(pitch_Db6, thirtyTwoN); //32c#
	Melodyplay(pitch_Gb6, sixteenN); //16f#
	Melodyplay(pitch_Bb6, thirtyTwoN); //32a#
	Melodyplay(pitch_Gb6, sixteenN); //16f#
	Melodyplay(pitch_Db6, thirtyTwoN); //32c#
	Melodyplay(pitch_C6, sixteenN); //16c
	Melodyplay(pitch_Ab6, eighthN); //8g#
	Melodyplay(pitch_Gb6, thirtyTwoN); //32f#
	Melodyplay(pitch_F6, sixteenN); //16f
	Melodyplay(pitch_Db6, thirtyTwoN); //32c#
	Melodyplay(pitch_Eb6, sixteenN); //16d#
	Melodyplay(pitch_F6, thirtyTwoN); //32f
	Melodyplay(pitch_Gb6, qtrN); //f#
	Melodyplay(pitch_Db6, thirtyTwoN); //32c#
	Melodyplay(pitch_Eb6, thirtyTwoN); //32d#
	Melodyplay(pitch_F6, thirtyTwoN); //32f
	Melodyplay(pitch_Gb6, qtrN); //f#
	Melodyplay(pitch_Db6, thirtyTwoN); //32c#
	Melodyplay(pitch_Eb6, thirtyTwoN); //32d#
	Melodyplay(pitch_G6, thirtyTwoN); //32g
	Melodyplay(pitch_Ab6, qtrN); //g#
	Melodyplay(pitch_Eb6, thirtyTwoN); //32d#
	Melodyplay(pitch_F6, thirtyTwoN); //32f
	Melodyplay(pitch_G6, thirtyTwoN); //32g
	Melodyplay(pitch_Ab6, sixteenN); //16g#.
	Melodyplay(pitch_Ab6, eighthN); //16g#.
	Melodyplay(pitch_Eb6, thirtyTwoN); //32d#
	Melodyplay(pitch_F6, thirtyTwoN); //32f
	Melodyplay(pitch_G6, thirtyTwoN); //32g
	Melodyplay(pitch_Ab6, sixteenN); //16g#.
	Melodyplay(pitch_Ab6, eighthN); //16g#.
	Melodyplay(pitch_Db6, thirtyTwoN); //32c#
	Melodyplay(pitch_Eb6, thirtyTwoN); //32d#
	Melodyplay(pitch_F6, thirtyTwoN); //32f
	Melodyplay(pitch_Gb6, thirtyTwoN); //32f#
}

void PinkPanther(){//d=4,o=5,b=160
	MelodyTempo(160);
	Melodyplay(pitch_Eb5, eighthN); //8d#
	Melodyplay(pitch_E5, eighthN); //8e
	Melodyplay(pitch_P, halfN); //2p
	Melodyplay(pitch_Gb5, eighthN); //8f#
	Melodyplay(pitch_G5, eighthN); //8g
	Melodyplay(pitch_P, halfN); //2p
	Melodyplay(pitch_Eb5, eighthN); //8d#
	Melodyplay(pitch_E5, eighthN); //8e
	Melodyplay(pitch_P, sixteenN); //16p
	Melodyplay(pitch_Gb5, eighthN); //8f#
	Melodyplay(pitch_G5, eighthN); //8g
	Melodyplay(pitch_P, sixteenN); //16p
	Melodyplay(pitch_C6, eighthN); //8c6
	Melodyplay(pitch_B5, eighthN); //8b
	Melodyplay(pitch_P, sixteenN); //16p
	Melodyplay(pitch_Eb5, eighthN); //8d#
	Melodyplay(pitch_E5, eighthN); //8e
	Melodyplay(pitch_P, sixteenN); //16p
	Melodyplay(pitch_B5, eighthN); //8b
	Melodyplay(pitch_Bb5, halfN); //2a#
	Melodyplay(pitch_P, halfN); //2p
	Melodyplay(pitch_A5, sixteenN); //16a
	Melodyplay(pitch_G5, sixteenN); //16g
	Melodyplay(pitch_E5, sixteenN); //16e
	Melodyplay(pitch_D5, sixteenN); //16d
	Melodyplay(pitch_E5, halfN); //2e
}

void BeethovenPlay(){
	MelodyTempo(240);
	Melodyplay(pitch_E6, qtrN);
	Melodyplay(pitch_Eb6, qtrN);
	Melodyplay(pitch_E6, qtrN);
	Melodyplay(pitch_Eb6, qtrN);
	Melodyplay(pitch_E6, qtrN);
	Melodyplay(pitch_B5, qtrN);
	Melodyplay(pitch_D6, qtrN);
	Melodyplay(pitch_C6, qtrN);
	Melodyplay(pitch_A5, halfN);
	Melodyplay(pitch_C5, qtrN);
	Melodyplay(pitch_E6, qtrN);
	Melodyplay(pitch_A6, qtrN);
	Melodyplay(pitch_B6, halfN);

	Melodyplay(pitch_E5, qtrN);
	Melodyplay(pitch_A5, qtrN);
	Melodyplay(pitch_B5, qtrN);
	Melodyplay(pitch_C6, halfN);
}

void Saregama(){
	MelodyTempo(240);
	Melodyplay(pitch_Db5, qtrN);
	Melodyplay(pitch_Eb5, qtrN);
	Melodyplay(pitch_F5, qtrN);
	Melodyplay(pitch_Gb5, qtrN);
	Melodyplay(pitch_Ab5, qtrN);
	Melodyplay(pitch_Bb5, qtrN);
	Melodyplay(pitch_C6, qtrN);
	Melodyplay(pitch_Db6, qtrN);
	Melodyplay(pitch_P, wholeN);
	Melodyplay(pitch_Db6, qtrN);
	Melodyplay(pitch_C6, qtrN);
	Melodyplay(pitch_Bb5, qtrN);
	Melodyplay(pitch_Ab5, qtrN);
	Melodyplay(pitch_Gb5, qtrN);
	Melodyplay(pitch_F5, qtrN);
	Melodyplay(pitch_Eb5, qtrN);
	Melodyplay(pitch_Db5, qtrN);
}

void main(){
	while(1){
		AdamsFamily();
		delay_ms(1000);
		LooneyToons();
		delay_ms(1000);
		Flintstones();
		delay_ms(1000);
		PinkPanther();
		delay_ms(1000);
		BeethovenPlay();
		delay_ms(1000);
		Saregama();
		delay_ms(1000);
	}
}
