#include <stdio.h>
#define N 64

short calcul( int);	//16 bit => short sin^2+cos^2

extern short TabSig3[64];//importer le signal simulé

int res[64];		//resultat

int Mk(short*,int);	//32 bit => int 


int main(void)
{
	for(int k=0;k< N; k++){
		
		res[k]=Mk(TabSig3,k);
	}
	
	while(1)
	{
	}
}
