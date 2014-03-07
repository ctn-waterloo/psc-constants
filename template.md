title: Neurotransmitter Time Constants (PSCs)

<!-- This page is automatically generated; do not edit manually.
     For more information about generating this page, see
     https://github.com/ctn-waterloo/psc-constants -->

This page describes the time dependency of postsynaptic currents
(PSCs), focusing on rise times and time constants of decay.

## Summary

<object type="image/svg+xml" data="{{ rise_fig }}">
  Your browser does not support SVG
</object>
<object type="image/svg+xml" data="{{ decay_fig }}">
  Your browser does not support SVG
</object>
Biexponential values ($\tau_\text{fast}$ and $\tau_\text{slow}$)
are plotted as a
[weighted geometric mean](http://en.wikipedia.org/wiki/Weighted_geometric_mean).

## Data

<table id="psc-table">
  <thead>
    <tr>
      {%- for size, header in column_headers %}
        {%- if size -%}
      <th style="width:{{ size }};">{{ header }}</th>
        {%- else -%}
      <th>{{ header }}</th>
        {%- endif -%}
      {%- endfor %}
    </tr>
  </thead>
  <tbody>
    {%- for receptor in receptors %}
    <tr><th colspan="4">{{ receptor }}</th></tr>
      {%- for row in receptors[receptor] %}
    <tr>
      <td>{{ row['rise'] }}</td>
      <td>{{ row['decay'] }}</td>
      <td>{{ row['notes'] }}</td>
      <td>{{ row['source'] }}</td>
    </tr>
      {%- endfor %}
  {%- endfor %}
  </tbody>
</table>

<span id="rise_time_note">\* 10-90% $t_\text{rise}$</span>

## Details

A single value for the decay time constant $\tau$ implies
an exponential model: $I = I_0 \cdot e^{-t / \tau}$

Two values imply a biexponential model based on a fast component
($\tau_f$) and slow component ($\tau_s$):
$I = I_{0,f} \cdot e^{-t / \tau_f} + I_{0,s} \cdot e^{-t / \tau_s}$.
This model also requires coefficients for each term.
These may be given as absolute currents or charges,
or relative percentages.

### Primary Sources

* <span id="Angulo1999">Angulo, M. C., Rossier, J., & Audinat, E.
  (1999).</span>
  [Postsynaptic glutamate receptors and integrative properties of fast-spiking interneurons in the rat neocortex](http://jn.physiology.org/cgi/content/abstract/82/3/1295).
  _J. Neurophysiol._, 82, 1295-1302.
    * Presynaptic pyramidal cells, postsynaptic IN
        * AMPA-type GluR-mediated EPSCs: $t_\text{rise}$ = 0.29 $\pm$ 0.04 ms;
        $\tau$ = 2 $\pm$ 0.8 ms; n = 16
    * NMDA-type GluR-mediated EPSCs: $t_\text{rise}$ = 7 $\pm$ 0.5 ms; $\tau$ = 52 $\pm$ 9 ms; n = 4
* <span id="Bartos2001">Bartos, M., Vida, I., Frotscher, M., Geiger,
  J. R. P., and Jonas, P. (2001).</span>
  [Rapid signaling at inhibitory synapses in a dentate gyrus interneuron network](http://www.jneurosci.org/cgi/content/abstract/21/8/2687).
  _J. Neurosci._, 21(8), 2687-2698.
    * GABA$_A$ receptors, basket cell-basket cell synapses, recorded at soma
        * Biexponential, n = 11
            * $\tau_f$: 1.6 $\pm$ 0.1 ms; contribution 76.8 $\pm$ 7.8%
            * $\tau_s$: 11.0 $\pm$ 2.3 ms
        * Exponential: $\tau$ = 2.5 $\pm$ 0.2 ms; n = 14
* <span id="Bartos2002">Bartos, M., Vida, I., Frotscher, M., Meyer,
  A., Monyer, H., Geiger, J. R. P., et al. (2002).</span>
  [Fast synaptic inhibition promotes synchronized gamma oscillations in hippocampal interneuron networks](http://www.pnas.org/content/99/20/13222).
  _Proc. Natl. Acad. Sci. U.S.A._, 99(20), 13222-13227.
    * IPSCs at BC-BC and BC-PN synapses, in CA1, CA3, and DG
      (parvalbumin-EGFP and wild-type mice)
    * CA1, BC-BC:
      20-80% $t_\text{rise}$ = 0.27 $\pm$ 0.02 ms;
      $\tau_f$ = 1.2 $\pm$ 0.1 ms (90 $\pm$ 3%);
      $\tau_s$ = 8.0 $\pm$ 1.2 ms
    * CA3, BC-BC:
      20-80% $t_\text{rise}$ = 0.25 $\pm$ 0.02 ms;
      $\tau_f$ = 0.8 $\pm$ 0.2 ms (84 $\pm$ 7%);
      $\tau_s$ = 3.8 $\pm$ 1.0 ms
    * DG, BC-BC:
      20-80% $t_\text{rise}$ = 0.3 $\pm$ 0.03 ms;
      $\tau_f$ = 1.0 $\pm$ 0.2 ms (74 $\pm$ 8%);
      $\tau_s$ = 10.0 $\pm$ 2.8 ms
    * DG (WT), BC-BC:
      20-80% $t_\text{rise}$ = 0.2 $\pm$ 0.01 ms;
      $\tau_f$ = 1.4 $\pm$ 0.2 ms (81 $\pm$ 6%);
      $\tau_s$ = 9.3 $\pm$ 1.7 ms
    * CA1, BC-PN:
      20-80% $t_\text{rise}$ = 0.3 $\pm$ 0.02 ms;
      $\tau_f$ = 1.2 $\pm$ 0.4 ms (60 $\pm$ 8%);
      $\tau_s$ = 7.3 $\pm$ 1.9 ms
    * CA3, BC-PN:
      20-80% $t_\text{rise}$ = 0.3 $\pm$ 0.02 ms;
      $\tau_f$ = 1.2 $\pm$ 0.4 ms (60 $\pm$ 4%);
      $\tau_s$ = 7.9 $\pm$ 0.2 ms
    * DG, BC-PN:
      20-80% $t_\text{rise}$ = 0.2 $\pm$ 0.03 ms;
      $\tau_f$ = 1.8 $\pm$ 0.7 ms (60 $\pm$ 20%);
      $\tau_s$ = 8.5 $\pm$ 3.7 ms
    * DG (WT), BC-PN:
      20-80% $t_\text{rise}$ = 0.2 $\pm$ 0.02 ms;
      $\tau_f$ = 1.3 $\pm$ 0.2 ms (50 $\pm$ 8%);
      $\tau_s$ = 5.6 $\pm$ 0.4 ms
* <span id="Bellingham1998">Bellingham, M.C., Lim, R., Walmsley, B.
  (1998).</span>
  [Developmental changes in EPSC quantal size and quantal content at a central glutamatergic synapse in rat](http://jp.physoc.org/content/511/3/861).
  _J. Physiol._ 511, 861-869.
    * AMPA/NMDA time constants in young vs. old rats in the
      endbulb-bushy cell synapse
    * Evoked AMPA EPSC:
        * 10-90% $t_\text{rise}$ = 0.59 +- 0.05 ms (4-11 days old)
        * 10-90% $t_\text{rise}$ = 0.46 +- 0.02 ms (12-18 days old)
        * $\tau$ = 1.33 +- 0.18 ms (4-11 days old)
        * $\tau$ = 0.66 +- 0.20 ms (12-18 days old)
    * Spontaneous AMPA EPSC:
        * 10-90% $t_\text{rise}$ = 0.25 +- 0.01 ms (4-11 days old)
        * 10-90% $t_\text{rise}$ = 0.22 +- 0.004 ms (12-18 days old)
        * $\tau$ = 0.43 +- 0.04 ms (4-11 days old)
        * $\tau$ = 0.34 +- 0.04 ms (12-18 days old)
    * Evoked NMDA EPSC:
        * $\tau$ = 101.2 +- 11.5 ms (4-11 days old)
        * $\tau$ = 60.4 +- 3.4 ms (12-18 days old)
    * Spontaneous NMDA EPSC:
        * $\tau$ = 95.0 +- 8.6 ms (4-11 days old)
        * $\tau$ = 64.0 +- 4.7 ms (12-18 days old)
* <span id="Bengtson2004">Bengtson, C. P., Tozzi, A., Bernardi, G.,
  Mercuri, N. B. (2004).</span>
  [Transient receptor potential-like channels mediate metabotropic glutamate receptor EPSCs in rat dopamine neurones](http://jp.physoc.org/content/555/2/323).
  _J. Physiol._, 555, 323-330.
    * EPSCs mediated by group I metabotropic glutamate receptor subtype
      1 (mGluR1) in rat dopamine neurons from the substantia nigra pars
      compacta (SNc)
    * Inward current (V = -75 mV):
      $t_\text{rise}$ = 199 $\pm$ 25 ms;
      $\tau_\text{decay}$ = 809 $\pm$ 92 ms; n = 15
    * Outward current (reversed by V = 47 mV):
      $t_\text{rise}$ = 890 $\pm$ 90 ms;
      $\tau_\text{decay}$ = 3180 $\pm$ 440 ms;
    * With DHPG agonist
        * Inward current (V = -75 mV):
          $t_\text{rise}$ = 960 $\pm$ 90 ms;
          $\tau_\text{decay}$ = 3100 $\pm$ 340 ms; n = 9
        * Outward current (reversed by V = 45 mV):
          $t_\text{rise}$ = 4820 $\pm$ 1100 ms;
          $\tau_\text{decay}$ = 11150 $\pm$ 1520 ms;
* <span id="Callister1996">Callister, R.J., Walmsley, B.
  (1996).</span>
  [Amplitude and time course of evoked and spontaneous synaptic currents in rat submandibular ganglion cells](http://jp.physoc.org/content/490/Pt_1/149).
  _J. Physiol._ 490, 149-157.
    * EPSCs in submandibular ganglion cells. Found no significant difference between evoked and spontaneous EPSC time courses.
    * Evoked EPSC:
        * 10-90% $t_\text{rise}$ = 2.6 $\pm$ 0.4 ms
        * $\tau$<sub>fast</sub> = 6.9 $\pm$ 0.8 ms
        * $\tau$<sub>slow</sub> = 34.4 $\pm$ 7.7 ms
    * Spontaneous EPSC:
        * $\tau$<sub>fast</sub> = 8.3 $\pm$ 1.2 ms
        * $\tau$<sub>slow</sub> = 38.0 $\pm$ 9.6 ms
* <span id="Derkach1983">Derkach, V. A., Selyanko, A. A., Skok, V. I.
  (1983).</span>
  [Acetylcholine-induced current fluctuations and fast excitatory post-synaptic currents in rabbit sympathetic neurones](http://jp.physoc.org/content/336/1/511).
  _J. Physiol._, 336, 511-526.
    * Rabbit superior cervical ganglion neurons
    * EPSC from ACh nicotinic receptors (muscarinic receptor blocked by atropine)
    * $\tau$ = 4.6 $\pm$ 0.4 ms; n = 10
* <span id="Edwards1990">Edwards, F. A., Konnerth, A., Sakmann, B.
  (1990).</span>
  [Quantal analysis of inhibitory synaptic transmission in the dentate gyrus of rat hippocampal slices: a patch-clamp study](http://jp.physoc.org/content/430/1/213).
  _J. Physiol._ (Lond.) 430: 213-249.
    * GABA<sub>A</sub>, granule cells, dentate gyrus, hippocampus, rat
    * mIPSC: $t_\text{rise}$ = 0.34 $\pm$ 0.12; $\tau_f$ = 2.7 (A<sub>f</sub> = 10 pA); $\tau_s$ = 53.6 (A<sub>s</sub> = 15 pA)
    * eIPSC: $\tau_f$ = 2.3 (A<sub>f</sub> = 16 pA); $\tau_s$ = 57.5 (A<sub>s</sub> = 73 pA)
* <span id="Faber1980">Faber, D. S. and Korn, H. (1980).</span>
  [Single-Shot Channel Activation Accounts for Duration of Inhibitory Postsynaptic Potentials in a Central Neuron](http://www.sciencemag.org/cgi/content/abstract/sci;208/4444/612).
  _Science_, vol. 208, no. 4444, pp. 612-615.
    * Presynapse: interneuron; postsynapse: Mauthner cell; *Carassius auratus*
    * GABA, glycine, and glutamate
    * $\tau$ = 6.63 $\pm$ 2.13 ms (range 3.5-11.9 ms, n = 46)
* <span id="Figl2000">Figl, A., Cohen, B. N. (2000).</span>
  [The $\beta$ subunit dominates the relaxation kinetics of heteromeric neuronal nicotinic receptors](http://jp.physoc.org/content/524/3/685).
  _J. Physiol._, 524, 685-699.
    * Ganglionic EPSCs from postsynaptic nicotinic ACh receptors in *Xenopus laevis*
    * <table>
    <thead>
      <tr><th rowspan="2">Subtype</th><th rowspan="2">[ACh] (mM)</th><th colspan="4">-150 mV</th><th colspan="4">-80 mV</th></tr>
      <tr><th>$\tau_f$ (ms)</th><th>$\tau_s$ (ms)</th><th>Fast component fraction</th><th>n</th><th>$\tau_f$ (ms)</th><th>$\tau_s$ (ms)</th><th>Fast component fraction</th><th>n</th></tr>
    </thead>
    <tbody>
    <tr><td>$\alpha$2$\beta$2</td> <td>500</td> <td>5.1 $\pm$ 0.3</td> <td>33 $\pm$ 1</td>     <td>0.7-0.9</td>   <td>5</td>  <td>4.4 $\pm$ 0.5</td> <td>43 $\pm$ 2</td>   <td>0.7-0.9</td>   <td>6</td></tr>
    <tr><td>$\alpha$3$\beta$2</td> <td>500</td> <td>5.0 $\pm$ 0.5</td> <td>50 $\pm$ 2</td>     <td>0.6-0.8</td>   <td>12</td> <td>4.5 $\pm$ 0.2</td> <td>35 $\pm$ 3</td>   <td>0.6-0.8</td>   <td>4</td></tr>
    <tr><td>$\alpha$4$\beta$2</td> <td>50</td>  <td>7 $\pm$ 1</td>     <td>73 $\pm$ 6</td>     <td>0.45-0.85</td> <td>4</td>  <td>5.5 $\pm$ 0.4</td> <td>57 $\pm$ 3</td>   <td>0.45-0.85</td> <td>3</td></tr>
    <tr><td>$\alpha$2$\beta$4</td> <td>200</td> <td>97 $\pm$ 20</td>   <td>620 $\pm$ 50</td>   <td>0.3-0.8</td>   <td>3</td>  <td>32 $\pm$ 7</td>    <td>220 $\pm$ 20</td> <td>0.5-0.8</td>   <td>3</td></tr>
    <tr><td>$\alpha$3$\beta$4</td> <td>200</td> <td>116 $\pm$ 8</td>   <td>600 $\pm$ 40</td>   <td>0.4-0.6</td>   <td>6</td>  <td>85 $\pm$ 6</td>    <td>430 $\pm$ 70</td> <td>0.6-0.8</td>   <td>6</td></tr>
    <tr><td>$\alpha$4$\beta$4</td> <td>100</td> <td>39 $\pm$ 5</td>    <td>1000 $\pm$ 200</td> <td>0.5-0.8</td>   <td>4</td>  <td>37 $\pm$ 2</td>    <td>480 $\pm$ 50</td> <td>0.6-0.85</td>  <td>4</td></tr>
    </tbody>
    </table>
* <span id="Flint1997">Flint, A. C., Maisch, U. S., Weishaupt, J. H.,
  Kriegstein, A. R., & Monyer, H. (1997).</span>
  [NR2A Subunit Expression Shortens NMDA Receptor Synaptic Currents in Developing Neocortex](http://www.jneurosci.org/cgi/content/full/17/7/2469).
  _J. Neurosci._, 17(7), 2469-2476.
    * Cortical neuron, neocortex, rat: NMDAR EPSC time courses depend on subunits NR2(A/B/C/D)
    * Decrease in $\tau$ related to age-dependent expression of NMDAR subunits (especially NR2A, which is expressed at 8/9 days but not 3/4 days)
        * 3/4 days: $\tau$ = 262.8 $\pm$ 20.8 ms (n = 30)
        * 8/9 days: $\tau$ = 146 $\pm$ 9.1 ms (n = 41)
        * Supports results from Crair and Malenka, 1995; Carmignoto and Vicini, 1992; Hestrin, 1992; Takahashi et al., 1996.
    * Low NR2A: $\tau$ = 256.2 $\pm$ 22.1 ms
    * High NR2A: $\tau$ = 116.3 $\pm$ 4.9 ms
    * At 3/4 days:
        * no NR2A: $\tau$ = 306.3 $\pm$ 28.5 ms
        * with NR2A: $\tau$ = 104.5 and 113 ms
    * At 8/9 days:
        * no NR2A: $\tau$ = 193.5 $\pm$ 18.6 ms
        * with NR2A: $\tau$ = 117.5 $\pm$ 5.7 ms
* <span id="Geiger1997">Geiger, J. R. P., Lbke, J., Roth, A.,
  Frotscher, M., and Jonas, P. (1997).</span>
  [Submillisecond AMPA receptor-mediated signaling at a principal neuron-interneuron synapse](http://www.cell.com/neuron/abstract/S0896-6273(00)80339-6).
  _Neuron_, 18, 1009-1023.
    * AMPA-type GluR, average EPSC, n = 9
        * 20-80% $t_\text{rise}$: 249 $\pm$ 15 $\mu$s (range 159-313)
        * $\tau$: 772 $\pm$ 91 $\mu$s (range 473-1302)
    * AMPA-type GluR, quantal EPSC, n = 4
        * 20-80% $t_\text{rise}$: 143 $\pm$ 16 $\mu$s (range 102-171)
        * $\tau$: 367 $\pm$ 29 $\mu$s (range 306-418)
    * NMDA-type GluR, EPSC
        * $\tau$: 19.4 $\pm$ 3.1 ms (range 11.6-27.1)
    * Use more references from this article.
* <span id="Gupta2000">Gupta, A., Wang, Y., & Markram, H.
  (2000).</span>
  [Organizing Principles for a Diversity of GABAergic Interneurons and Synapses in the Neocortex](http://www.sciencemag.org/cgi/content/full/287/5451/273).
  _Science_ 287(5451). 273-278.
    * Layers II to IV, somatosensory cortex, neocortex, rat
    * Divides GABA synapses into three types, based on their time constants for recovery from facilitation (F) and depression (D).
      * F1: $\tau$ = 10.41 $\pm$ 6.16 ms (n = 9)
          * Facilitated recovery: F/D $\approx$ 10
          * F1 appeared to be mediated only by GABA<sub>A</sub> receptors
      * F2: $\tau$ = 8.3 $\pm$ 2.2 ms (n = 52)
          * Depressed recovery: F/D $\approx$ 1/40
      * F3: $\tau$ = 6.44 $\pm$ 1.7 (n = 4)
          * Unchanged recovery: F $\approx$ D
* <span id="Hestrin1990">Hestrin, S., Sah, P., & Nicoll, R.
  (1990).</span>
  [Mechanisms generating the time course of dual component excitatory synaptic currents recorded in hippocampal slices](http://www.cell.com/neuron/abstract/0896-6273(90)90162-9).
  _Neuron_, 5, 247-253
    * Studies effect of temperature and other variables on NMDA and non-NMDA GluR in rat hippocampal pyramid neurons.
    * NMDA component
        * $\tau_f$ = 23.5 $\pm$ 3.8 ms, contribution 65% $\pm$ 12%
        * $\tau_s$ = 123 $\pm$ 83 ms
    * Non-NMDA component
        * $\tau$ = 7.2 ms
* <span id="Jonas1993">Jonas, P., Major, G., and Sakmann, B.
  (1993).</span>
  [Quantal components of unitary EPSCs at the mossy fibre synapse on CA3 pyramidal cells of rat hippocampus](http://jp.physoc.org/content/472/1/615).
  _J. Physiol._ (London), 472, 615-663.
    * One cell, evoked EPSC, AMPA-type GluR, presynapse: MF, postsynapse: CA3 pyramidal cell
    * Extracellular solution of 2 mM Ca2+ and 1 mM Mg2+
        * Latency: 3.7 $\pm$ 0.3 ms; n = 1100
        * 20-80% $t_\text{rise}$: 0.5 $\pm$ 0.2; n = 1100
        * $\tau$ = 4.1 $\pm$ 0.9 ms; n = 696
    * Extracellular solution of 1 mM Ca2+ and 3 mM Mg2+
        * Latency: 4.1 $\pm$ 0.4 ms; n = 593
        * 20-80% $t_\text{rise}$: 0.6 $\pm$ 0.2; n = 593
        * $\tau$ = 4.7 $\pm$ 1.3 ms; n = 356
* <span id="Kinney1994">Kinney, G. A., Peterson, B. W., and Slater, N.
  T. (1994).</span>
  [The synaptic activation of N-methyl-d-aspartate receptors in the rat medial vestibular nucleus](http://jn.physiology.org/cgi/content/abstract/72/4/1588).
  _J. Neurophysiol._, 72(4), 1588-1595.
    * NMDA receptors in second-order neurons from rat medial vestibular nucleus (MVN)
    * NMDA-mediated EPSC: 10-90% $t_\text{rise}$ = 5.8 $\pm$ 0.62 ms (range 3-9 ms); $\tau_f$ = 27.6 $\pm$ 3.9 ms; $\tau_s$ = 147.4 $\pm$ 13.2 ms; n = 6
* <span id="Puia1994">Puia, G., Costa, E. & Vicini, S. (1994).</span>
  [Functional diversity of GABA$_A$ Activated Cl-currents in Purkinje versus granule neurons in rat cerebellar slices](http://www.cell.com/neuron/abstract/0896-6273(94)90157-0).
  _Neuron_, 12, 117-126.
    * Heterogeneity of GABA responses: cerebellar granule cells vs. Purkinje cells
    * Biexponential model reflects intrinsic properties of GABA<sub>A</sub> receptor channels
    * Purkinje neurons: $\tau$ = 7.9 $\pm$ 1.9 ms (n = 7)
        * Vincent, P., Armstrong, C. M., and Marty, A. (1992). Inhibitory synaptic currents in rat cerebellar Purkinje cells: modulation by postsynaptic depolarization. *J. Physiol.* 456, 453-471.
    * Granule neurons: $t_\text{rise}$ = 0.6 $\pm$ 0.3 ms (range 0.3-1.3); $\tau_f$ = 7.0 $\pm$ 1.6 ms, $\tau_s$ = 59 $\pm$ 16 ms; contribution of slow = 60 $\pm$ 23%;  (n = 7)
        * With tetrodotoxin: $\tau_f$ = 6.4 $\pm$ 0.9 ms, $\tau_s$ = 65 $\pm$ 19 ms; contribution of slow = 57 $\pm$ 19%;
* <span id="Rotaru2007">Rotaru, D.C., Lewis, D.A., Gonzalez-Burgos, G. (2007).</span> [Dopamine D1 receptor activation regulates sodium channel-dependent EPSP amplification in rat prefrontal cortex pyramidal neurons](http://jp.physoc.org/content/581/3/981). _J. Physiol._ 581, 981-1000.
    * Effect of D1-type dopamine receptor amplification on EPSP. Layer 5 pyramidal neurons, rat PFC).
        * 10-90% $t_\text{rise}$ = 7.06 $\pm$ 0.94 ms
        * $\tau$ = 25.57 $\pm$ 2.12 ms
* <span id="Sah1990">Sah, P., Hestrin, S., & Nicoll, R. A.
  (1990).</span>
  [Properties of excitatory postsynaptic currents recorded in vitro from rat hippocampal interneurones](http://jp.physoc.org/content/430/1/605).
  _J. Physiol._, 430, 605-616.
    * Rat hippocampus IN
    * NMDA receptor-mediated excitatory PSCs consist of a slow NMDA receptor component and a fast non-NMDA receptor component. The fast component was blocked with CNQX to isolate the slow component. The slow component was blocked with AP5 to isolate the fast component.
    * NMDA receptor component: $t_\text{rise}$ = 5 to 11 ms; $\tau$ = 50 to 100 ms
    * Non-NMDA receptor component: $t_\text{rise}$ = 1 to 3 ms; $\tau$ = 3 to 15 ms
* <span id="Salin1996">Salin, P. A., & Prince, D. A. (1996).</span>
  [Spontaneous GABA$_A$ receptor mediated inhibitory currents in adult rat somatosensory cortex](http://jn.physiology.org/cgi/content/abstract/75/4/1573).
  _J. Neurophysiol._, 75, 1573-1588.
    * GABA<sub>A</sub> mediated, SG (layers 2-3), layer IV (IV), and IG neurons
    * sIPSC: $\tau$ = 5-10 ms
    * mIPSC: $t_\text{rise}$ = 0.9 $\pm$ 0.04 ms (range 0.2-4); $\tau$ = 8.3 $\pm$ 1.3 ms (n = 24)
* <span id="Smith2000">Smith, A. J., Owens, S., Forsythe, I. D.
  (2000).</span>
  [Characterisation of inhibitory and excitatory postsynaptic currents of the rat medial superior olive](http://jp.physoc.org/content/529/3/681).
  _J. Physiol._, 529, 681-698.
    * EPSC and IPSC of MSO neuron in rats
    * AMPA receptor EPSC: $\tau$ = 1.99 $\pm$ 0.16 ms (n = 8)
    * Significant GABA<sub>A</sub> contribution to IPSC at less than 6 days old.
    * Glycinergic
        * eIPSC:
        * Up to 11 days old: 10-90% $t_\text{rise}$ = 0.7 $\pm$ 0.1 ms; $\tau_f$ = 7.8 $\pm$ 0.3 ms; $\tau_s$ = 38.3 $\pm$ 1.7 ms (contribution 7.8 $\pm$ 0.6%); n = 121
        * At 11 days old: $\tau_f$ = 3.9 $\pm$ 0.3 ms; $\tau_s$ contribution < 1%; n = 12
        * Spontaneous miniature IPSC: 10-90% $t_\text{rise}$ = 0.62 $\pm$ 0.11 ms; $\tau_f$ = 5.3 $\pm$ 0.4 ms; $\tau_s$ = 16.5 $\pm$ 0.3 ms; slow contribution of 26 $\pm$ 3.6%; n = 7
    * More results may be included in the paper.
* <span id="Spruston1995">Spruston, N., Jonas, P., & Sakmann, B.
  (1995).</span>
  [Dendritic glutamate receptor channel in rat hippocampal CA3 and CA1 pyramidal neurons](http://jp.physoc.org/content/482/Pt_2/325).
  _J. Physiol._, 482, 325-352.
    * Glutamate applied to AMPA- and NMDA-type GluR of CA3 and CA1 pyramidal neuron dendrites and soma from rat hippocampus.
        * CA3 patches formed in the MF synapse region (15-76 $\mu$m from soma)
        * CA1 patches formed in the Schaffer collateral innervation region (25-174 $\mu$m from soma)
    * Response consisted of fast and slow components.
        * Fast component was blocked CNQX, suggesting that it is mediated by AMPA-type GluR channel
        * Slow component was blocked by AP5, suggesting that it is mediated by NMDA-type GluR channel
    * <table>
    <thead>
      <tr><th rowspan="2">Type</th><th rowspan="2">Hippocampal subfield</th><th rowspan="2">Location on neuron</th><th colspan="2">Fast component</th><th colspan="2">Slow component</th><th rowspan="2">n</th></tr>
      <tr><th>$\tau_f$ (ms)</th><th>Contribution</th><th>$\tau_s$ (ms)</th><th>Contribution</th></tr>
    </thead>
    <tbody>
    <tr><td>AMPA-type</td> <td>CA3</td> <td>dendrite</td> <td>1.8 $\pm$ 0.2</td> <td>0.83</td> <td>8.1 $\pm$ 1.5</td>  <td>0.17</td> <td>23</td></tr>
    <tr><td>AMPA-type</td> <td>CA3</td> <td>soma</td>     <td>1.7 $\pm$ 0.2</td> <td>0.79</td> <td>6.3 $\pm$ 1.0</td>  <td>0.21</td> <td>10</td></tr>
    <tr><td>AMPA-type</td> <td>CA1</td> <td>dendrite</td> <td>2.2 $\pm$ 0.2</td> <td>0.83</td> <td>9.0 $\pm$ 1.1</td>  <td>0.17</td> <td>18</td></tr>
    <tr><td>AMPA-type</td> <td>CA1</td> <td>soma</td>     <td>2.2 $\pm$ 0.2</td> <td>0.78</td> <td>6.8 $\pm$ 0.6</td>  <td>0.22</td> <td>10</td></tr>
    <tr><td>NMDA-type</td> <td>CA3</td> <td>dendrite</td> <td>175 $\pm$ 20</td>  <td>0.72</td> <td>1188 $\pm$ 181</td> <td>0.28</td> <td>13</td></tr>
    <tr><td>NMDA-type</td> <td>CA3</td> <td>soma</td>     <td>197 $\pm$ 24</td>  <td>0.82</td> <td>1287 $\pm$ 129</td> <td>0.18</td> <td>10</td></tr>
    <tr><td>NMDA-type</td> <td>CA1</td> <td>dendrite</td> <td>288 $\pm$ 23</td>  <td>0.78</td> <td>2824 $\pm$ 253</td> <td>0.22</td> <td>23</td></tr>
    <tr><td>NMDA-type</td> <td>CA1</td> <td>soma</td>     <td>230 $\pm$ 36</td>  <td>0.85</td> <td>2918 $\pm$ 491</td> <td>0.15</td> <td>10</td></tr>
    </tbody>
    </table>
* <span id="Xiang1998">Xiang, Z., Huguenard, J. R., & Prince, D. A.
  (1998).</span>
  [GABA<sub>A</sub> receptor mediated currents in interneurons and pyramidal cells of rat visual cortex](http://jp.physoc.org/content/506/3/715).
  _J. Physiol._, 506, 715-730.
    * GABA<sub>A</sub> receptor-mediated responses of pyramidal cells and IN sIPSC and monosynaptic eIPSC
    * <table>
    <thead>
      <tr><th rowspan="2">Cell type</th><th rowspan="2">PSC type</th><th rowspan="2">10-90% $t_\text{rise}$ (ms)</th><th colspan="2">Fast component</th><th colspan="2">Slow component</th><th rowspan="2">n</th></tr>
      <tr><th>$\tau_f$ (ms)</th><th>Contribution</th><th>$\tau_s$ (ms)</th><th>Contribution</th></tr>
    </thead>
    <tbody>
    <tr><td>Pyramidal</td>                 <td>sIPSC</td> <td>0.58 $\pm$ 0.02</td> <td>6.4 $\pm$ 0.4 ms</td> <td>0.27 $\pm$ 0.05 pC</td> <td>22 $\pm$ 3</td> <td>0.54 $\pm$ 0.19 pC</td> <td>11</td></tr>
    <tr><td>Pyramidal</td>                 <td>eIPSC</td> <td>1.8 $\pm$ 0.1</td>   <td>12 $\pm$ 1</td>       <td>(not in source?)     </td> <td>47 $\pm$ 3</td> <td>(not in source?)     </td> <td>9</td></tr>
    <tr><td>IN</td> <td>sIPSC</td> <td>0.61 $\pm$ 0.02</td> <td>6.5 $\pm$ 0.6</td>    <td>0.28 $\pm$ 0.01 pC</td> <td>49 $\pm$ 4</td> <td>0.72 $\pm$ 0.05 pC</td> <td>9</td></tr>
    <tr><td>IN</td> <td>eIPSC</td> <td>1.8 $\pm$ 0.2</td>   <td>13 $\pm$ 2</td>       <td>(not in source?)     </td> <td>64 $\pm$ 4</td> <td>(not in source?)     </td> <td>6</td></tr>
    </tbody>
    </table>
* <span id="Zhang1997">Zhang, S. J., Huguenard, J. R. & Prince, D. A.
  (1997).</span>
  [GABA<sub>A</sub> receptor-mediated Cl- currents in rat thalamic reticular and relay neurons](http://jn.physiology.org/cgi/content/abstract/78/5/2280).
  _J. Neurophysiol._, 78, 2280-2286.
    * GABA<sub>A</sub>, thalamus, nucleus reticularis (nRt) and ventrobasal (VB) neurons
    * nRt, sIPSC, averaged from >30 events
        * n = 9
        * $\tau_f$ = 37.5 $\pm$ 3.8 ms; contribution 30.5 $\pm$ 6.5 pA
        * $\tau_s$ = 186.1 $\pm$ 18.3 ms; contribution 23.8 $\pm$ 3.9 pA
    * nRt, electrically-evoked IPSC, averaged from >20 events
        * n = 10
        * $\tau_f$ = 42.5 $\pm$ 6.1 ms; contribution 54.0 $\pm$ 12.4 pA
        * $\tau_s$ = 177.6 $\pm$ 16.4 ms; contribution 72.9 $\pm$ 18.4 pA
    * nRt, GABA-evoked IPSC, $\tau$ = 224.8 $\pm$ 22.2 ms; n = 7
    * VB, sIPSC, averaged from >30 events
        * n = 15
        * $\tau_f$ = 16.7 $\pm$ 1.8 ms; contribution 40.2 $\pm$ 5.7 pA
        * $\tau_s$ = 39.0 $\pm$ 2.9 ms; contribution 29.4 $\pm$ 5.3 pA
    * VB, electically-evoked IPSC, averaged from >20 events
        * n = 11
        * $\tau_f$ = 23.0 $\pm$ 3.4 ms; contribution 320.0 $\pm$ 77.1 pA
        * $\tau_s$ = 68.3 $\pm$ 6.7 ms; contribution 126.8 $\pm$ 29.2 pA
    * VB, GABA-evoked IPSC, $\tau$ = 115.0 $\pm$ 15.4 ms; n = 8

### Secondary Sources

* <span id="Fourcard2002">Fourcard, N. & Brunel, N. (2002).</span>
  [Dynamics of the Firing Probability of Noisy Integrate-and-Fire Neurons](http://www.mitpressjournals.org/doi/abs/10.1162/089976602320264015).
  _Neural Computation_, 14(9). 2057-2110.

     >  Synaptic inputs to a cortical neuron come from different types
     >  of receptors with different temporal characteristics. Common
     >  types of receptors are AMPA, NMDA, and GABA receptors. AMPA
     >  receptors have synaptic time constants of the order of 2 ms
     >  (Hestrin, Sah, & Nicoll, 1990; Sah, Hestrin, & Nicoll, 1990;
     >  Spruston, Jonas, & Sakmann, 1995; Angulo, Rossier, & Audinat,
     >  1999). GABA<sub>A</sub> receptors have longer time constants
     >  (typically 5-10 ms; Salin & Prince, 1996; Xiang, Huguenard, &
     >  Prince, 1998; Gupta, Wang, & Markram, 2000). Finally, NMDA
     >  currents are the slowest, with decay time constants of about
     >  100 ms (Hestrin et al., 1990; Sah et al., 1990).

* <span id="Moreno-Bote2005">Moreno-Bote, R. & Parga, N.
  (2005).</span>
  [Simple model neurons with AMPA and NMDA filters: role of synaptic time scales](http://dx.doi.org/10.1016/j.neucom.2004.10.016).
  _Neurocomputing_, 65-66. 441-448.

     >  Fast AMPA receptors filter presynaptic inputs with a time
     >  constant of $\tau$<sub>AMPA</sub> ~1-10ms, while NMDA filter
     >  them with a longer time scale $\tau$<sub>NMDA</sub> ~50-150ms
     >  (Bear, Connors, & Paridiso, 1996).

* <span id="Parisien2008">Parisien, C., Anderson, C.H., Eliasmith, C.
  (2008).</span>
  [Solving the problem of negative synaptic weights in cortical models](http://compneuro.uwaterloo.ca/publications/parisien2008.html).
  _Neural Computation_. 20, 1473-1494.

     >  To determine the relevant biophysical parameters, we simulate
     >  hippocampal principal neurons with AMPA-mediated PSCs with
     >  decay constants of $\tau$ = 5 ms (Jonas et al., 1993). ...
     >  Hippocampal AMPA-mediated synapses on inhibitory interneurons
     >  are fast (Geiger et al., 1997; Carter and Regehr, 2002; Walker
     >  et al., 2002), being well modeled by PSCs with $\tau$ = 1 ms
     >  for these synapses. Slower GABA-mediated inhibitory synapses
     >  with $\tau$ = 4 ms project onto the B neurons (Bartos et al.,
     >  2001, 2002). We run this simulation using recurrent
     >  NMDA-mediated synapses with $\tau$ = 150 ms as is common
     >  (Kinney et al., 1994; Seung, 1996).

### Potential sources

* GABA
    * <span id="Zhang1993">Zhang, S. J., Jackson, M. B. (1993).</span>
      [GABA activated chloride channels in secretary nerve endings](http://www.sciencemag.org/cgi/content/abstract/259/5094/531).
      _Science_ 259: 531-534.
    * <span id="Schonrock1993">Schonrock, B. & Bormann, J.
      (1993).</span>
      [Functional heterogeneity of hippocampal GABA<sub>A</sub> receptors](http://www3.interscience.wiley.com/journal/119308452/abstract).
      _European Journal of Neuroscience_, 5, 1042-1049.
* NMDA
    * [Extrasynaptic NR2B and NR2D subunits of NMDA receptors shape 'superslow' afterburst EPSC in rat hippocampus](http://jp.physoc.org/content/558/2/451)
        * Glu spillover leads to superslow EPSC component
* Dopamine
    * <a style="text-decoration: line-through;"
      href="http://www.sciencemag.org/cgi/content/abstract/sci;221/4606/169">Direct
      in vivo monitoring of dopamine released from two striatal
      compartments in the rat</a>
    * <a style="text-decoration: line-through;"
      href="http://www.sciencemag.org/cgi/content/abstract/sci;258/5082/665">Burst
      firing in dopamine neurons induced by N-methyl-D-aspartate: role
      of electrogenic sodium pump</a>
* Dopamine/serotonin
    * <a style="text-decoration: line-through;"
      href="http://www.sciencemag.org/cgi/content/abstract/228/4699/597">Brain
      Dopamine and Serotonin Receptor Sites Revealed by Digital
      Subtraction Autoradiography</a>
* Serotonin
    * <a style="text-decoration: line-through;"
      href="http://www.sciencemag.org/cgi/content/abstract/222/4621/333">Sex
      differences in serotonin 1 receptor binding in rat brain</a>
    * <a style="text-decoration: line-through;"
      href="http://www.sciencemag.org/cgi/content/abstract/sci;202/4371/977">Serotonin
      shifts the phase of the circadian rhythm from the Aplysia eye</a>
    * <a style="text-decoration: line-through;"
      href="http://www.sciencemag.org/cgi/content/abstract/sci;212/4496/827">Two
      distinct central serotonin receptors with different physiological
      functions</a>
    * <a style="text-decoration: line-through;"
      href="http://www.sciencemag.org/cgi/content/abstract/sci;171/3976/1170">Oscillator
      Neurons in Crustacean Ganglia</a>
* Glu/GABA/ACh
    * <span id="Li2002">Li, D. P., Chen, S. R., Pan, Y. Z., Levey, A.
      I., Pan, H. L. (2002).</span>
      [Role of presynaptic muscarinic and GABA<sub>B</sub> receptors in spinal glutamate release and cholinergic analgesia in rats](http://jp.physoc.org/content/543/3/807).
      _J. Physiol._, 543, 807-818.
      * ?GluR mEPSC in dorsal horn neurons from lamina II: $\tau$ = 1.83
        $\pm$ 0.14 ms (n = 14)
          * With 100 $\mu$M ACh: $\tau$ = 1.96 $\pm$ 0.15 ms
* Epinephrine/GABA
* GluR
* Unsorted
    * <a style="text-decoration: line-through;"
      href="http://www.sciencemag.org/cgi/content/abstract/sci;208/4444/610">Neurotransmitter
      Receptor Binding in Bovine Cerebral Microvessels</a>
* <span id="Seung1996">Seung, H. S. (1996).</span>
  [How the brain keeps the eyes still](http://www.pnas.org/content/93/23/13339).
  _Proc. Natl. Acad. Sci. U.S.A._, 93, 13339-13344.
    * <span id="Walker2002">Walker, H. C., Lawrence, J. J., and McBain,
      C. J. (2002).</span>
      [Activation of kinetically distinct synaptic conductances on inhibitory interneurons by electrotonically overlapping afferents](https://www.cell.com/neuron/abstract/S0896-6273(02)00734-1).
      _Neuron_, 35, 161-171.
    * <span id="Carter2002">Carter, A. G., and Regehr, W. G.
      (2002).</span>
      [Quantal events shape cerebellar interneuron firing](http://www.nature.com/neuro/journal/v5/n12/abs/nn970.html).
      _Nature Neurosci._, 5, 1309-1318.
    * <span id="Chebib1999">Chebib, M., Johnston, G. A. (1999).</span>
      [The 'ABC' of GABA receptors: a brief review](http://www3.interscience.wiley.com/journal/119092395/abstract).
      _Clin. Exp. Pharmacol. Physiol._, 11, 937-940.
* Unaccessed
    * [M.F. Bear, B.W. Connors and M.A. Paradiso, Neuroscience: Exploring the Brain, Williams & Wilkins, Baltimore (1996)](http://books.google.ca/books?id=DbahEn-y6AoC) (book).
    * <http://jp.physoc.org/content/490/Pt_1/149>
    * <http://archpsyc.ama-assn.org/cgi/content/abstract/59/11/983>

## Glossary and abbreviations

* ACh: acetylcholine
* AMPA: $\alpha$-amino-3-hydroxyl-5-methyl-4-isoxazole-propionate
* AP5 (also APV): (2R)-amino-5-phosphonovaleric acid
* BC: basket cell
* CA1-4: cornu ammonis subfields 1 to 4
* CNQX: 6-cyano-7-nitroquinoxaline-2,3-dione
* DA: dopamine
* DHPG: (S)-3,5-dihydroxyphenylglycine
* GABA: $\gamma$-aminobutyric acid
* Glu: glutamate
    * mGluR1: metabotropic glutamate receptor subtype 1
* IG: infragranular
* IN: (fast-spiking) interneuron
* MF: mossy fibre
* MSO: medial superior olive
* NMDA: N-methyl-D-aspartic acid
* nRt: nucleus reticularis
* PFC: prefrontal cortex
* PSC: postsynaptic current
    * EPSC: excitatory PSC
        * eEPSC: evoked EPSC
    * IPSC: inhibitory PSC
        * sIPSC: spontaneous IPSC
        * eIPSC: evoked IPSC
        * mIPSC: miniature IPSC
* PN: principal neuron
* SG: supragranular
* $\tau$: time constant
* $t_\text{rise}$: rise time (usually given as 20-80% or 10-90%)
* VB: ventrobasal

## Contributing

If you would like to contribute to this list, please go to
[ctn-waterloo/psc-constants](https://github.com/ctn-waterloo/psc-constants)
and make an issue or pull request.
