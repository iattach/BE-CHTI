BE CHTI 
==== 
Groupe
---
Julien ROUZOT /
Yunan HOU /
Yuyuan YANG

Avancement
----
Etape 1: Fait -> ETAPE 1/...<br>

Etape 2.1: Fait -> ETAPE 2/Calcul.s<br>

Etape 2.2 / Objet 1: Fait -> ETAPE 2/dft.s<br>

Etape 3 / objet 2 : Fait -> ETAPE 3 

Etape 2 Test
----
Signal.asm : phase 0 degré | amplitude 2048

Signal90.asm : phase -90 degrés | amplitude 2048

Indication pour faire les tests dans l'étape 2.2
----
Afin de faire les tests différents, veuillez changer les codes suivants dans le ETAPE 2/Src/principal.c:

```
extern short TabSig[64];//importer le signal simulé

res[k]=Mk(TabSig,k);
```
Changez ici TabSig avec les noms suivant:

Signal.asm : TabSig

Signal90.asm : TabSig1

Performmance
---
Speed :  
0.00068275-0.00029088=0.00039187 sec

Size :

Etape 3 Test
----
Exécutez le program, la table de scores va s'incrémenter, au final on aura 1,2,3,4,F dans la table de scores 
qui correspondent aux 1 tir, 2 tirs , 3 tirs , 4 tirs , 5 tirs du signal.1 et 15 tirs du signal.2 

Rapport
----
On a précisé les avancements dans le [Rapport d’avancement _ BE intégration, partie ASM](https://github.com/iattach/BE-CHTI/blob/master/Rapport%20d%E2%80%99avancement%20_%20BE%20int%C3%A9gration%2C%20partie%20ASM.pdf)
