#!/usr/bin/env python

import serial
import struct
import time

ser = serial.Serial('/dev/ttyACM0', 9600)

ser.open()

ser.flushInput()
ser.flushOutput()

t = time.time()
oldB = 0

while True :
	b = struct.unpack('B', ser.read())[0]
	#print(b)
	if (b != oldB) :
		nt = time.time()
		print(nt - t)
		t = nt
		oldB = b




