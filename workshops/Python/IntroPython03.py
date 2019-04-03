'''
## Introduction to Python sample program 3
## file: introPython03.py
## Adapted from "Matplotlib Release 3.0.3" by John Hunter, Darren Dale, Eric Firing, Michael Droettboom 
## and the Matplotlib development team
## Release date: February 28, 2019
## PDF document available at https://matplotlib.org/Matplotlib.pdf

# Python example program 3
# String and list exercises
'''


str = 'Hello DataViz class!'

print(str)          # Prints complete string
print(str[0])       # Prints first character of the string
print(str[2:5])     # Prints characters starting from 3rd to 5th
print(str[2:])      # Prints string starting from 3rd character
print(str * 2)      # Prints string two times
print(str + "TEST") # Prints concatenated string

list = [ 'abcd', 786 , 2.23, 'john', 70.2 ]
tinylist = [123, 'john']

print(list)          # Prints complete list
print(list[0])       # Prints first element of the list
print(list[1:3]) # Prints elements starting from 2nd till 3rd 
print(list[2:])      # Prints elements starting from 3rd element
print(tinylist * 2)  # Prints list two times
print(list + tinylist) # Prints concatenated lists 