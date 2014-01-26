#!/usr/bin/env python

import serial
import struct
import time
from sys import stdout

ser = serial.Serial('/dev/ttyACM0', 9600)

ser.open()

ser.flushInput()
ser.flushOutput()

t = time.time()
oldB = 0

while True :
	b = struct.unpack('B', ser.read())[0]
	if (b != oldB) :
		if oldB == 49 :
			nt = time.time()
			print(nt - t)
			t = nt
		oldB = b



