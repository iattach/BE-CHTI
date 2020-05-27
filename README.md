BE CHTI 
==== 
Groupe
---
Julien ROUZOT /
Yunan HOU /
Yuyuan YANG

Avancement
----
Obj1 -> fait

Obj2 -> fait

Obj3 -> fait

Obj4 -> en cours

Obj 1 Test
----


Signal.asm : phase 0 degré | amplitude 2048

Signal90.asm : phase -90 degrés | amplitude 2048

Indication pour faire les tests dans l'Obj 1
----
Afin de faire les tests différents, veuillez changer les codes suivants dans le Obj1/Src/principal.c:

```
extern short TabSig[64];//importer le signal simulé

res[k]=Mk(TabSig,k);
```
Changez ici TabSig avec les noms suivant:

Signal.asm : TabSig

Signal90.asm : TabSig1

Obj 2 Test
----
Exécutez le program, la table de scores va s'incrémenter, au final on aura 1,2,3,4,F 

Dans la table de scores ils correspondent aux 1 tir, 2 tirs , 3 tirs , 4 tirs , 5 tirs du signal.1 et 15 tirs du signal.2 

Obj 3 Test
----
Les résultats sont bien comme l'image dans le rapport ici : 

![image](https://github.com/iattach/BE-CHTI/raw/master/images_readme/obj3.png)

Obj 4 Test
----
En cours

Rapport
----
On a précisé les avancements dans le [Rapport d’avancement _ BE intégration, partie ASM](https://docs.google.com/document/d/1P1_2JFUTs7jzwzXKNZZaIuAOqxM8Aoy0CBaJVVXSG_U/edit?usp=sharing) rédigé par Google doc 
