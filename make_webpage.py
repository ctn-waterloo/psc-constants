import csv
import os.path

import jinja2

# Column indices
receptor_ = 0
t_rise = 1
sigma_rise = 2
if_10_to_90 = 3
w_fast = 4
tau_fast = 5
sigma_fast = 6
w_slow = 7
tau_slow = 8
sigma_slow = 9
tau_is_range = 10
notes_ = 11
author = 12
year = 13

receptors = []
data = {}

with open('data.csv', 'r') as csvf:
    csvdata = csv.reader(csvf)
    for d in csvdata:
        receptor = d[receptor_]
        if receptor == 'Receptor':
            continue

        if len(receptors) == 0 or not receptor in receptors:
            receptors.append(receptor)
            data[receptor] = []

        # Rise
        if d[t_rise] == '' or d[sigma_rise] == '':
            rise = ''
        else:
            rise = r'%s $\pm$ %s' % (d[t_rise], d[sigma_rise])

        if d[if_10_to_90] not in '0':
            rise += r' <a href="#rise_time_note">*</a>'

        # Decay
        fast = d[tau_fast]
        if d[sigma_fast] != '':
            fast += ' $\pm$ %s' % d[sigma_fast]

        slow = d[tau_slow]
        if d[sigma_slow] != '':
            slow += ' $\pm$ %s' % d[sigma_slow]

        if d[tau_is_range] != '':
            decay = '%s to %s' % (fast, slow)
        elif d[tau_slow] == '':
            decay = fast
        else:
            decay = '(%s) %s<br/>(%s) %s' % (d[w_fast], fast, d[w_slow], slow)

        # Notes
        notes = d[notes_].strip('"')

        # Source
        source = r'<a href="#%s%s">%s et al., %s</a>' % (
            d[author], d[year], d[author], d[year])

        data[receptor].append({
            'rise': rise,
            'decay': decay,
            'notes': notes,
            'source': source,
        })


cd = os.path.dirname(os.path.realpath(__file__))
loader = jinja2.FileSystemLoader(searchpath=cd)
env = jinja2.Environment(loader=loader)
template = env.get_template('template.md')

with open('neurotransmitter-time-constants-pscs.md', 'w') as outfile:
    outfile.write(template.render({
        'rise_fig': r'http://compneuro.uwaterloo.ca/files/constants-constraints/rise.svg',
        'decay_fig': r'http://compneuro.uwaterloo.ca/files/constants-constraints/decay.svg',
        'column_headers': [
            ('8em', r'20-80% $t_\text{rise}$ (ms)'),
            ('10em', r'Decay, $\tau$ (ms)'),
            (None, 'Neuron details'),
            ('8em', 'Source')
        ],
        'receptors': data,
    }))

print('neurotransmitter-time-constants-pscs.md created successfully.')
