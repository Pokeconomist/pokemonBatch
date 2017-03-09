"""
Description: Converts Gen I pokemon sprites to text for pokemonBatch
Author: Soda Adlmayer
Date: 2017.02.26
"""
from PIL import Image
true = 1
while true == 1:
  #set filepath
  m = 2
  while m == 2:
    while 1 == 1:
      try:
        print ("POKEMON kDEX (1-151)")
        poke = int(input(":"))
        if poke <= 152 and poke >= 1:
          break
        print ("INTERGERS BETWEEN & 151 ONLY!")
      except ValueError:
        print ("INTERGERS BETWEEN & 151 ONLY!")
    poke = int(poke - 1)
    f = open(r"C:\Users\Rudi\Documents\SODA\BATCH\pokemonBatch\data\other\names.txt")
    lines = f.readlines()
    p = lines[poke]
    p = p.rstrip()
    print (p.upper())
    print ("BACK SPRITE OR FRONT SPRITE (B/F)")
    x = input(":")
    if x == "b" or x == "B":
      end = ""
      m = 0
    elif x == "f" or x == "F":
      end = "1"
      m = 1
  name = "\\" + p + end +".png"
  fileName = r"C:\Users\Rudi\Documents\SODA\BATCH\pokemonBatch\data\other" + "\sprites" +  name
  #set save path
  p = p.upper()
  if m == 0:
    save = p + "_backSprite.txt"
  if m == 1:
    save = p + "_frontSprite.txt"
  #open image
  try:
    im = Image.open(fileName)
  except FileNotFoundError:
    print("NO FILE WITH NAME",p," FOUND")
    a = input("PRESS ENTER TO EXIT")
    exit()
  width, height = im.size
  #resize image to half originl (as one square is four pixels)(backSprite only)
  if m == 0:
    size = int(height/2), int(width/2)
    im = im.resize(size)
    width, height = im.size
  n = 1
  list1 = []
  list2 = []
  #loop rows
  while 1 == 1:
    try:
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
        elif list1[i] == 170:
          list2.append('°')
        elif list1[i] == 85:
          list2.append('±')
        elif list1[i] == 0:
          list2.append('²')
        else:
          print ("INPROPER FILE TYPE")
          print ("USE ONLY TRICOLOUR B&W GEN I POKEMON SPROTES")
          break 2
      #write to text file
      f = open(save, 'a')
      print (*list2, sep='', file=f)
      #progress n
      n += 1
    #check if image finished
    except IndexError:
      print ("SPRITE MADE")
      a = input("PRESS ENTER TO CONTINUE")
      break
