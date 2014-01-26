#### CHARGEMENT DES CONSTANTES (maxima des compteurs)

# 13 = 1101 dans 000
li 10
mvar 01
mvra 11
li 11 # debut de li
shift
mvra 01
li 1 # fin de li
or
mvra 01
li 000 # addr
mvar 00
save 01

# 24 = 11000 dans 001
li 11
mvar 01
mvra 11
li 11 # debut de li
shift
mvra 01
li 001 # addr
mvar 00
save 01

# 29 = 24 + 5 dans 010
li 101
add
mvra 01
li 010 # addr
mvar 00
save 01

# 30 = 29 + 1 dans 011
li 1
add
mvra 01
li 011 # addr
mvar 00
save 01

# 31 = 30 + 1 dans 100
li 1
add
mvra 01
li 100 # addr
mvar 00
save 01

# 32 = 31 + 1 dans 101
li 1
add
mvra 01
li 101 # addr
mvar 00
save 01


# 60 = 111 100 dans 110
li 11
mvar 01
mvra 11
li 111 # debut de li
shift
mvra 01
li 100 # fin de li
or
mvra 01
li 110 # addr
mvar 00
save 01

# 100 =  dans 111
li 101
mvar 01
mvra 11
li 11 # debut de li
shift
mvra 01
li 100 # fin de li
or
mvra 01
li 111 # addr
mvar 00
save 01



#### CHARGEMENT DES CONSTANTES (date initiale)
incr
	
	# j = 30 = 11 110
	li 11
	mvar 01
	mvra 11
	li 11 # debut de li
	shift
	mvra 01
	li 110 # fin de li
	or
	mvra 01
	li 0 # addr
	mvar 00
	save 01
	
	mvar 10
	mvra 00
	output 0
	
	# m = 12 = 1 100
	li 10
	mvar 01
	mvra 11
	li 11
	shift
	mvra 01
	li 1 # addr
	mvar 00
	save 01
	
	mvar 10
	mvra 00
	output 1
	
	# an1 = 20 = 10 100
	li 10
	mvar 01
	mvra 11
	li 101
	shift
	mvra 01
	li 10 # addr
	mvar 00
	save 01
	
	mvar 10
	mvra 00
	output 10
	
	# an2 = 99 = 1 100 011
	li 101
	mvar 01
	mvra 11
	li 11 # debut de li
	shift
	mvra 01
	li 11 # fin de li
	or
	mvra 01
	li 11 # addr
	mvar 00
	save 01
	
	mvar 10
	mvra 00
	output 11
	
	
	#s = 55 = 110 111
	li 11
	mvar 01
	mvra 11
	li 110 # debut de li
	shift
	mvra 01
	li 111 # fin de li
	or
	mvra 01
	li 110 # addr
	mvar 00
	save 01
	
	mvar 10
	mvra 00
	output 110
	
	#mn = 59 = 111 011
	li 11
	mvar 01
	mvra 11
	li 111 # debut de li
	shift
	mvra 01
	li 11 # fin de li
	or
	mvra 01
	li 101 # addr
	mvar 00
	save 01
	
	mvar 10
	mvra 00
	output 101
	
	#h = 23 = 10 111
	li 11
	mvar 01
	mvra 11
	li 10 # debut de li
	shift
	mvra 01
	li 111 # fin de li
	or
	mvra 01
	li 100 # addr
	mvar 00
	save 01
	
	mvar 10
	mvra 00
	output 100 # -- 100
	
	
	#### CHARGEMENT DES CONSTANTES (jump)
	
	incr # -- 171
	
		# L0 = 194 = 11000010 dans 000
		li 110
		mvar 01
		mvra 11
		li 11 # debut de li
		shift
		mvra 01
		li 10 # fin de li
		or
		mvra 01
		li 0 # addr
		mvar 00
		save 01
		
		# L2 = 8 dans 010
		li 11
		mvar 01
		mvra 11
		li 1 # debut de li
		shift
		mvra 01
		li 10 # addr
		mvar 00
		save 01
		
		
		##### DEBUT DE LA BOUCLE PRINCIPALE
		nop
		nop
		nop
		flip # -- L0
		
		
		# load old input
		li 111
		mvar 00
		load 00
		# read & compare input
		input 01
		sub # 0->1 ? : dans l'overflow r1
		# save input
		li 111
		mvar 00
		save 01
		
		# branch
		li 10
		mvar 00
		load 01
		iio 11
		jfra 00
		jfra 01
		# loop
		li 0
		mvar 00
		mvra 01
		li 0
		mvar 00
		load 00
		jaaa
		
		
		## INCR s
		# load s
		decr
	li 110
	mvar 00
	load 01
	
	# incr
	li 1
	add
	mvra 01
	mvra 00
	output 110
	
	# save s
	li 110
	mvar 00
	save 01
	decr
# load 60
li 110
mvar 00
load 00
incr
	incr
		sub
		# branch
		li 10
		mvar 01
		load 11
		iio 10
		jfra 01
		# loop
		li 0
		mvar 00
		mvra 01
		li 0
		mvar 00
		load 00
		jaaa
		
		## INCR mn
		decr
	# raz s
	li 110
	mvar 00
	li 0
	save 00
	output 110
	
	# load mn
	li 101
	mvar 00
	load 01
	
	# incr
	li 1
	add
	mvra 01
	mvra 00
	output 101
	
	# save mn
	li 101
	mvar 00
	save 01
	decr
# load 60
li 110
mvar 00
load 00
incr
	incr
		sub
		# branch
		li 10
		mvar 01
		load 11
		iio 10
		jfra 01
		# loop
		li 0
		mvar 00
		mvra 01
		li 0
		mvar 00
		load 00
		jaaa
		
		## INCR h
		decr
	# raz mn
	li 101
	mvar 00
	li 0
	save 00
	output 101
	
	# load h
	li 100
	mvar 00
	load 01
	
	# incr
	li 1
	add
	mvra 01
	mvra 00
	output 100
	
	# save h
	li 100
	mvar 00
	save 01
	decr
# load 24
li 001
mvar 00
load 00
incr
	incr
		sub
		# branch
		li 10
		mvar 01
		load 11
		iio 10
		jfra 01
		# loop
		li 0
		mvar 00
		mvra 01
		li 0
		mvar 00
		load 00
		jaaa
		
		
		## INCR j
		decr
	# raz h
	li 100
	mvar 00
	li 0
	save 00
	output 100
	
	# load j
	li 0
	mvar 00
	load 01
	
	# incr
	li 1
	add
	mvra 01
	mvra 00
	output 0
	
	# save j
	li 0
	mvar 00
	save 01
	### LOAD NOMBRE DE JOURS DANS LE MOIS COURANT + 1
	li 1
	mvar 00
	load 00
	
	incr
		# test moitie de l'annee
		li 10
		mvar 00
		load 01
		and
		# pre-branch
		li 10
		mvar 01
		load 11
		mvar 10
		decr
	# load m (again)
	li 1
	mvar 01
	load 10
	# branch
	iio 10
	jfra 01
	# debut de l'annee
	mvar 00
	mvra 01
	li 101
	and
	li 101
	jfra 00
	nop
	# fin de l'annee
	not
	mvra 01
	li 101
	and
	
	decr
load 00
incr
	incr
		sub
		# branch
		li 10
		mvar 01
		load 11
		iio 10
		jfra 01
		# loop
		li 0
		mvar 00
		mvra 01
		li 0
		mvar 00
		load 00
		jaaa
		
		
		## INCR m
		decr
	# ra1 j
	li 0
	mvar 00
	li 1
	save 00
	output 0
	
	# load m
	li 1
	mvar 00
	load 01
	
	# incr
	add
	mvra 01
	mvra 00
	output 1
	
	# save m
	li 1
	mvar 00
	save 01
	decr
# load 13
li 0
mvar 00
load 00
incr
	incr
		sub
		# branch
		li 10
		mvar 01
		load 11
		iio 10
		jfra 01
		# loop
		li 0
		mvar 00
		mvra 01
		li 0
		mvar 00
		load 00
		jaaa
		
		## INCR a1
		decr
	# ra1 m
	li 1
	mvar 00
	li 1
	save 00
	output 1
	
	# load a1
	li 11
	mvar 00
	load 01
	
	# incr
	li 1
	add
	mvra 01
	mvra 00
	output 11
	
	# save a1
	li 11
	mvar 00
	save 01
	decr
# load 100
li 111
mvar 00
load 00
incr
	incr
		sub
		# branch
		li 10
		mvar 01
		load 11
		iio 10
		jfra 01
		# loop
		li 0
		mvar 00
		mvra 01
		li 0
		mvar 00
		load 00
		jaaa
		
		
		## INCR a2
		decr
	# raz a1
	li 11
	mvar 00
	li 0
	save 00
	output 11
	
	# load a1
	li 10
	mvar 00
	load 01
	
	# incr
	li 1
	add
	mvra 01
	mvra 00
	output 10
	
	# save a1
	li 10
	mvar 00
	save 01
	decr
# load 100
li 111
mvar 00
load 00
incr
	incr
		sub
		# branch
		li 10
		mvar 01
		load 11
		iio 10
		jfra 01
		# loop
		li 0
		mvar 00
		mvra 01
		li 0
		mvar 00
		load 00
		jaaa
		
		## RAZ
		decr
	# raz a2
	li 10
	mvar 00
	li 0
	save 00
	output 10
	incr
		# loop
		li 0
		mvar 00
		mvra 01
		li 0
		mvar 00
		load 00
		jaaa






end


