import matplotlib.pyplot as plt
import numpy as np


# read a csv file
def read_csv(filename):
    data = np.genfromtxt(filename, delimiter=',')
    return data

data = read_csv('fitnesses.csv')

x = data[:,0]
y = data[:,1]

print(np.min(x), np.max(x))
print(np.min(y), np.max(y))