BE CHTI 
==== 
Avancement
----
Etape 1: Fait -> ETAPE 1/PROJ_UN/...<br>

Etape 2.1: Fait -> ETAPE 2/PROJ_UN/Calcul.s<br>

Etape 2.2: Fait -> ETAPE 2/PROJ_UN/dft.s<br>

Etape 2 Test
----
Signal.asm : phase 0 degré

Signal90.asm : phase -90 degrés

Indication pour faire les tests dans l'étape 2.2
----
Afin de faire les tests différents, veuillez changer les codes suivants dans le ETAPE 2/PROJ_UN/Src/principal.c:

```
extern short TabSig[64];//importer le signal simulé

res[k]=Mk(TabSig,k);
```
Changez ici TabSig avec les noms suivant:

Signal.asm : TabSig

Signal90.asm : TabSig1

Rapport
----
On a précisé les avancements dans le [Rapport d’avancement _ BE intégration, partie ASM](https://github.com/iattach/BE-CHTI/blob/master/Rapport%20d%E2%80%99avancement%20_%20BE%20int%C3%A9gration%2C%20partie%20ASM.pdf)
