*Met 10 dans r1 (pr sauter 10 instr + tard)
li 0101      *L0    !ce li prend 10 instr
mvar 01

*Regarde ds la mem quelle était le val prec du quartz=q
*en considérant qu'elle est à l'adr 1, met ds a1
li 1       *L1
mvar 00
load 00

*Teste si a1 = 0, saut si a1 = 1
iio 01

jfra 11    *Saute à 10 instr après (à L4)

*Met à jour la val stockée du q, à l'adr 1
li 1
mvar 00
input 00
save 00

*Revient au début (L1), met 0 dans a0 et a1
li 0
mvar 00
mvra 01
li 0 
jaaa    *revient à L0 

*2e partie

*Si on arrive ici, c'est que le q est à 0
*On charge 12 dans r1
li 0011      *L4
mvra 01

*On veut voir si la nouvelle valeur est à 1
input 00    *L2
mvar 00
mvra 01
li 1
and
iio 10

*Sauté si q = 1, pas sauté sinon, et va 5 instr après
jfra 11

*Si q = 0 encore, on va revenir à L2
li 10001
jbra 00     *revient 17 instr avant, à L2

*3e partie
*Si on arrive là, c'est qu'on est passé de 0 à 1, on incrémente

* j m a1 a2 h mn s de 10 à 1000

*s


*Lit s dans r1
li 0001         * adresse de s
mvar 00
load 00
mvar 01

*Comparer a0 et 59
li 110111     *59  
mvra 11
sub
*Met r0 -> r1
mvra 10
mvar 01
*Charge 35 dans a0     *
li 110001
*Saute à L5 si r1 <> 0
iio 11

jbra 00

*Si on est là, c'est que s <> 59, on l'incrémente simplement
li 0001         *
mvar 00
load 01
li 1
add
mvra 01
li 0001         *
mvar 00
save 01
*On retourne ensuite au tout début, L0
li 0
mvar 00
mvra 01
li 0 * <-- adresse de L0
jaaa

*Si on arrive là, s = 59, on met s = 0
li 0001         *L5
mvar 00
li 0
save 00

*mn

*Lit s dans r1
li 111          *
mvar 00
load 00
mvar 01

*Comparer a0 et 59
li 110111     *59  
mvra 11
sub
*Met r0 -> r1
mvra 10
mvar 01
*Charge 15 dans a0     *
li 1111
*Saute à L6 si r1 <> 0
iio 11

jbra 00

*Si on est là, c'est que mn <> 59, on l'incrémente simplement
li 111         *
mvar 00
load 01
li 1
add
mvra 01
li 111         *
mvar 00
save 01
*On retourne ensuite au tout début, L0
li 0
mvar 00
mvra 01
li 0 * <-- adresse de L0
jaaa

*Si on arrive là, mn = 59, on met mn = 0
li 111         *L6
mvar 00
li 0
save 00

*h

*Lit h dans r1
li 011          *
mvar 00
load 00
mvar 01

*Comparer a0 et 23
li 11101     *23  
mvra 11
sub
*Met r0 -> r1
mvra 10
mvar 01
*Charge 15 dans a0     *
li 1111
*Saute si r1 <> 0
iio 11

jbra 00

*Si on est là, c'est que h <> 23, on l'incrémente simplement
li 011         *
mvar 00
load 01
li 1
add
mvra 01
li 011         *
mvar 00
save 01
*On retourne ensuite au tout début, L0
li 0
mvar 00
mvra 01
li 0 * <-- adresse de L0
jaaa

*Si on arrive là, h = 23, on met h = 0
li 011         *
mvar 00
li 0
save 00

*j

*Lit j dans r1
li 01          *
mvar 00
load 00
mvar 01

*Comparer a0 et 30
li 01111     *30  
mvra 11
sub
*Met r0 -> r1
mvra 10
mvar 01
*Charge 15 dans a0     *
li 1111
*Saute si r1 <> 0
iio 11

jbra 00

*Si on est là, c'est que j <> 30, on l'incrémente simplement
li 01         *
mvar 00
load 01
li 1
add
mvra 01
li 01         *
mvar 00
save 01
*On retourne ensuite au tout début, L0
li 0
mvar 00
mvra 01
li 0 * <-- adresse de L0
jaaa

*Si on arrive là, j = 30, on met j = 0
li 01         *
mvar 00
li 0
save 00

*m

*Lit m dans r1
li 11          *
mvar 00
load 00
mvar 01

*Comparer a0 et 12
li 00111     *12  
mvra 11
sub
*Met r0 -> r1
mvra 10
mvar 01
*Charge 15 dans a0     *
li 1111
*Saute si r1 <> 0
iio 11

jbra 00

*Si on est là, c'est que m <> 12, on l'incrémente simplement
li 11         *
mvar 00
load 01
li 1
add
mvra 01
li 11         *
mvar 00
save 01
*On retourne ensuite au tout début, L0
li 0
mvar 00
mvra 01
li 0 * <-- adresse de L0
jaaa

*Si on arrive là, m = 12, on met m = 0
li 11         *
mvar 00
li 0
save 00



*an2

*Lit an2 dans r1
li 101          *
mvar 00
load 00
mvar 01



*Comparer a0 et 99
*Charger 99 :
li 1
mvar 00
mvra 01
li 110011
shift
add * on a déjà 1 dans a1 (hasard)
mvra 00

mvra 11
sub
*Met r0 -> r1
mvra 10
mvar 01
*Charge 15 dans a0     *
li 1111
*Saute si r1 <> 0
iio 11

jbra 00

*Si on est là, c'est que an1 <> 99, on l'incrémente simplement
li 101         *
mvar 00
load 01
li 1
add
mvra 01
li 101         *
mvar 00
save 01
*On retourne ensuite au tout début, L0
li 0
mvar 00
mvra 01
li 0 * <-- adresse de L0
jaaa

*Si on arrive là, an1 = 99, on met an1 = 0
li 101         *
mvar 00
li 0
save 00

*an1

*Lit an1 dans r1
li 001          *
mvar 00
load 00
mvar 01

*Comparer a0 et 99
*Charger 99 :
li 1
mvar 00
mvra 01
li 110011
shift
add * on a déjà 1 dans a1 (hasard)
mvra 00

mvra 11
sub
*Met r0 -> r1
mvra 10
mvar 01
*Charge 15 dans a0     *
li 1111
*Saute si r1 <> 0
iio 11

jbra 00

*Si on est là, c'est que an1 <> 99, on l'incrémente simplement
li 001         *
mvar 00
load 01
li 1
add
mvra 01
li 001         *
mvar 00
save 01
*On retourne ensuite au tout début, L0
li 0
mvar 00
mvra 01
li 0 * <-- adresse de L0
jaaa

*Si on arrive là, an1 = 99, on est dans la merde
