---
layout: single
title: "Publications"
permalink: /publications/
---

<script>
function toggleDiv(id) {
  var x = document.getElementById(id);
  if (x.style.display === "none" || x.style.display === "") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
</script>

<style>

/* TARJETA HORIZONTAL */
.pub-card {
  display: flex;
  gap: 20px;
  padding: 18px;
  margin-bottom: 28px;
  background: #fff;
  border-radius: 10px;
  box-shadow: 0px 8px 22px rgba(0,0,0,0.15);
  transition: transform 0.15s ease, box-shadow 0.15s ease;
}

.pub-card:hover {
  transform: translateY(-3px);
  box-shadow: 0px 12px 26px rgba(0,0,0,0.22);
}

/* IMAGEN 4:3 */
.pub-img {
  width: 260px;
  height: 195px;  /* 4:3 */
  object-fit: contain;
  object-position: center;
  background: #f8f8f8;  /* relleno elegante */
  border-radius: 8px;
  flex-shrink: 0;
  padding: 4px; /* marco sutil, opcional */
  box-shadow: 0px 4px 12px rgba(0,0,0,0.10);
}

/* DERECHA */
.pub-info {
  flex: 1;
}

/* BOTONES */
.btn-row {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  margin-top: 12px;
}

/* DROPDOWN */
.dropdown-menu {
  display: none;
  position: absolute;
  background: rgba(255,255,255,0.96);
  border: 1px solid #ddd;
  padding: 12px;
  border-radius: 6px;
  box-shadow: 0px 8px 22px rgba(0,0,0,0.25);
  z-index: 2000;
}

.dropdown-menu.show {
  display: block;
}

.dropdown-container {
  position: relative;
}

/* PERMITIR SOMBRAS */
.page__content {
  overflow: visible !important;
}

.pub-info pre {
  white-space: pre-wrap !important;   /* Permite salto de línea */
  word-break: break-word !important;   /* Rompe palabras largas */
  overflow-wrap: break-word !important;
  max-width: 100% !important;          /* Nunca se sale de la tarjeta */
}

  /* Reducir tamaño del BibTeX */
.pub-info pre code {
  font-size: 12px !important;   /* tamaño más compacto */
  line-height: 1.25 !important; /* más apretado pero legible */
  white-space: pre-wrap !important;
  word-break: break-word !important;
  overflow-wrap: break-word !important;
  max-width: 100% !important;
}

  /* Abstract más compacto y elegante */
.abstract-block {
  font-size: 13px;
  line-height: 1.45;
  margin-top: 8px;
  margin-bottom: 14px;
  padding-left: 0px;
  max-width: 95%;
}

  
</style>

<script>
function toggleDropdown(id) {
  var el = document.getElementById(id);
  if (el.classList.contains("show")) {
    el.classList.remove("show");
  } else {
    document.querySelectorAll('.dropdown-menu').forEach(m => m.classList.remove('show'));
    el.classList.add("show");
  }
}
</script>

Below is a categorized and selected list of my research output.

---

# **2025**

<!-- ===================================================== -->
<!-- ==================== PAPER 1 ========================= -->
<!-- ===================================================== -->

<div class="pub-card">

  <img src="/assets/images/IRERE.png" class="pub-img">

  <div class="pub-info">

    <strong>Economic activity and climate change</strong><br>
    de Juan, A., Poncela, P., <u>Rodríguez-Caballero, C.V.</u>, & Ruiz, E.<br>
    <em>International Review of Environmental and Resource Economics</em>, 2025.

    <div class="btn-row">
      <a href="javascript:toggleDiv('abs-eco2025')" class="btn btn--info btn--sm">ABS</a>
      <a href="https://arxiv.org/pdf/2206.03187"
         target="_blank" class="btn btn--primary btn--sm">Working Paper</a>
      <a href="https://doi.org/10.1561/101.00000176"
         target="_blank" class="btn btn--success btn--sm">Published</a>
      <a href="javascript:toggleDiv('bib-eco2025')" class="btn btn--warning btn--sm">BIB</a>
    </div>

  <div id="abs-eco2025" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>
      The links between climate change and economic activity
have a critical relevance for the well-being of future generations.
Consequently, many publications are devoted to
understanding and measuring them. This paper is a comprehensive
survey of recent contributions using econometric
methods. We update previous surveys focusing on partial
aspects of the complex relationships linking the economy and
climate change. Starting from economic activity, the channels
that relate it to climate change are energy consumption
and the consequent pollution. Hence, we first describe the
main econometric contributions of the interactions between economic activity and energy consumption, then explain the
contributions and interactions of economic activity to pollution.
Finally, we look at the main results on the relationship
between climate change and economic activity. A necessary
consequence of climate change is the increasing occurrence
of extreme weather phenomena. Therefore, we also survey
contributions on the economic effects of catastrophic climate
phenomena.
      </em>
    </div>

     <div id="bib-eco2025" style="display:none; margin-top:12px;">
<pre><code>@article{IRERE-176,
url = {http://dx.doi.org/10.1561/101.00000176},
year = {2025},
volume = {19},
journal = {International Review of Environmental and Resource Economics},
title = {Economic Activity and Climate Change},
doi = {10.1561/101.00000176},
issn = {1932-1465},
number = {2},
pages = {159-226},
author = {Aránzazu de Juan and Pilar Poncela and C. Vladimir Rodríguez-Caballero and Esther Ruiz}
}
}
</code></pre>
    </div>
  </div>
</div>

---

# **2024**

<!-- ===================================================== -->
<!-- ==================== PAPER 2 (JAE) ================== -->
<!-- ===================================================== -->

<div class="pub-card">

  <img src="/assets/images/JAE24.png" class="pub-img">

  <div class="pub-info">

    <strong>Expecting the unexpected: Stressed scenarios for economic growth</strong><br>
    Gonzalez-Rivera, G., <u>Rodríguez-Caballero, C.V.</u>, & Ruiz, E.<br>
    <em>Journal of Applied Econometrics</em>, 2024.

    <div class="btn-row">

      <a href="javascript:toggleDiv('abs-stress2024')" class="btn btn--info btn--sm">ABS</a>

      <div class="dropdown-container">
        <button class="btn btn--primary btn--sm"
                onclick="toggleDropdown('wp-stress2024')">Working Papers ▼</button>
        <div id="wp-stress2024" class="dropdown-menu">
          <a href="https://pure.au.dk/ws/files/213093676/rp21_06.pdf" target="_blank">CREATES WP 2021</a><br>
          <a href="https://economics.ucr.edu/repec/ucr/wpaper/202314.pdf" target="_blank">UCR WP 2023</a>
        </div>
      </div>

      <a href="https://doi.org/10.1002/jae.3060"
         target="_blank" class="btn btn--success btn--sm">Published</a>

      <div class="dropdown-container">
        <button class="btn btn--secondary btn--sm"
                onclick="toggleDropdown('media-stress2024')">Media ▼</button>
        <div id="media-stress2024" class="dropdown-menu">
          <a href="https://www.dropbox.com/.../ITAM-Seminar.pdf?dl=0" target="_blank">Slides (PDF)</a><br>
          <a href="https://youtu.be/hWsSMfApqE8" target="_blank">Video presentation</a><br>
          <a href="https://youtu.be/DGJhBLE6CpA" target="_blank">Seminar recording</a>
        </div>
      </div>

      <a href="javascript:toggleDiv('bib-stress2024')" class="btn btn--warning btn--sm">BIB</a>

    </div>
    
    <div id="abs-stress2024" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>We propose the construction of conditional growth densities under stressed factor scenarios to assess the level of exposure of an economy to small probability but potentially catastrophic economic and/or financial scenarios, which can be either domestic or international. The choice of severe yet plausible stress scenarios is based on the joint probability distribution of the underlying factors driving growth, which are extracted with a multilevel dynamic factor model (DFM) from a wide set of domestic/worldwide and/or macroeconomic/financial variables. All together, we provide a risk management tool that allows for a complete visualization of the dynamics of the growth densities under average scenarios and extreme scenarios. We calculate growth-in-stress (GiS) measures, defined as the 5% quantile of the stressed growth densities, and show that GiS is a useful and complementary tool to growth-at-risk (GaR) when policymakers wish to carry out a multidimensional scenario analysis. The unprecedented economic shock brought by the COVID-19 pandemic provides a natural environment to assess the vulnerability of US growth with the proposed methodology.</em>
    </div>

    <div id="bib-stress2024" style="display:none; margin-top:12px;">
<pre><code>@article{gonzalez2024expecting,
  title={Expecting the unexpected: Stressed scenarios for economic growth},
  author={Gonz{\'a}lez-Rivera, Gloria and Rodr{\'\i}guez-Caballero, C Vladimir and Ruiz, Esther},
  journal={Journal of Applied Econometrics},
  volume={39},
  number={5},
  pages={926--942},
  year={2024},
  publisher={Wiley Online Library}
}
}
</code></pre>
    </div>

  </div>

</div>

<!-- ===================================================== -->
<!-- ==================== PAPER 3 (Empirical Economics) === -->
<!-- ===================================================== -->

<div class="pub-card">

  <img src="/assets/images/EE24.png" class="pub-img">

  <div class="pub-info">

    <strong>The Factor Structure of Exchange Rates Volatility: Global and Intermittent Factors</strong><br>
    Caporin, M., <u>Rodríguez-Caballero, C.V.</u>, & Ruiz, E.<br>
    <em>Empirical Economics</em>, 2024.

    <div class="btn-row">

      <a href="javascript:toggleDiv('abs-exch2024')" class="btn btn--info btn--sm">ABS</a>

      <a href="https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4294479"
         target="_blank" class="btn btn--primary btn--sm">Working Paper</a>

      <a href="https://doi.org/10.1007/s00181-023-02542-3"
         target="_blank" class="btn btn--success btn--sm">Published</a>

      <a href="javascript:toggleDiv('bib-exch2024')" class="btn btn--warning btn--sm">BIB</a>

    </div>

    <div id="abs-exch2024" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>In this paper, we consider a fractionally integrated multi-level dynamic factor model (FI-ML-DFM) to represent commonalities in the hourly evolution of realized volatilities of several international exchange rates. The FI-ML-DFM assumes common global factors active during the 24 h of the day, accompanied by intermittent factors, which are active at mutually exclusive times. We propose determining the number of global factors using a distance among the intermittent loadings. We show that although the bulk of common dynamics of exchange rates realized volatilities can be attributed to global factors, there are non-negligible effects of intermittent factors. The effect of the COVID-19 on the realized volatility comovements is stronger on the first global-in-time factor, which shows a permanent increase in the level. The effects on the second global factor and on the intermittent factors active when the EU, UK and US markets are operating are transitory lasting for approximately a year after the pandemic starts. Finally, there seems to be no effect of the pandemic neither on the third global factor nor on the intermittent factor active when the markets in Asia are operating.</em>
    </div>

    <div id="bib-exch2024" style="display:none; margin-top:12px;">
<pre><code>@article{caporin2024factor,
  title={The factor structure of exchange rates volatility: global and intermittent factors},
  author={Caporin, Massimiliano and Rodr{\'\i}guez-Caballero, C Vladimir and Ruiz, Esther},
  journal={Empirical Economics},
  volume={67},
  number={1},
  pages={31--45},
  year={2024},
  publisher={Springer}
}
}
</code></pre>
    </div>

  </div>

</div>
