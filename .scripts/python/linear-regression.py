import numpy as np
import scipy.stats as stats
import matplotlib.pyplot as plt
import sys,os


dir=os.path.dirname(__file__)
data=sys.argv[1]
filename=os.path.join(dir)
print(filename)
inputarr = np.genfromtxt(filename,names=True)
data = [(i[1],i[2]) for i in inputarr]
print(data)
dist =  [i[0] for i in data]
fg = [i[1] for i in data]
nspace=np.arange(0,np.amax(dist), 0.02)
slope, intercept, r_value, p_value, std_err = stats.linregress(dist,fg)
plt.plot(nspace,slope*nspace+intercept,label='r='+str(r_value)+',std. error='+str(std_err))
plt.xlabel('distance(cm)')
plt.ylabel('light-position(fg)')
plt.plot(dist,fg,'o',label='displacement(cm) vs light-position(fg)')
plt.legend()
plt.show()
