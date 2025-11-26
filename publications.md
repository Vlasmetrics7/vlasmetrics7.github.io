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

<script>
function toggleYear(id) {
  var el = document.getElementById(id);
  el.style.display = (el.style.display === "none" || el.style.display === "") ? "block" : "none";
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
  line-height: 1.25;
  margin-top: 8px;
  margin-bottom: 14px;
  padding-left: 0px;
  max-width: 95%;
    white-space: pre-wrap !important;
  word-break: break-word !important;
  overflow-wrap: break-word !important;
  max-width: 100% !important;
}

  .bib-block {
  font-size: 13px;
  line-height: 1.45;
  margin-top: 8px;
  margin-bottom: 14px;
  padding-left: 0px;
  max-width: 95%;
  background: #f8f8f8;
  border-radius: 6px;
  padding: 10px 12px;
  box-shadow: 0px 2px 6px rgba(0,0,0,0.08);
}
.bib-block pre code {
  font-size: 12px !important;
  white-space: pre-wrap !important;
  word-break: break-word !important;
}
.year-button {
  width: 100%;
  background: #f2f2f2;
  border: 1px solid #ccc;
  padding: 12px 18px;
  border-radius: 8px;
  font-size: 20px;
  font-weight: 600;
  cursor: pointer;
  margin-top: 25px;
  margin-bottom: 10px;
  text-align: left;
  transition: background 0.2s ease;
}

.year-button:hover {
  background: #e6e6e6;
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

<button class="year-button" onclick="toggleYear('year2025')">
  2025 ▼
</button>

<div id="year2025" style="display:none;">
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
      The links between climate change and economic activity have a critical relevance for the well-being of future generations. Consequently, many publications are devoted to understanding and measuring them. This paper is a comprehensive survey of recent contributions using econometric
methods. We update previous surveys focusing on partial aspects of the complex relationships linking the economy and climate change. Starting from economic activity, the channels that relate it to climate change are energy consumption and the consequent pollution. Hence, we first describe the main econometric contributions of the interactions between economic activity and energy consumption, then explain the contributions and interactions of economic activity to pollution. Finally, we look at the main results on the relationship between climate change and economic activity. A necessary consequence of climate change is the increasing occurrence of extreme weather phenomena. Therefore, we also survey contributions on the economic effects of catastrophic climate phenomena.
      </em>
    </div>
 
     <div id="bib-eco2025" class="bib-block" style="display:none;">
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
author = {Aránzazu de Juan and Pilar Poncela and C. Vladimir Rodríguez-Caballero and Esther Ruiz}}
</code></pre>
    </div>
  </div>
</div>

</div>
---

<button class="year-button" onclick="toggleYear('year2024')">
  2024 ▼
</button>

<div id="year2024" style="display:none;">

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
          <a href="https://www.dropbox.com/scl/fi/7v2gcs5str3vd3yu00iga/ITAM-Seminar.pdf?rlkey=5o5fribeiuaoffypoh7as6zoy&st=5vnzahhy&dl=0" target="_blank">Slides (PDF)</a><br>
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

    <div id="bib-stress2024" class="bib-block" style="display:none;">
<pre><code>@article{gonzalez2024expecting,
  title={Expecting the unexpected: Stressed scenarios for economic growth},
  author={Gonz{\'a}lez-Rivera, Gloria and Rodr{\'\i}guez-Caballero, C Vladimir and Ruiz, Esther},
  journal={Journal of Applied Econometrics},
  volume={39},
  number={5},
  pages={926--942},
  year={2024},
  publisher={Wiley Online Library}}
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
    
    <div id="bib-exch2024" class="bib-block" style="display:none;">
<pre><code>@article{caporin2024factor,
  title={The factor structure of exchange rates volatility: global and intermittent factors},
  author={Caporin, Massimiliano and Rodr{\'\i}guez-Caballero, C Vladimir and Ruiz, Esther},
  journal={Empirical Economics},
  volume={67},
  number={1},
  pages={31--45},
  year={2024},
  publisher={Springer}}
</code></pre>
    </div>

  </div>

</div>
</div>

<button class="year-button" onclick="toggleYear('year2023')">
  2023 ▼
</button>

<div id="year2023" style="display:none;">

<!-- ===================================================== -->
<!-- ==================== PAPER  IJF ================== -->
<!-- ===================================================== -->

<div class="pub-card">

  <img src="/assets/images/IJF23.png" class="pub-img">
  <div class="pub-info">

    <strong>Estimation of a dynamic multi-level factor model with possible long-range dependence</strong><br>
    Ergemen, Yunus Emre & <u>Rodríguez-Caballero, C.V.</u>.<br>
    <em>International Journal of Forecasting</em>, 2023.

    <div class="btn-row">
      <a href="javascript:toggleDiv('abs-IJF2023')" class="btn btn--info btn--sm">ABS</a>

      <div class="dropdown-container">
        <button class="btn btn--primary btn--sm"
                onclick="toggleDropdown('wp-IJF2023')">Working Papers ▼</button>
        <div id="wp-IJF2023" class="dropdown-menu">
          <a href="https://e-archivo.uc3m.es/bitstream/handle/10016/24614/ws201708.pdf?sequence=1" target="_blank">UC3M WP 2017</a><br>
          <a href="https://pure.au.dk/ws/portalfiles/portal/101846425/rp16_23.pdf" target="_blank">CREATES WP 2016</a>
        </div>
      </div>

      <a href="https://doi.org/10.1016/j.ijforecast.2021.12.004"
         target="_blank" class="btn btn--success btn--sm">Published</a>

      <div class="dropdown-container">
        <button class="btn btn--secondary btn--sm"
                onclick="toggleDropdown('media-IJF2023')">Media ▼</button>
        <div id="media-IJF2023" class="dropdown-menu">
          <a href="https://www.dropbox.com/scl/fi/zwzy0xsbxghl9ddvqy6d1/Aalborg.pdf?rlkey=5m4eqzato4sqye91baxz3b2j9&st=htnt221f&dl=0" target="_blank">Slides (PDF)</a><br>
        </div>
      </div>

      <a href="javascript:toggleDiv('bib-IJF2023')" class="btn btn--warning btn--sm">BIB</a>

    </div>
    
    <div id="abs-IJF2023" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>A dynamic multi-level factor model with possible stochastic time trends is proposed. In the model, long-range dependence and short memory dynamics are allowed in global and local common factors as well as model innovations. Estimation of global and local common factors is performed on the prewhitened series, for which the prewhitening parameter is estimated semiparametrically from the cross-sectional and local average of the observable series. Employing canonical correlation analysis and a sequential least-squares algorithm on the prewhitened series, the resulting multi-level factor estimates have centered asymptotic normal distributions under certain rate conditions depending on the bandwidth and cross-section size. Asymptotic results for common components are also established. The selection of the number of global and local factors is discussed. The methodology is shown to lead to good small-sample performance via Monte Carlo simulations. The method is then applied to the Nord Pool electricity market for the analysis of price comovements among different regions within the power grid. The global factor is identified to be the system price, and fractional cointegration relationships are found between local prices and the system price, motivating a long-run equilibrium relationship. Two forecasting exercises are then discussed.</em>
    </div>

    <div id="bib-IJF2023" class="bib-block" style="display:none;">
<pre><code>@article{ergemen2023estimation,
  title={Estimation of a dynamic multi-level factor model with possible long-range dependence},
  author={Ergemen, Yunus Emre and Rodr{\'\i}guez-Caballero, C Vladimir},
  journal={International Journal of Forecasting},
  volume={39},
  number={1},
  pages={405--430},
  year={2023},
  publisher={Elsevier}
}
</code></pre>
    </div>
  </div>
</div>



<!-- ===================================================== -->
<!-- ==================== PAPER: Regional Statistics === -->
<!-- ===================================================== -->

<div class="pub-card">

  <img src="/assets/images/RS23.png" class="pub-img">

  <div class="pub-info">

    <strong>Assessing the effect of gender-related legal reforms on female labor participation and GDP per capita in the Central American region</strong><br>
    López-Marmolejo, A, & <u>Rodríguez-Caballero, C.V.</u>.<br>
    <em>Regional Statistics</em>, 2023.

    <div class="btn-row">

      <a href="javascript:toggleDiv('abs-regstat2023')" class="btn btn--info btn--sm">ABS</a>

      <a href="https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4294479"
         target="_blank" class="btn btn--primary btn--sm">Working Paper</a>

      <a href="https://doi.org/10.1007/s00181-023-02542-3"
         target="_blank" class="btn btn--success btn--sm">Published</a>

      <a href="javascript:toggleDiv('bib-regstat2023')" class="btn btn--warning btn--sm">BIB</a>

    </div>

    <div id="abs-regstat2023" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>Women's participation in the labour market in Central America, Panama, and the Dominican Republic (CAPADOM) is low by international standards. Increasing their participation is a goal of many policymakers who want to improve women's access to quality employment. This study uses data from CAPADOM to assess whether gender equality in the law increases women's participation in the labour force and, if that is the case, the extent to which this boosts GDP per capita. To do so, the authors use a panel VAR model. The results show that CAPADOM could increase female labour participation rate by 6 percentage points (pp) and GDP per capita by 1 pp by introducing gender-related legal changes such as equal pay for equal work, paid parental leave, and allowing women to do all the same jobs as men.</em>
    </div>

    <div id="bib-regstat2023" class="bib-block" style="display:none;">
<pre><code>
  @article{lopez2023assessing,
  title={Assessing the effect of gender-related legal reforms on female labour participation and GDP per capita in the Central American region.},
  author={L{\'o}pez-Marmolejo, Arnoldo and Rodr{\'\i}guez-Caballero, C Vladimir},
  journal={Regional Statistics},
  volume={13},
  number={3},
  year={2023}}
</code></pre>
    </div>
  </div>
</div>

</div>
---


<button class="year-button" onclick="toggleYear('year2022')">
  2022 ▼
</button>

<div id="year2022" style="display:none;">


<!-- ===================================================== -->
<!-- ==================== PAPER: Empirical economics === -->
<!-- ===================================================== -->

<div class="pub-card">
  <img src="/assets/images/EE22.png" class="pub-img">
  <div class="pub-info">

    <strong>Predicting cryptocurrency crash dates</strong><br>
     <u>Rodríguez-Caballero, C.V.</u> & Villanueva-Domínguez, Mauricio<br>
    <em>Empirical Economics</em>, 2022.

    <div class="btn-row">
      <a href="javascript:toggleDiv('abs-EmEc2022')" class="btn btn--info btn--sm">ABS</a>

        <a href="https://doi.org/10.1007/s00181-022-02229-1"
         target="_blank" class="btn btn--success btn--sm">Published</a>

      <a href="javascript:toggleDiv('bib-EmEc2022')" class="btn btn--warning btn--sm">BIB</a>
    </div>

    <div id="abs-EmEc2022" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>Financial history shows that there is a deep-rooted human urge to make
quick profits. Speculative bubbles are intrinsically involved in bitcoins and may precede
striking crashes as that occurred on December 22, 2017. In this paper, we propose
an econometric methodology to estimate the most likely crash date of the bitcoin
bubble of 2017.We date the crash on December 13, 2017, just four days before reaching
the maximum price. Nine days after, the bitcoin price fell 45% from its peaks.</em>
    </div>

    <div id="bib-EmEc2022" class="bib-block" style="display:none;">
<pre><code>
  @article{rodriguez2022predicting,
  title={Predicting cryptocurrency crash dates},
  author={Rodr{\'\i}guez-Caballero, C Vladimir and Villanueva-Dom{\'\i}nguez, Mauricio},
  journal={Empirical Economics},
  volume={63},
  number={6},
  pages={2855--2873},
  year={2022},
  publisher={Springer}
}
</code></pre>
    </div>
  </div>
</div>

<!-- ===================================================== -->
<!-- ==================== PAPER: Explorations in Economic History === -->
<!-- ===================================================== -->

<div class="pub-card">
  <img src="/assets/images/EH23.png" class="pub-img">
  <div class="pub-info">

    <strong>War, pandemics, and modern economic growth in Europe</strong><br>
    de la Escosura, Leandro Prados & <u>Rodríguez-Caballero, C.V.</u>.<br>
    <em>Explorations in Economic History</em>, 2022.

    <div class="btn-row">
      <a href="javascript:toggleDiv('abs-EcEx2023')" class="btn btn--info btn--sm">ABS</a>

      <a href="https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3612887"
         target="_blank" class="btn btn--primary btn--sm">Working Paper</a>

      <a href="https://doi.org/10.1016/j.eeh.2022.101467"
         target="_blank" class="btn btn--success btn--sm">Published</a>

      <a href="javascript:toggleDiv('bib-EcEx2023')" class="btn btn--warning btn--sm">BIB</a>
    </div>

    <div id="abs-EcEx2023" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>This paper contributes to the debate on Europe’s modern economic growth using the statistical
concept of long-range dependence. Different regimes, defined as periods between two successive
endogenously estimated structural shocks, matched episodes of pandemics and war. The most
persistent shocks occurred at the time of the Black Death and the twentieth century’s world wars.
Our findings confirm that the Black Death often resulted in higher income levels but reject the
view of a uniform long-term response to the Plague. In fact, we find a negative impact on incomes
in non-Malthusian economies. In the North Sea Area (Britain and the Netherlands), the Plague
was followed by positive trend growth in output per capita and population, heralding the onset
of modern economic growth and the Great Divergence in Eurasia.</em>
    </div>

    <div id="bib-EcEx2023" class="bib-block" style="display:none;">
<pre><code>
  @article{de2022war,
  title={War, pandemics, and modern economic growth in Europe},
  author={de la Escosura, Leandro Prados and Rodr{\'\i}guez-Caballero, C Vladimir},
  journal={Explorations in Economic History},
  volume={86},
  pages={101467},
  year={2022},
  publisher={Elsevier}}

</code></pre>
    </div>
  </div>
</div>
</div>


<button class="year-button" onclick="toggleYear('year2021')">
  2021 ▼
</button>

<div id="year2021" style="display:none;">

<!-- ===================================================== -->
<!-- ==================== PAPER: ECONOMETRICS === -->
<!-- ===================================================== -->

<div class="pub-card">
  <img src="/assets/images/ECN21.png" class="pub-img">
  <div class="pub-info">

    <strong>Air Pollution and Mobility, What Carries COVID-19?</strong><br>
    <u>Rodríguez-Caballero, C.V.</u> & Vera-Valdés, J. Eduardo.<br>
    <em>Econometrics</em>, 2021.

   
    <div class="btn-row">
      <a href="javascript:toggleDiv('abs-ECO2021')" class="btn btn--info btn--sm">ABS</a>

      <div class="dropdown-container">
        <button class="btn btn--primary btn--sm"
                onclick="toggleDropdown('wp-ECO2021')">Working Papers ▼</button>
        <div id="wp-IJF2023" class="dropdown-menu">
          <a href="https://vbn.aau.dk/en/publications/air-pollution-and-mobility-what-carries-the-covid-19-death-toll" target="_blank">Aalborg WP 2020</a><br>
          <a href="https://pure.au.dk/ws/portalfiles/portal/202904282/rp20_15.pdf" target="_blank">CREATES WP 2020</a>
        </div>
      </div>

      <a href="https://doi.org/10.3390/econometrics9040037"
         target="_blank" class="btn btn--success btn--sm">Published</a>

      <div class="dropdown-container">
        <button class="btn btn--secondary btn--sm"
                onclick="toggleDropdown('media-ECO2021')">Media ▼</button>
        <div id="media-ECO2021" class="dropdown-menu">
          <a href="https://www.dropbox.com/scl/fi/zwzy0xsbxghl9ddvqy6d1/Aalborg.pdf?rlkey=5m4eqzato4sqye91baxz3b2j9&st=htnt221f&dl=0" target="_blank">Slides (PDF)</a><br>
        </div>
      </div>

      <a href="javascript:toggleDiv('bib-ECO2021')" class="btn btn--warning btn--sm">BIB</a>

    </div>
    
    <div id="abs-ECO2021" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>This paper tests if air pollution serves as a carrier for SARS-CoV-2 by measuring the effect
of daily exposure to air pollution on its spread by panel data models that incorporates a possible
commonality between municipalities. We show that the contemporary exposure to particle matter is
not the main driver behind the increasing number of cases and deaths in the Mexico City Metropolitan
Area. Remarkably, we also find that the cross-dependence between municipalities in the Mexican
region is highly correlated to public mobility, which plays the leading role behind the rhythm of
contagion. Our findings are particularly revealing given that the Mexico City Metropolitan Area did
not experience a decrease in air pollution during COVID-19 induced lockdowns.</em>
    </div>

    <div id="bib-ECO2021" class="bib-block" style="display:none;">
<pre><code>@article{rodriguez2021air,
  title={Air pollution and mobility, what carries COVID-19?},
  author={Rodr{\'\i}guez-Caballero, C Vladimir and Vera-Vald{\'e}s, J Eduardo},
  journal={Econometrics},
  volume={9},
  number={4},
  pages={37},
  year={2021},
  publisher={MDPI}
}
</code></pre>
    </div>
  </div>
</div>
  
