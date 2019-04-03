'''
## Introduction to Python sample program 2
## file: introPython02.py
## Adapted from "Matplotlib Release 3.0.3" by John Hunter, Darren Dale, Eric Firing, Michael Droettboom 
## and the Matplotlib development team
## Release date: February 28, 2019
## PDF document available at https://matplotlib.org/Matplotlib.pdf

# Python example program 2
# Reading in data
# Plots using matplotlib
'''


import matplotlib.pyplot as plt

# Creating variables
xs = [1,3,5,7,9]
ys = [x**2 for x in xs]

# Simple plot
plt.plot(xs, ys)

xs = range(-100,100,10)
x2 = [x**2 for x in xs]
negx2 = [-x**2 for x in xs]

# Combined plot

plt.plot(xs, x2)
plt.plot(xs, negx2)
plt.xlabel("x")
plt.ylabel("y")
plt.ylim(-2000, 2000)
plt.axhline(0,color="red") # horiz line
plt.axvline(0,color="green") # vert line
plt.savefig("nonlinear.png") # Saving plot
# plt.savefig("nonlinear.png", dpi=150) # Specify dpi.  Try other formats like svg, pdf and eps.
plt.show() # Show on screen

# Another example.

import matplotlib.pyplot as plt
import numpy as np
x = np.linspace(0, 2, 100) #Return evenly spaced numbers over a specified interval.
plt.plot(x, x, label='linear',color="pink")
plt.plot(x, x**2, label='quadratic')
plt.plot(x, x**3, label='cubic')
plt.xlabel('x')
plt.ylabel('y')
plt.title("Plotting functions: Linear, quadratic and cubic")

# Specify fontsize
plt.title("Plotting functions: Linear, quadratic and cubic", fontsize=16) # color="pink"
# Specify fontweight
plt.title("Plotting functions: Linear, quadratic and cubic", fontsize=16,fontweight='bold')

# Setting font
from matplotlib.font_manager import FontProperties
font = FontProperties()
font.set_name('Times New Roman')

plt.show()


