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
	
	# j
	li 11
	mvar 01
	mvra 11
	li [j_h] # debut de li
	shift
	mvra 01
	li [j_l] # fin de li
	or
	mvra 01
	li 0 # addr
	mvar 00
	save 01
	
	mvar 10
	mvra 00
	output 0
	
	# m
	li 11
	mvar 01
	mvra 11
	li [m_h] # debut de li
	shift
	mvra 01
	li [m_l] # fin de li
	or
	mvra 01
	li 1 # addr
	mvar 00
	save 01
	
	mvar 10
	mvra 00
	output 1
	
	# a1
	li 11
	mvar 01
	mvra 11
	li [a1_h] # debut de li
	shift
	mvra 01
	li [a1_m] # milieu de li
	or
	li 11
	mvar 01
	mvra 11
	mvra 00
	shift
	mvra 01
	li [a1_l] # fin de li
	or
	mvra 01
	li 10 # addr
	mvar 00
	save 01
	
	mvar 10
	mvra 00
	output 10
	
	# a2
	li 11
	mvar 01
	mvra 11
	li [a2_h] # debut de li
	shift
	mvra 01
	li [a2_m] # milieu de li
	or
	li 11
	mvar 01
	mvra 11
	mvra 00
	shift
	mvra 01
	li [a2_l] # fin de li
	or
	mvra 01
	li 10 # addr
	mvar 00
	save 01
	
	mvar 10
	mvra 00
	output 11
	
	
	#s
	li 11
	mvar 01
	mvra 11
	li [s_h] # debut de li
	shift
	mvra 01
	li [s_l] # fin de li
	or
	mvra 01
	li 110 # addr
	mvar 00
	save 01
	
	mvar 10
	mvra 00
	output 110
	
	# mn
	li 11
	mvar 01
	mvra 11
	li [mn_h] # debut de li
	shift
	mvra 01
	li [mn_l] # fin de li
	or
	mvra 01
	li 101 # addr
	mvar 00
	save 01
	
	mvar 10
	mvra 00
	output 101
	
	# h
	li 11
	mvar 01
	mvra 11
	li [h_h] # debut de li
	shift
	mvra 01
	li [h_l] # fin de li
	or
	mvra 01
	li 100 # addr
	mvar 00
	save 01
	
	mvar 10
	mvra 00
	output 100
	
	
	#### CHARGEMENT DES CONSTANTES (jump)
	
	# annee, pour le mois de fevrier
	li 11
	mvar 00
	load 01
	
	incr
		#### CONSTRUCTION DE LA LUT POUR LES MOIS
		incr
			li 1
			mvar 00
			li 101
			save 00
			
			# Fevrier
			li 11
			and
			li 010
			iio 10
			li 011
			mvar 01
			mvra 11
			li 10
			mvar 00
			save 01
			
			li 11
			mvar 00
			li 101
			save 00
			li 100
			mvar 00
			li 100
			save 00
			li 101
			mvar 00
			li 101
			save 00
			li 110
			mvar 00
			li 100
			save 00
			li 111
			mvar 00
			li 101
			save 00
			
			incr
				li 0
				mvar 00
				li 101
				save 00
				li 1
				mvar 00
				li 100
				save 00
				li 10
				mvar 00
				li 101
				save 00
				li 11
				mvar 00
				li 100
				save 00
				li 100
				mvar 00
				li 101
				save 00
				decr
			decr
		
		# L0 = 18(10010) + 256 dans 000
		li 11
		mvar 01
		mvra 11
		li 10 # debut de li
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
		flip # -- L0
		
#======(
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
		li 1
		mvar 00
		mvra 01
		li 0
		mvar 00
		load 00
		jaaa
#======)
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
		li 1
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
		li 1
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
		li 1
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
		incr
			mvar 00
			load 00
			mvar 00
			decr
		decr
	decr
load 01
incr
	# load j
	li 0
	mvar 00
	load 00
	incr
		sub
		# branch
		li 10
		mvar 01
		load 11
		iio 10
		jfra 01
		# loop
		li 1
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
		li 1
		mvar 00
		mvra 01
		li 0
		mvar 00
		load 00
		jaaa
		
		## INCR a2
		decr
	# ra1 m
	li 1
	mvar 00
	li 1
	save 00
	output 1
	
	# load a2
	li 11
	mvar 00
	load 01
	
	# incr
	li 1
	add
	mvra 01
	mvra 00
	output 11
	
	# save a2
	li 11
	mvar 00
	save 01
	
	# change la LUT du nombre de jours par mois a Fevrier
	li 11
	and
	li 010
	iio 10
	li 011
	mvar 00
	mvra 01
	incr
		incr
			li 10
			mvar 00
			save 01
			decr
		decr
	
	# load a2 (again)
	li 11
	mvar 00
	load 01
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
		li 1
		mvar 00
		mvra 01
		li 0
		mvar 00
		load 00
		jaaa
		
		
		## INCR a1
		decr
	# raz a2
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
		li 1
		mvar 00
		mvra 01
		li 0
		mvar 00
		load 00
		jaaa
		
		## RAZ
		decr
	# raz a1
	li 10
	mvar 00
	li 0
	save 00
	output 10
	incr
		# loop
		li 1
		mvar 00
		mvra 01
		li 0
		mvar 00
		load 00
		jaaa






end


