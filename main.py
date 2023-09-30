import numpy as np

x = []
for i in range(9):
  x.append(i)

print(np.fft.fft(x))