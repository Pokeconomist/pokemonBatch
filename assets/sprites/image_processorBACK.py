'''
Description: Converts Gen I pokemon sprites to text for pokemonBatch
Author: Soda Adlmayer
Date: 2017.02.26
'''
from PIL import Image
#set filepath
'''
print ("POKEMON NAME")
poke = input(":")
print ("BACK SPRITE OR FRONT SPRITE (B/F)")
x = input(":")
if x == 'B' or 'b':
  end = '_backSprite'
elif x == 'F' or 'f':
  end == '_frontSprite'
name = poke + end +".png"
'''
filename =  r"C:\Users\Rudi\Documents\SODA\BATCH\pokemonBatch\data\other\sprites\c.png"
#open image
im = Image.open(filename)
width, height = im.size
#remove comment fro back sprite
#resize image to half originl (as one square is four pixels)
size = int(height/2), int(width/2)
im = im.resize(size)
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
  f = open("BULBASAUR_backSprite.txt", 'a')
  print(*list2, sep='', file=f)
  #progres n
  n += 1
