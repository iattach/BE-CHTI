	thumb

	area  madata, data, readwrite
	
	export 	calcul
		
	area  moncode, code, readonly
	import TabSin
	import TabCos
		
calcul proc
	push	{lr}			;l'adresse de la programme dans la pile
	push	{r4}			;le valeur de i dans c dans la pile
	mov	r12 ,#1			;donner	2 octets dans r12
	mul 	r0,r0,r12		;r0=i en c ,calcul le décalage de l'adresse dans le sin et cos
	push	{r5};			;utiliser r5
	ldr	r5,=TabSin		;r5=sin
	push	{r6}			;utiliser r6
	ldr	r6,=TabCos		;r6=cos
	ldrsh 	r1,[r5,r0,lsl #1]	;r1=r5+r0*2^1 (lsl #1=decalage à gauche =2^#1=10(binaire))
	ldrsh 	r2,[r6,r0,lsl #1]	;r2=r6+r0*2^1
	pop	{r6}			;r5 vider
	pop	{r5}			;r6 vider
	
	add 	r1,r1,r1		;r1=r1.F*r1.F	sin^2
	AND	r1,#0xFFFF7FFF
	add 	r2,r2,r2		;r2=r2.F*r2.F	cos^2
	AND	r2,#0xFFFF7FFF
	add	r0,r1,r2		;r0=r1+r2	sin^2+cos^2
	pop 	{r4}			;
	pop	{lr}
	bx	lr	;sauter dans l'adresse de la fonction de c
	
	endp
	end