#include <stdio.h>
#define N 64

short calcul( int);

int res[64];

int main(void)
{
	for(int i=0;i< N; i++){
		
		res[i]=calcul(i);
	}
	
	while(1)
	{
	}
}
