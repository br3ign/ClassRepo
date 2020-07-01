from random import seed
from random import randint

value = 0
word = ""


for i in range(10):
  value = randint(0,9)
  word += str(value)

print word
