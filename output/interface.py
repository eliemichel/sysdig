import Tkinter as tk
window = tk.Tk()

frame = tk.Frame(window)
frame.pack()

# 00/00/0000 00:00:00
inp1 = "0001001 0010100 0001110 0000100 0010001 0000011 0100111 0001001 0001010 1001000 0001001 0001111 0100101 0011001"
inp2 = "0101001 0011100 0100000 0000000 0000100 0111000 0111000 0001001 1111010 1001111 0001001 0111111 0100101 1011001"

pan = tk.PanedWindow()
pan.pack( expand=1)
pan2 = tk.PanedWindow()
pan2.pack( expand=1)

L1 = tk.Label(window, text="Fixer une nouvelle date (format JJ/MM/AAAA hh:mm:ss) :")
J = tk.Entry(window, width = 2)
L2 = tk.Label(window, text="/")
M = tk.Entry(window, width = 2)
L3 = tk.Label(window, text="/")
An = tk.Entry(window, width = 4)
L4 = tk.Label(window, text="   ")
H = tk.Entry(window, width = 2)
L5 = tk.Label(window, text=":")
Mn = tk.Entry(window, width = 2)
L6 = tk.Label(window, text=":")
S = tk.Entry(window, width = 2)

L0 = tk.Label(frame, text="Date/Heure impossible", fg = "red")


def GET():
	if (J.get() == "") : 
		L0.pack()
		return
	else : day0 = int(J.get())

	if (M.get() == "") :
		L0.pack()
		return
	else : month0 = int(M.get())
	if (An.get() == "") :
		L0.pack()
		return
	else : year0 = int(An.get())
	if (H.get() == "") :
		L0.pack()
		return
	else : hour0 = int(H.get())
	if (Mn.get() == "") :
		L0.pack()
		return
	else : mi0 = int(Mn.get())
	if (S.get() == "") :
		L0.pack()
		return
	else : sec0 = int(S.get())
	if ((day0 >= 1) and (day0 <=31 ) and (month0 >= 1) and (month0 <= 12) and (year0 >=0) and (year0 <=9999) and (hour0 <= 23) and (hour0 >= 0) and (mi0 <= 59) and (mi0 >= 0) and (sec0 <= 59) and (sec0 >=0)) :
		day = day0
		month = month0
		year = year0
		hour = hour0
		mi = mi0
		sec = sec0
		L0.pack_forget()
	else : L0.pack()

submit = tk.Button(window, text="Fixer", width=5, command=GET )

# pan.add(L1)
# pan.add(J)
# pan.add(L2)
# pan.add(M)
# pan.add(L3)
# pan.add(An)
# pan.add(L4)
# pan.add(H)
# pan.add(L5)
# pan.add(Mn)
# pan.add(L6)
# pan.add(S)
# pan.add(submit)

Can = tk.Canvas ( window, width = 1000, height = 400 )


def disp_int(ix, iy, mask) :
	A = ix+e,iy, ix+e+l,iy, ix+e+l,iy+e, ix+e,iy+e, ix+e,iy
	B = ix+e+l,iy+e, ix+2*e+l,iy+e, ix+2*e+l,iy+e+l, ix+e+l,iy+e+l, ix+e+l,iy+e
	C = ix+e+l,iy+2*e+l, ix+2*e+l,iy+2*e+l, ix+2*e+l,iy+2*e+2*l, ix+e+l,iy+2*e+2*l, ix+e+l,iy+2*e+l
	D = ix+e,iy+2*e+2*l, ix+e+l,iy+2*e+2*l, ix+e+l,iy+e+2*e+2*l, ix+e,iy+e+2*e+2*l, ix+e,iy+2*e+2*l
	E = ix,iy+2*e+l, ix+e,iy+2*e+l, ix+e,iy+2*e+2*l, ix,iy+2*e+2*l, ix,iy+2*e+l
	F = ix,iy+e, ix+e,iy+e, ix+e,iy+e+l, ix,iy+e+l, ix,iy+e
	G = ix+e,iy+e+l, ix+e+l,iy+e+l, ix+e+l,iy+e+e+l, ix+e,iy+e+e+l, ix+e,iy+e+l

	lineA = Can.create_line(A)
	lineB = Can.create_line(B)
	lineC = Can.create_line(C)
	lineD = Can.create_line(D)
	lineE = Can.create_line(E)
	lineF = Can.create_line(F)
	lineG = Can.create_line(G)

	if (int(mask[0]) == 1) : lineA = Can.create_polygon(A)
	if (int(mask[1]) == 1) : lineB = Can.create_polygon(B)
	if (int(mask[2]) == 1) : lineC = Can.create_polygon(C)
	if (int(mask[3]) == 1) : lineD = Can.create_polygon(D)
	if (int(mask[4]) == 1) : lineE = Can.create_polygon(E)
	if (int(mask[5]) == 1) : lineF = Can.create_polygon(F)
	if (int(mask[6]) == 1) : lineG = Can.create_polygon(G)

def disp_colon(ix, iy) :
	Can.create_oval(ix,iy+2*e+2*l, ix+e,iy+e+2*l, fill = "black")

def disp_slash(ix, iy) :
	Can.create_polygon(ix,iy+3*e+2*l, ix+asl,iy, ix+asl+e,iy, ix+e,iy+3*e+2*l)

# Affichage
l = 60
e = 12
s = 100
asl = 60
ix2 = 150
colon = 30

def draw(inp):
	global Can, l, e, s, asl, colon, ix2
	Can.delete("all")

	j1 = inp[0:7]
	j2 = inp[8:15]
	m1 = inp[16:23]
	m2 = inp[24:31]
	a1 = inp[32:39]
	a2 = inp[40:47]
	a3 = inp[48:55]
	a4 = inp[56:63]
	h1 = inp[64:71]
	h2 = inp[72:79]
	mn1 = inp[80:87]
	mn2 = inp[88:95]
	s1 = inp[96:103]
	s2 = inp[104:111]

	ix = 40
	iy = 10
	disp_int(ix, iy, j1)
	ix += s
	disp_int(ix, iy, j2)
	ix += 90
	aslash1 = disp_slash(ix, iy)
	ix += s-e
	disp_int(ix, iy, m1)
	ix += s
	disp_int(ix, iy, m2)
	ix += 90
	aslash2 = disp_slash(ix, iy)
	ix += s-e
	disp_int(ix, iy, a1)
	ix += s
	disp_int(ix, iy, a2)
	ix += s
	disp_int(ix, iy, a3)
	ix += s
	disp_int(ix, iy, a4)
	iy += 3*l
	ix = ix2
	disp_int(ix, iy, h1)
	ix += s
	disp_int(ix, iy, h2)
	ix += s
	colon11 = disp_colon(ix, iy)
	colon12 = disp_colon(ix, iy)
	ix += colon
	disp_int(ix, iy, mn1)
	ix += s
	disp_int(ix, iy, mn2)
	ix += s
	colon21 = disp_colon(ix, iy)
	colon22 = disp_colon(ix, iy)
	ix += colon
	disp_int(ix, iy, s1)
	ix += s
	disp_int(ix, iy, s2)

Can.pack()

But = tk.Button(window, text ="Quit", command = window.quit)
But.pack()

window.mainloop()


