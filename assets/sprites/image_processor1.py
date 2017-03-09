'''
Description: Converts Gen I pokemon sprites to text for pokemonBatch
Author: Soda Adlmayer
Date: 2017.02.26
'''
from PIL import Image
#set filepath
filename =  r"C:\Users\Rudi\Documents\SODA\BATCH\pokemonBatch\data\other\sprites\bulbasaur1.png"
#open image
im = Image.open(filename)
width, height = im.size
#set variables
n = 1
list1 = []
list2 = []
#loop rows
while n <= height:
  #empty lists
  del list1[:]
  del list2[:]
  #loop columns
  for i in range (width):
    xy = (i, n)
    px = im.getpixel(xy)
    #append pixel value to array
    list1.append(px)
    #choose text value based on pixel value
    if list1[i] == 255:
      list2.append(' ')
    if list1[i] == 170:
      list2.append('°')
    if list1[i] == 85:
      list2.append('±')
    if list1[i] == 0:
      list2.append('²')
  #write to text file
  f = open("BULBASAUR_frontSprite.txt", 'a')
  print(*list2, sep='', file=f)
  #progres n
  n += 1
