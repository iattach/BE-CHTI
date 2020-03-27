BE CHTI 
==== 
Avancement
----
Etape 1: Fait -> ETAPE 1/PROJ_UN/...<br>

Etape 2.1: Fait -> ETAPE 2/PROJ_UN/Calcul.s<br>

Etape 2.2: en cours -> ETAPE 2/PROJ_UN/dft.s<br>

Etape 2 Test
----
Signal.asm : pass

f1p-45.asm : pass

f17p30_f18p135.asm : fail

f23p-26_f24p-116.asm : fail

Indication pour faire les tests dans l'étape 2
----
Afin de faire les tests différents, veuillez de changer les codes suivants :
```c
extern short TabSig[64];//importer le signal simulé

res[k]=Mk(TabSig,k);
```
Changez ici `TabSig` avec les noms suivant:

>Signal.asm : `TabSig`

>f1p-45.asm : `TabSig1`

>f17p30_f18p135.asm : `TabSig2`

>f23p-26_f24p-116.asm : `TabSig3`

Rapport
----
On a précisé les avancements dans le [Rapport d’avancement _ BE intégration, partie ASM](https://github.com/iattach/BE-CHTI/blob/master/Rapport%20d%E2%80%99avancement%20_%20BE%20int%C3%A9gration%2C%20partie%20ASM.pdf)
