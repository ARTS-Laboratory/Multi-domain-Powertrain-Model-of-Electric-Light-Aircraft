from scipy.optimize import curve_fit
from scipy.stats import linregress
import numpy as np
import math as m
import matplotlib.pyplot as plt
import os

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# BEGIN MAIN PROGRAM

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

file = "10SOCK220.csv"
input = open(file, "r")
file = file[:len(file)-4]

t = [] # time
i = [] # current
v = [] # voltage
P = [] # power
T_bat = [] # battery temp
T_amb = [] # ambient temp 

input.readline()
x=0
for line in input:
	splitter = line.split(",") # Split the columns
	if(float(splitter[1])>100):
		x+=1
		continue
	t.append(splitter[0])
	i.append(splitter[1])
	v.append(splitter[2])
	P.append(splitter[3])
	T_bat.append(splitter[4])
	T_amb.append(splitter[5])
	x+=1

x=0
output = open("/media/nate/External/loadSharing/PulseTests/"+file+"_clean.csv", "w")
output.write("time (s),Current (A), Voltage (V), Power (W), Battery Temp (C), Ambient Temp (C)\n")
while(x<len(t)):
	output.write(str(t[x])+","+str(i[x])+","+str(v[x])+","+str(P[x])+","+str(T_bat[x])+","+str(T_amb[x]))
	x=x+1