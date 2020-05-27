#include <stdio.h>
#include "gassp72.h"
#define N 64
#define SYSTICK_PER 1440000 //20ms=72*20 000= 1440 000
#define SEUIL 0xf0400 // 984064 => E.F=32.0 =>0xf0400

//soit 20 ms

//short calcul( int);	//16 bit => short sin^2+cos^2

//extern short TabSig[64];//importer le signal simulé

//int res[64];		//resultat
vu16 dma_buf[64];
int Mk(vu16*,int);	//32 bit => int 
int compteur[6]={0,0,0,0,0,0};//compteur
int score[6]={0,0,0,0,0,0};

void sys_callback(){

	int joueur[6] ={17,18,19,20,23,24};

	// Démarrage DMA pour 64 points
	Start_DMA1(64);
	Wait_On_End_Of_DMA1();
	Stop_DMA1;

	for	(int f=0;f<6;f++){
		if (Mk(dma_buf,joueur[f])> SEUIL){
			compteur[f]++;
		} else{
			compteur[f]=0;
		}
		if (compteur[f]>3){
			compteur[f]=0;
			score[f]++;
		}
	}	


}


int main(void)
{
	// activation de la PLL qui multiplie la fréquence du quartz par 9
	CLOCK_Configure();
	// PA2 (ADC voie 2) = entrée analog
	GPIO_Configure(GPIOA, 2, INPUT, ANALOG);
	// PB1 = sortie pour profilage à l'oscillo
	GPIO_Configure(GPIOB, 1, OUTPUT, OUTPUT_PPULL);
	// PB14 = sortie pour LED
	GPIO_Configure(GPIOB, 14, OUTPUT, OUTPUT_PPULL);

	// activation ADC, sampling time 1us
	Init_TimingADC_ActiveADC_ff( ADC1, 82 );
	Single_Channel_ADC( ADC1, 2 );
	// Déclenchement ADC par timer2, periode (72MHz/320kHz)ticks
	Init_Conversion_On_Trig_Timer_ff( ADC1, TIM2_CC2, 225 );
	// Config DMA pour utilisation du buffer dma_buf (a créér)
	Init_ADC1_DMA1( 0, dma_buf );

	// Config Timer, période exprimée en périodes horloge CPU (72 MHz)
	Systick_Period_ff( SYSTICK_PER );
	// enregistrement de la fonction de traitement de l'interruption timer
	// ici le 3 est la priorité, sys_callback est l'adresse de cette fonction, a créér en C
	Systick_Prio_IT( 3, sys_callback );
	SysTick_On;
	SysTick_Enable_IT;

	
	
	while(1)
	{
	}
}
