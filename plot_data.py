import csv

import matplotlib.pyplot as plt
import numpy as np


# Column indices
receptor = 0
t_rise = 1
sigma_rise = 2
w_fast = 4
tau_fast = 5
sigma_fast = 6
w_slow = 7
tau_slow = 8
sigma_slow = 9
tau_is_range = 10

receptors = []
y = []
decay = {'mean': [], 'err': []}
rise = {'mean': [], 'err': []}

with open('data.csv', 'r') as csvf:
    csvdata = csv.reader(csvf)
    for d in csvdata:
        if d[receptor] == 'Receptor':
            continue
        if len(receptors) == 0 or not d[receptor] in receptors:
            y.append(0 if len(y) == 0 else len(receptors))
            receptors.append(d[receptor])
        else:
            y.append(receptors.index(d[receptor]))

        # Determine decay mean / error
        if d[tau_is_range] == '1':
            tau_min = float(d[tau_fast])
            tau_max = float(d[tau_slow])
            tau = np.mean([tau_min, tau_max])
            decay['mean'].append(tau)
            decay['err'].append([tau_min - tau, tau_max - tau])
        else:
            if d[tau_slow] == '':
                decay['mean'].append(float(d[tau_fast]))
                sigma = float(d[sigma_fast])
            else:
                decay['mean'].append(float(d[tau_fast]) ** float(d[w_fast]) *
                                     float(d[tau_slow]) ** float(d[w_slow]))
                sigma = (float(d[sigma_fast]) ** float(d[w_fast]) *
                         float(d[sigma_slow]) ** float(d[w_slow]))
            decay['err'].append([sigma, sigma])

        # Determine rise time mean / error
        if d[t_rise] == '':
            rise['mean'].append(float('nan'))
            rise['err'].append([float('nan'), float('nan')])
        else:
            rise['mean'].append(float(d[t_rise]))
            rise['err'].append([float(d[sigma_rise]), float(d[sigma_rise])])


np.seterr(invalid='ignore')

def plot(title, data, xlabel, fname):
    plt.figure(figsize=(8, 4))
    plt.title(title, fontsize='medium')
    plt.xlabel(xlabel)
    plt.errorbar(data['mean'], y, xerr=np.asarray(data['err']).T, fmt='D',
                 c='0.3', mfc='k', capsize=8, capthick=1.5, lw=1.5, ms=6)
    plt.yticks(range(len(receptors)), receptors)
    plt.ylim(plt.ylim()[0] - 0.5, plt.ylim()[1] + 0.5)
    plt.xscale('log')
    plt.grid(which='both')
    plt.savefig(fname, transparent=True)
    plt.close()

plot('PSC rise times', rise, '$t_{rise}$ (ms)', 'rise.svg')
plot('PSC decay time constants', decay, r'$\tau_{decay}$ (ms)', 'decay.svg')
