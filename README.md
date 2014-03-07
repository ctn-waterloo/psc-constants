Neurotransmitter Time Constants (PSCs)
======================================

This repository contains the files that generate
[a reference page for neurotransmitter time constants](http://compneuro.uwaterloo.ca/research/constants-constraints/neurotransmitter-time-constants-pscs.html).
It consists of

* `data.csv` - The data that is used to build the plots and table.
* `make_webpage.py` - A script that uses `template.md` to generate
  a markdown file containing the source for
  [this page](http://compneuro.uwaterloo.ca/research/constants-constraints/neurotransmitter-time-constants-pscs.html).
    * Requires [`jinja2`](http://jinja.pocoo.org/docs/)
* `plot_data.py` - A script that plots the PSC rise times and decay
  time constants grouped by receptor type.
    * Requires [`numpy`](http://www.numpy.org/) and
      [`matplotlib`](http://matplotlib.org/).
* `README.md` - This file; describes the repository and how to use it.
* `requirements.txt` - A list of Python packages required by scripts
  in this repository. This can be read and used by `pip`.
* `template.md` - A file used by `jinja2` to generate the webpage.

Installing requirements
-----------------------

In order to use these scripts, you will have to install
some Python packages. The easiest way is with:
```
pip install -r requirements.txt
```
Depending on your setup, this may fail because
older versions of `matplotlib` require `numpy`
to be installed prior to installation.
If the installation fails, install `numpy`
first and then proceed with installation:
```
pip install numpy
pip install -r requirements.txt
```
If these instructions are not working for you,
try installing [Anaconda](https://store.continuum.io/cshop/anaconda/),
which contains all the necessary packages.

Usage
-----

To generate the plots, run
```
python plot_data.py
```
This will generate `decay.svg` and `rise.svg`,
which can be uploaded to the website.

To generate the webpage, run
```
python make_webpage.py
```
This will generate `neurotransmitter-time-constants-pscs.md`,
which can be uploaded to the website
(for generating <http://compneuro.uwaterloo.ca/>,
it is instead pushed to
[this git repository](https://github.com/ctn-waterloo/website/tree/master/ctn_waterloo/content/research/constants-constraints)).

Contributing
------------

We welcome contributions of any kind!
We would especially like to increase the amount
of data that we're curating and visualizing.
You can suggest a paper for us to look at
by filing an
[issue](https://github.com/ctn-waterloo/psc-constants/issues).
Or you can add it in and send us a pull request!

If you would like to add in additional data,
add it to `data.csv`, and add the corresponding
source to `template.md`.
If you would like to change the plots,
edit `plot_data.py`.
If you would like to change the main table,
edit `make_webpage.py` and `template.md`.
If you would like to change the text on
the page, edit `template.md`.

Credits
-------

* Peter Jones: Wrote the original Matlab script,
  collected all of the references and data.
* Trevor Bekolay: Converted script to Python.
