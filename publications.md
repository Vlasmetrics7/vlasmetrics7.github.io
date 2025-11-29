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

  /* GRID DE AÑOS */
.year-grid {
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
  margin: 25px 0 20px 0;
}

/* BLOQUES DE AÑO (estilo D: bloques de color) */
.year-tile {
  min-width: 90px;
  padding: 10px 16px;
  border-radius: 10px;
  border: none;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  text-align: center;
  color: #222;
  background: #e4ecff;
  box-shadow: 0 4px 10px rgba(0,0,0,0.10);
  transition: transform 0.15s ease, box-shadow 0.15s ease, background 0.15s ease;
}

.year-tile:hover {
  transform: translateY(-2px);
  box-shadow: 0 7px 16px rgba(0,0,0,0.18);
}

/* Colores suaves distintos por año (puedes cambiar) */
.year-2025 { background: #e4ecff; }  /* azul pastel */
.year-2024 { background: #e4ecff; }  
.year-2023 { background: #e4ecff; }  
.year-2022 { background: #e4ecff; }  

/* Que el contenido desplegable no quede pegado a los bloques */
.year-block {
  margin-bottom: 25px;
}

  .toggle-all-button {
  display: inline-block;
  padding: 10px 18px;
  font-size: 16px;
  font-weight: 600;
  background: #dce4ff;
  border: 1px solid #b0c2ff;
  border-radius: 8px;
  cursor: pointer;
  margin-bottom: 20px;
  transition: background 0.2s ease, transform 0.15s ease;
}

.toggle-all-button:hover {
  background: #c8d6ff;
  transform: translateY(-2px);
} 

.more-sections-box {
  background: #fafbff;
  padding: 15px 20px;
  border-radius: 10px;
  box-shadow: 0px 2px 8px rgba(0,0,0,0.05);
  margin-top: 10px;
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
} 
</style>

<script>
function toggleDropdown(id) {
  var el = document.getElementById(id);
  if (el && el.classList) {
    if (el.classList.contains("show")) {
      el.classList.remove("show");
    } else {
      document.querySelectorAll('.dropdown-menu').forEach(m => m.classList.remove('show'));
      el.classList.add("show");
    }
  }
}

function isVisible(el) {
  if (!el) return false;
  return window.getComputedStyle(el).display !== 'none';
}

function hideSelected() {
  const sel = document.getElementById('selectedSection');
  const selBtn = document.getElementById('selectedBtn');
  if (sel) sel.style.display = 'none';
  if (selBtn) selBtn.textContent = 'Selected Publications ⭐';
}

function hideAllYears() {
  document.querySelectorAll('.year-block').forEach(b => {
    b.style.display = 'none';
  });
}

function updateToggleAllLabel() {
  const btn = document.getElementById('toggleAllBtn');
  if (!btn) return;

  const blocks = Array.from(document.querySelectorAll('.year-block'));
  if (blocks.length === 0) {
    btn.textContent = 'Expand All';
    return;
  }
  const allOpen = blocks.every(b => window.getComputedStyle(b).display !== 'none');
  btn.textContent = allOpen ? 'Collapse All' : 'Expand All';
}

function toggleYear(id) {
  const block = document.getElementById(id);
  if (!block) return;

  const willShow = !isVisible(block);

  // Cerrar Selected
  hideSelected();
  // Cerrar todos los años
  hideAllYears();

  // Si el año estaba cerrado, lo abrimos
 if (willShow) {
    block.style.display = 'block';
    scrollToBlock(id);  // ⭐ desplazamiento suave
  } else {
    block.style.display = 'none';
  }

  updateToggleAllLabel();
}
</script>


<script>
function toggleAllYears() {
  const blocks = document.querySelectorAll('.year-block');
  const btn = document.getElementById('toggleAllBtn');
  if (!btn || blocks.length === 0) return;

  const allOpen = Array.from(blocks).every(b => isVisible(b));

  hideSelected();

  if (allOpen) {
    blocks.forEach(b => b.style.display = 'none');
  } else {
    blocks.forEach(b => b.style.display = 'block');
  }

  updateToggleAllLabel();
}

function toggleSelected() {
  const sel = document.getElementById('selectedSection');
  const btn = document.getElementById('selectedBtn');
  if (!sel || !btn) return;

  const willShow = !isVisible(sel);

  hideAllYears();

  if (willShow) {
    sel.style.display = 'block';
    btn.textContent = 'Hide Selected Publications';
  } else {
    sel.style.display = 'none';
    btn.textContent = 'Selected Publications ⭐';
  }

  updateToggleAllLabel();
}
</script>

<script>
function scrollToBlock(id) {
  const el = document.getElementById(id);
  if (el) {
    el.scrollIntoView({ behavior: 'smooth', block: 'start' });
  }
}
</script>

<script>
function toggleExtra(id) {
  const block = document.getElementById(id);
  if (!block) return;

  // Toggle simple
  block.style.display = (block.style.display === "none" || block.style.display === "") 
      ? "block" 
      : "none";

  // Scroll suave cuando se abre
  if (block.style.display === "block") {
    block.scrollIntoView({ behavior: "smooth", block: "start" });
  }
}
</script>



<p style="font-size: 20px; color:#444; margin-top:10px;">
My research field is a unified econometric perspective on multilevel factor structures, long-memory dynamics, stress-testing frameworks, and macro-financial transmission mechanisms.
  <br><br>
Explore my research output by year, or browse a curated selection of highlighted publications.
</p>

---
<button id="toggleAllBtn" class="toggle-all-button" onclick="toggleAllYears()">
  Expand All
</button>

<button id="selectedBtn" class="toggle-all-button" onclick="toggleSelected()">
  Selected Publications ⭐
</button>

<div id="selectedSection" class="year-block" style="display:none;">

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
      <a href="javascript:toggleDiv('abs-stress2024A')" class="btn btn--info btn--sm">ABS</a>
      <div class="dropdown-container">
        <button class="btn btn--primary btn--sm"
                onclick="toggleDropdown('wp-stress2024A')">Working Papers ▼</button>
        <div id="wp-stress2024A" class="dropdown-menu">
          <a href="https://pure.au.dk/ws/files/213093676/rp21_06.pdf" target="_blank">CREATES WP 2021</a><br>
          <a href="https://economics.ucr.edu/repec/ucr/wpaper/202314.pdf" target="_blank">UCR WP 2023</a>
        </div>
      </div>
      <a href="https://doi.org/10.1002/jae.3060"
         target="_blank" class="btn btn--success btn--sm">Published</a>
      <div class="dropdown-container">
        <button class="btn btn--secondary btn--sm"
                onclick="toggleDropdown('media-stress2024A')">Media ▼</button>
        <div id="media-stress2024A" class="dropdown-menu">
          <a href="https://www.dropbox.com/scl/fi/7v2gcs5str3vd3yu00iga/ITAM-Seminar.pdf?rlkey=5o5fribeiuaoffypoh7as6zoy&st=5vnzahhy&dl=0" target="_blank">Slides (PDF)</a><br>
          <a href="https://www.dropbox.com/scl/fi/azc912c9p5d8kakai4jjn/Bank-of-England-Seminar.pdf?rlkey=n1m9scgmaucavte775oc333wn&st=cxkwi2i2&dl=0" target="_blank">Slides (PDF)</a><br>
          <a href="https://youtu.be/hWsSMfApqE8" target="_blank">Video presentation</a><br>
          <a href="https://youtu.be/DGJhBLE6CpA" target="_blank">Seminar recording</a>
        </div>
      </div>
      <a href="javascript:toggleDiv('bib-stress2024A')" class="btn btn--warning btn--sm">BIB</a>
    </div>
 <div id="abs-stress2024A" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>We propose the construction of conditional growth densities under stressed factor scenarios to assess the level of exposure of an economy to small probability but potentially catastrophic economic and/or financial scenarios, which can be either domestic or international. The choice of severe yet plausible stress scenarios is based on the joint probability distribution of the underlying factors driving growth, which are extracted with a multilevel dynamic factor model (DFM) from a wide set of domestic/worldwide and/or macroeconomic/financial variables. All together, we provide a risk management tool that allows for a complete visualization of the dynamics of the growth densities under average scenarios and extreme scenarios. We calculate growth-in-stress (GiS) measures, defined as the 5% quantile of the stressed growth densities, and show that GiS is a useful and complementary tool to growth-at-risk (GaR) when policymakers wish to carry out a multidimensional scenario analysis. The unprecedented economic shock brought by the COVID-19 pandemic provides a natural environment to assess the vulnerability of US growth with the proposed methodology.</em>
    </div>
    <div id="bib-stress2024A" class="bib-block" style="display:none;">
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
<!-- ==================== PAPER  IJF ================== -->
<!-- ===================================================== -->

<div class="pub-card">
  <img src="/assets/images/IJF23.png" class="pub-img">
  <div class="pub-info">
    <strong>Estimation of a dynamic multi-level factor model with possible long-range dependence</strong><br>
    Ergemen, Yunus Emre & <u>Rodríguez-Caballero, C.V.</u>.<br>
    <em>International Journal of Forecasting</em>, 2023.
    <div class="btn-row">
      <a href="javascript:toggleDiv('abs-IJF2023B')" class="btn btn--info btn--sm">ABS</a>
      <div class="dropdown-container">
        <button class="btn btn--primary btn--sm"
                onclick="toggleDropdown('wp-IJF2023B')">Working Papers ▼</button>
        <div id="wp-IJF2023B" class="dropdown-menu">
          <a href="https://e-archivo.uc3m.es/bitstream/handle/10016/24614/ws201708.pdf?sequence=1" target="_blank">UC3M WP 2017</a><br>
          <a href="https://pure.au.dk/ws/portalfiles/portal/101846425/rp16_23.pdf" target="_blank">CREATES WP 2016</a>
        </div>
      </div>
      <a href="https://doi.org/10.1016/j.ijforecast.2021.12.004"
         target="_blank" class="btn btn--success btn--sm">Published</a>
      <div class="dropdown-container">
        <button class="btn btn--secondary btn--sm"
                onclick="toggleDropdown('media-IJF2023B')">Media ▼</button>
        <div id="media-IJF2023B" class="dropdown-menu">
          <a href="https://www.dropbox.com/scl/fi/zwzy0xsbxghl9ddvqy6d1/Aalborg.pdf?rlkey=5m4eqzato4sqye91baxz3b2j9&st=htnt221f&dl=0" target="_blank">Slides (PDF)</a><br>
          <a href="https://www.dropbox.com/scl/fi/gwbjjg720ekrbzszwl4hh/NAF-2022.pdf?rlkey=v4au7j6ci12b6qwe6c9lvwu5x&st=9e4qz3jg&dl=0" target="_blank">Slides (PDF)</a><br>
        </div>
      </div>
      <a href="javascript:toggleDiv('bib-IJF2023B')" class="btn btn--warning btn--sm">BIB</a>
    </div>
   <div id="abs-IJF2023B" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>A dynamic multi-level factor model with possible stochastic time trends is proposed. In the model, long-range dependence and short memory dynamics are allowed in global and local common factors as well as model innovations. Estimation of global and local common factors is performed on the prewhitened series, for which the prewhitening parameter is estimated semiparametrically from the cross-sectional and local average of the observable series. Employing canonical correlation analysis and a sequential least-squares algorithm on the prewhitened series, the resulting multi-level factor estimates have centered asymptotic normal distributions under certain rate conditions depending on the bandwidth and cross-section size. Asymptotic results for common components are also established. The selection of the number of global and local factors is discussed. The methodology is shown to lead to good small-sample performance via Monte Carlo simulations. The method is then applied to the Nord Pool electricity market for the analysis of price comovements among different regions within the power grid. The global factor is identified to be the system price, and fractional cointegration relationships are found between local prices and the system price, motivating a long-run equilibrium relationship. Two forecasting exercises are then discussed.</em>
    </div>
 <div id="bib-IJF2023B" class="bib-block" style="display:none;">
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
<!-- ==================== PAPER  ECOSTAT ================== -->
<!-- ===================================================== -->

<div class="pub-card">
  <img src="/assets/images/ECOSTAT21.png" class="pub-img">
  <div class="pub-info">
    <strong>Energy consumption and GDP: a panel data analysis with multi-level cross-sectional dependence</strong><br>
     <u>Rodríguez-Caballero, C.V.</u>.<br>
    <em>Econometrics and Statistics</em>, 2021.
    <div class="btn-row">
      <a href="javascript:toggleDiv('abs-ECOSTAT21B')" class="btn btn--info btn--sm">ABS</a>
      <div class="dropdown-container">
        <button class="btn btn--primary btn--sm"
                onclick="toggleDropdown('wp-ECOSTAT21B')">Working Papers ▼</button>
        <div id="wp-ECOSTAT21B" class="dropdown-menu">
          <a href="https://pure.au.dk/ws/portalfiles/portal/104266163/rp16_31.pdf" target="_blank">CREATES WP 2016</a><br>
        </div>
      </div>
      <a href="https://doi.org/10.1016/j.ecosta.2020.11.002"
         target="_blank" class="btn btn--success btn--sm">Published</a>
      <div class="dropdown-container">
        <button class="btn btn--secondary btn--sm"
                onclick="toggleDropdown('media-ECOSTAT21B')">Media ▼</button>
        <div id="media-ECOSTAT21B" class="dropdown-menu">
          <a href="https://www.dropbox.com/scl/fi/zwzy0xsbxghl9ddvqy6d1/Aalborg.pdf?rlkey=5m4eqzato4sqye91baxz3b2j9&st=htnt221f&dl=0" target="_blank">Slides (PDF)</a><br>
        </div>
      </div>
      <a href="javascript:toggleDiv('bib-ECOSTAT21B')" class="btn btn--warning btn--sm">BIB</a>
    </div>
 <div id="abs-ECOSTAT21B" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>A fractionally integrated panel data model with a multi-level cross-sectional dependence is proposed. Such dependence is driven by a factor structure that captures comovements between blocks of variables through top-level factors, and within these blocks by non-pervasive factors. The model can include stationary and non-stationary variables, which makes it flexible enough to analyze relevant dynamics that are frequently found in macroeconomic and financial panels. The estimation methodology is based on fractionally differenced block-by-block cross-sectional averages. Monte Carlo simulations suggest that the procedure performs well in typical samples sizes. This methodology is applied to study the long-run relationship between energy consumption and economic growth. The main results suggest that estimates in some empirical studies may have some positive biases caused by neglecting the presence non-pervasive cross-sectional dependence and long-range dependence processes.</em>
    </div>
    <div id="bib-ECOSTAT21B" class="bib-block" style="display:none;">
<pre><code>@article{rodriguez2022energy,
  title={Energy consumption and GDP: a panel data analysis with multi-level cross-sectional dependence},
  author={Rodr{\'\i}guez-Caballero, Carlos Vladimir},
  journal={Econometrics and Statistics},
  volume={23},
  pages={128--146},
  year={2022},
  publisher={Elsevier}
}
</code></pre>
    </div>
  </div>
</div>

<!-- ===================================================== -->
<!-- ==================== PAPER: Journal of International Financial Markets, Institutions and Money. === -->
<!-- ===================================================== -->

<div class="pub-card">
  <img src="/assets/images/paper_default.png" class="pub-img">
  <div class="pub-info">
    <strong>A multilevel factor approach for the analysis of CDS commonality and risk contribution</strong><br>
    <u>Rodríguez-Caballero, C.V.</u> & Caporin, M.<br>
    <em>Journal of International Financial Markets, Institutions and Money</em>, 2019.
  <div class="btn-row">
      <a href="javascript:toggleDiv('abs-FIN19B')" class="btn btn--info btn--sm">ABS</a>
      <div class="dropdown-container">
        <button class="btn btn--primary btn--sm"
                onclick="toggleDropdown('wp-FIN19B')">Working Papers ▼</button>
        <div id="wp-FIN19B" class="dropdown-menu">
          <a href="https://pure.au.dk/portal/en/publications/a-multilevel-factor-approach-for-the-analysis-of-cds-commonality--2/" target="_blank">CREATES WP 2019</a><br>
        </div>
      </div>
      <a href="https://doi.org/10.1016/j.intfin.2019.101144"
         target="_blank" class="btn btn--success btn--sm">Published</a>
      <div class="dropdown-container">
        <button class="btn btn--secondary btn--sm"
                onclick="toggleDropdown('media-FIN19B')">Media ▼</button>
        <div id="media-FIN19B" class="dropdown-menu">
          <a href="https://www.dropbox.com/scl/fi/zwzy0xsbxghl9ddvqy6d1/Aalborg.pdf?rlkey=5m4eqzato4sqye91baxz3b2j9&st=htnt221f&dl=0" target="_blank">Slides (PDF)</a><br>
        </div>
      </div>
      <a href="javascript:toggleDiv('bib-FIN19B')" class="btn btn--warning btn--sm">BIB</a>
    </div>
 <div id="abs-FIN19B" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>We introduce a novel multilevel factor model that allows for the presence of global and pervasive factors, local factors and semi-pervasive factors, and that captures common features across subsets of the variables of interest. We develop a model estimation procedure and provide a simulation experiment addressing the consistency of our proposal. We complete the analyses by showing how our multilevel model might explain on the commonality across CDS premiums at the global level. In this respect, we cluster countries by either the Debt/GDP ratio or by sovereign ratings. We show that multilevel models are easier to interpret compared with factor models based on principal component analysis. Finally, we experiment how the multilevel model might allow the recovery of the risk contribution due to the latent factors within a basket of country CDS.</em>
    </div>
    <div id="bib-FIN19B" class="bib-block" style="display:none;">
<pre><code>@article{rodriguez2019multilevel,
  title={A multilevel factor approach for the analysis of CDS commonality and risk contribution},
  author={Rodr{\'\i}guez-Caballero, Carlos Vladimir and Caporin, Massimiliano},
  journal={Journal of International Financial Markets, Institutions and Money},
  volume={63},
  pages={101144},
  year={2019},
  publisher={Elsevier}
}
</code></pre>
    </div>
  </div>
</div>

<!-- ===================================================== -->
<!-- ==================== PAPER: Energy Economics === -->
<!-- ===================================================== -->

<div class="pub-card">
  <img src="/assets/images/ENECO19.png" class="pub-img">
  <div class="pub-info">
    <strong>Energy-growth long-term relationship under structural breaks. Evidence from Canada, 17 Latin American economies and the USA</strong><br>
    <u>Rodríguez-Caballero, C.V.</u> & Ventosa-Santaularia, D.<br>
    <em>Energy Economics</em>, 2017.
  <div class="btn-row">
      <a href="javascript:toggleDiv('abs-ENECO17B')" class="btn btn--info btn--sm">ABS</a>
        <a href="https://doi.org/10.1016/j.eneco.2016.10.026"
         target="_blank" class="btn btn--success btn--sm">Published</a>
         <a href="javascript:toggleDiv('bib-ENECO17B')" class="btn btn--warning btn--sm">BIB</a>
    </div>
   <div id="abs-ENECO17B" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>We study the relationship and the causal link between Electric Power Consumption, EPC, and Gross Domestic Product, GDP (both per capita) for 17 countries in Latin America, Canada and the USA. Considering that many of these economies underwent important economic crises in the last three decades, we therefore model the EPC-GDP relationship through a VEC specification that allows for structural breaks, along with a robust testing methodology of causal links based on the concepts of weak and super exogeneity, rather than Granger causality. Evidence favorable to the growth hypothesis (EPC→GDP) is found for eight countries, while data of three countries support the conservation hypothesis (GDP→EPC). For three countries evidence is favorable to the neutrality hypothesis, but should be considered with caution. As for the remaining five countries the evidence is not conclusive.</em>
    </div>
    <div id="bib-ENECO17B" class="bib-block" style="display:none;">
<pre><code>@article{rodriguez2017energy,
  title={Energy-growth long-term relationship under structural breaks. Evidence from Canada, 17 Latin American economies and the USA},
  author={Rodr{\'\i}guez-Caballero, Carlos Vladimir and Ventosa-Santaul{\`a}ria, Daniel},
  journal={Energy Economics},
  volume={61},
  pages={121--134},
  year={2017},
  publisher={Elsevier}
}
</code></pre>
    </div>
  </div>
</div>

<!-- ===================================================== -->
<!-- ==================== PAPER: Energy Economics === -->
<!-- ===================================================== -->

<div class="pub-card">
  <img src="/assets/images/ENECO16.png" class="pub-img">
  <div class="pub-info">
    <strong>Common long-range dependence in a panel of hourly Nord Pool electricity prices and loads. </strong><br>
    Ergemen, Yunus & Haldrup, Niels & <u>Rodríguez-Caballero, C.V.</u> <br>
    <em>Energy Economics</em>, 2016.
  <div class="btn-row">
      <a href="javascript:toggleDiv('abs-ENECO16B')" class="btn btn--info btn--sm">ABS</a>
        <a href="https://doi.org/10.1016/j.eneco.2016.09.008"
         target="_blank" class="btn btn--success btn--sm">Published</a>
         <a href="javascript:toggleDiv('bib-ENECO16B')" class="btn btn--warning btn--sm">BIB</a>
    </div>
  <div id="abs-ENECO16B" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>Equilibrium electricity spot prices and loads are often determined simultaneously in a day-ahead auction market for each hour of the subsequent day. Hence daily observations of hourly prices take the form of a periodic panel rather than a time series of hourly observations. We consider novel panel data approaches to analyse the time series and the cross-sectional dependence of hourly Nord Pool electricity spot prices and loads for the period 2000–2013. Hourly electricity prices and load data are characterized by strong serial long-range dependence in the time series dimension in addition to strong seasonal periodicity, and along the cross-sectional dimension, i.e. the hours of the day, there is a strong dependence which necessarily has to be accounted for in order to avoid spurious inference when focusing on the time series dependence alone. The long-range dependence is modelled in terms of a fractionally integrated panel data model and it is shown that both prices and loads consist of common factors with long memory and with loadings that vary considerably during the day. Due to the competitiveness of the Nordic power market the aggregate supply curve approximates well the marginal costs of the underlying production technology and because the demand is more volatile than the supply, equilibrium prices and loads are argued to identify the periodic power supply curve. The estimated supply elasticities are estimated from fractionally co-integrated relations and range between 0.5 and 1.17 with the largest elasticities being estimated during morning and evening peak hours.</em>
    </div>
 <div id="bib-ENECO16B" class="bib-block" style="display:none;">
<pre><code>@article{ergemen2016common,
  title={Common long-range dependence in a panel of hourly Nord Pool electricity prices and loads},
  author={Ergemen, Yunus Emre and Haldrup, Niels and Rodr{\'\i}guez-Caballero, Carlos Vladimir},
  journal={Energy Economics},
  volume={60},
  pages={79--96},
  year={2016},
  publisher={Elsevier}
}
</code></pre>
    </div>
  </div>
</div>
</div>

<div class="year-grid">
  <button class="year-tile year-2025" onclick="toggleYear('year2025')">2025 (1) ▼</button>
  <button class="year-tile year-2024" onclick="toggleYear('year2024')">2024 (2) ▼</button>
  <button class="year-tile year-2023" onclick="toggleYear('year2023')">2023 (2) ▼</button>
  <button class="year-tile year-2022" onclick="toggleYear('year2022')">2022 (2) ▼</button>
   <button class="year-tile year-2021" onclick="toggleYear('year2021')">2021 (5) ▼</button>
   <button class="year-tile year-2020" onclick="toggleYear('year2020')">2020 (1) ▼</button>
   <button class="year-tile year-2019" onclick="toggleYear('year2019')">2019 (1) ▼</button>
   <button class="year-tile year-2018" onclick="toggleYear('year2018')"><2018 (6) ▼</button>
</div>

<hr style="margin-top:5px; margin-bottom:25px; opacity:0.25;">
<hr style="margin-top:5px; margin-bottom:25px; opacity:0.25;">

<h2 style="margin-top:15px; font-size:28px;">More Sections</h2>

<!--
<div id="year2025" class="year-block" style="display:block;">
<button class="year-button" onclick="toggleYear('year2025')">
  2025 ▼
</button>
<div id="year2025" style="display:none;"> -->

<div id="year2025" class="year-block" style="display:none;">
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

<!--
<button class="year-button" onclick="toggleYear('year2024')">
  2024 ▼
</button>

<div id="year2024" style="display:none;">-->

<div id="year2024" class="year-block" style="display:none;">
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
          <a href="https://www.dropbox.com/scl/fi/azc912c9p5d8kakai4jjn/Bank-of-England-Seminar.pdf?rlkey=n1m9scgmaucavte775oc333wn&st=cxkwi2i2&dl=0" target="_blank">Slides (PDF)</a><br>
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

<!--
<button class="year-button" onclick="toggleYear('year2023')">
  2023 ▼
</button>

<div id="year2023" style="display:none;">-->

<div id="year2023" class="year-block" style="display:none;">
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
          <a href="https://www.dropbox.com/scl/fi/gwbjjg720ekrbzszwl4hh/NAF-2022.pdf?rlkey=v4au7j6ci12b6qwe6c9lvwu5x&st=9e4qz3jg&dl=0" target="_blank">Slides (PDF)</a><br>
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

            <a href="https://doi.org/10.15196/RS130301"
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

<!--
<button class="year-button" onclick="toggleYear('year2022')">
  2022 ▼
</button>

<div id="year2022" style="display:none;">-->

<div id="year2022" class="year-block" style="display:none;">
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

          <div class="dropdown-container">
        <button class="btn btn--secondary btn--sm"
                onclick="toggleDropdown('media-EmEc2022')">Media ▼</button>
        <div id="media-EmEc2022" class="dropdown-menu">
          <a href="https://www.dropbox.com/scl/fi/cm83ekdn1qqbjoielng3o/Business-Week.pdf?rlkey=d1z09z26twwrax0bp7h7hx0ig&st=sn1qejuj&dl=0" target="_blank">Slides (PDF)</a><br>
        </div>
      </div>

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

<!--
<button class="year-button" onclick="toggleYear('year2021')">
  2021 ▼
</button>

<div id="year2021" style="display:none;">-->

<div id="year2021" class="year-block" style="display:none;">
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
        <div id="wp-ECO2021" class="dropdown-menu">
          <a href="https://vbn.aau.dk/en/publications/air-pollution-and-mobility-what-carries-the-covid-19-death-toll" target="_blank">Aalborg WP 2020</a><br>
          <a href="https://pure.au.dk/ws/portalfiles/portal/202904282/rp20_15.pdf" target="_blank">CREATES WP 2020</a>
        </div>
      </div>

      <a href="https://doi.org/10.3390/econometrics9040037"
         target="_blank" class="btn btn--success btn--sm">Published</a>

  <!--
      <div class="dropdown-container">
        <button class="btn btn--secondary btn--sm"
                onclick="toggleDropdown('media-ECO2021')">Media ▼</button>
        <div id="media-ECO2021" class="dropdown-menu">
          <a href="https://www.dropbox.com/scl/fi/zwzy0xsbxghl9ddvqy6d1/Aalborg.pdf?rlkey=5m4eqzato4sqye91baxz3b2j9&st=htnt221f&dl=0" target="_blank">Slides (PDF)</a><br>
          <a href="https://www.dropbox.com/scl/fi/6p59nn6yidw272ibz1z1z/IPDC.pdf?rlkey=q026h1zl1qsysj76renew9bx4&st=hcep76t4&dl=0" target="_blank">Slides (PDF)</a><br>
        </div>
      </div> BSc Thesis -->
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

<!-- ===================================================== -->
<!-- ==================== PAPER: ECONOMICS BULLETIN === -->
<!-- ===================================================== -->

<div class="pub-card">
  <img src="/assets/images/EB21.png" class="pub-img">
  <div class="pub-info">

    <strong>Remittances at record highs in Latin America: Time to revisit the Dutch disease</strong><br>
    López-Marmolejo, Arnoldo, <u>Rodríguez-Caballero, C.V.</u> & Ventosa-Santaularia, Daniel.<br>
    <em>Economics Bulletin</em>, 2021.

    <div class="btn-row">
      <a href="javascript:toggleDiv('abs-EB2021')" class="btn btn--info btn--sm">ABS</a>

      <a href="http://www.accessecon.com/Pubs/EB/2021/Volume41/EB-21-V41-I3-P184.pdf"
         target="_blank" class="btn btn--success btn--sm">Published</a>

      <a href="javascript:toggleDiv('bib-EB2021')" class="btn btn--warning btn--sm">BIB</a>
    </div>

    <div id="abs-EB2021" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>With remittances reaching historic highs in many Latin American countries, this paper evaluates the existence of Dutch disease in that region on a country-by-country basis. To do so, we employ heterogeneous panel data models with cross-sectional dependence to estimate the determinants of the real exchange rate and calculate the effect of net remittance flows in the region by country. In this context, various countries' future economic development must address this potential loss of competitiveness.</em>
    </div>

    <div id="bib-EB2021" class="bib-block" style="display:none;">
<pre><code>@article{lopez2021remittances,
  title={Remittances at record highs in Latin America: Time to revisit the Dutch disease},
  author={López-Marmolejo, Arnoldo, <u>Rodríguez-Caballero, C.V.</u> & Ventosa-Santaularia, Daniel},
  journal={Economics Bulletin},
  volume={41},
  number={3},
  pages={2003--2011},
  year={2021},
  publisher={Economics Bulletin}
}
</code></pre>
    </div>
  </div>
</div>

  <!-- ===================================================== -->
<!-- ==================== PAPER: ATMOSFERA === -->
<!-- ===================================================== -->

<div class="pub-card">
  <img src="/assets/images/AT21.png" class="pub-img">
  <div class="pub-info">

    <strong>Air pollution and mobility in the Mexico City Metropolitan Area in times of COVID-19</strong><br>
   <u>Rodríguez-Caballero, C.V.</u> & Vera-Valdés, J. Eduardo .<br>
    <em>Atmósfera</em>, 2021.

    <div class="btn-row">
      <a href="javascript:toggleDiv('abs-AT2021')" class="btn btn--info btn--sm">ABS</a>

      <a href="https://doi.org/10.20937/ATM.53052"
         target="_blank" class="btn btn--success btn--sm">Published</a>

      <a href="javascript:toggleDiv('bib-AT2021')" class="btn btn--warning btn--sm">BIB</a>
    </div>

    <div id="abs-AT2021" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>This paper analyzes the relation between COVID-19, air pollution, and public transport mobility in the Mexico City Metropolitan Area (MCMA). We test if the restrictions to economic activity introduced to mitigate the spread of COVID-19 are associated with a structural change in air pollution levels and public transport mobility. Our results show that mobility in public transportation was significantly reduced following the government’s recommendations. Nonetheless, we show that the reduction in mobility was not accompanied by a reduction in air pollution. Furthermore, Granger-causality tests show that the precedence relation between public transport mobility and air pollution disappeared as a product of the restrictions. Thus, our results suggest that air pollution in the MCMA seems primarily driven by industry and private car usage. In this regard, the government should redouble its efforts to develop policies to reduce industrial pollution and private car usage.</em>
    </div>

    <div id="bib-AT2021" class="bib-block" style="display:none;">
<pre><code>@article{vera2023air,
  title={Air pollution and mobility in the Mexico City Metropolitan Area in times of COVID-19},
  author={Vera-Vald{\'e}s, J Eduardo and Rodr{\'\i}guez-Caballero, C Vladimir},
  journal={Atm{\'o}sfera},
  volume={36},
  number={2},
  pages={343--354},
  year={2023},
  publisher={Centro de Ciencias de la Atm{\'o}sfera, UNAM}
}
</code></pre>
    </div>
  </div>
</div>

<!-- ===================================================== -->
<!-- ==================== PAPER  WAVELETS ================== -->
<!-- ===================================================== -->

<div class="pub-card">

  <img src="/assets/images/WAV21.png" class="pub-img">
  <div class="pub-info">

    <strong>Wavelet Estimation for Factor Models with Time-Varying</strong><br>
    Cataño, Duván Humberto, <u>Rodríguez-Caballero, C.V.</u> , Peña, Daniel & Chiann, Chang.<br>
    <em>International Journal of Wavelets, Multiresolution and Information Processing</em>, 2021.

    <div class="btn-row">
      <a href="javascript:toggleDiv('abs-WAV21')" class="btn btn--info btn--sm">ABS</a>

      <div class="dropdown-container">
        <button class="btn btn--primary btn--sm"
                onclick="toggleDropdown('wp-WAV21')">Working Papers ▼</button>
        <div id="wp-WAV21" class="dropdown-menu">
          <a href="https://arxiv.org/abs/2110.04416" target="_blank">Arxiv 2021</a><br>
          <a href="https://repositorio.usp.br/bitstreams/6d4a500b-e34a-4616-a37d-99e4cb4ac9c8" target="_blank">USP WP 2021</a>
        </div>
      </div>

      <a href="https://doi.org/10.1142/S0219691321500338"
         target="_blank" class="btn btn--success btn--sm">Published</a>

  <!-- BSc 
      <div class="dropdown-container">
        <button class="btn btn--secondary btn--sm"
                onclick="toggleDropdown('media-WAV21')">Media ▼</button>
        <div id="media-WAV21" class="dropdown-menu">
          <a href="https://www.dropbox.com/scl/fi/zwzy0xsbxghl9ddvqy6d1/Aalborg.pdf?rlkey=5m4eqzato4sqye91baxz3b2j9&st=htnt221f&dl=0" target="_blank">Slides (PDF)</a><br>
          <a href="https://www.dropbox.com/scl/fi/ycgx41xqn6d9d0cay1ta4/Symposium-on-Forecasting.pdf?rlkey=tf0vfnqmaktgs7nngb0a7xow8&st=mungl78r&dl=0" target="_blank">Slides (PDF)</a><br>
        </div>
      </div>Thesis -->
      </div>

      <a href="javascript:toggleDiv('bib-WAV21')" class="btn btn--warning btn--sm">BIB</a>

    </div>

    <div id="abs-WAV21" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>We introduce a high-dimensional factor model with time-varying loadings. We cover both stationary and nonstationary factors to increase the possibilities of applications. We propose an estimation procedure based on two stages. First, we estimate common factors by principal components. In the second step, considering the estimated factors as observed, the time-varying loadings are estimated by an iterative generalized least squares procedure using wavelet functions. We investigate the finite sample features by some Monte Carlo simulations. Finally, we apply the model to study the Nord Pool power market’s electricity prices and loads.</em>
    </div>

    <div id="bib-WAV21" class="bib-block" style="display:none;">
<pre><code>@article{catano2022wavelet,
  title={Wavelet estimation for factor models with time-varying loadings},
  author={Cata{\~n}o, Duv{\'a}n Humberto and Rodr{\'\i}guez-Caballero, C Vladimir and Pe{\~n}a, Daniel and Chiann, Chang},
  journal={International Journal of Wavelets, Multiresolution and Information Processing},
  volume={20},
  number={01},
  pages={2150033},
  year={2022},
  publisher={World Scientific}
}
</code></pre>
    </div>
  </div>
</div>

<!-- ===================================================== -->
<!-- ==================== PAPER  ECOSTAT ================== -->
<!-- ===================================================== -->

<div class="pub-card">

  <img src="/assets/images/ECOSTAT21.png" class="pub-img">
  <div class="pub-info">

    <strong>Energy consumption and GDP: a panel data analysis with multi-level cross-sectional dependence</strong><br>
     <u>Rodríguez-Caballero, C.V.</u>.<br>
    <em>Econometrics and Statistics</em>, 2021.

    <div class="btn-row">
      <a href="javascript:toggleDiv('abs-ECOSTAT21')" class="btn btn--info btn--sm">ABS</a>

      <div class="dropdown-container">
        <button class="btn btn--primary btn--sm"
                onclick="toggleDropdown('wp-ECOSTAT21')">Working Papers ▼</button>
        <div id="wp-ECOSTAT21" class="dropdown-menu">
          <a href="https://pure.au.dk/ws/portalfiles/portal/104266163/rp16_31.pdf" target="_blank">CREATES WP 2016</a><br>
        </div>
      </div>

      <a href="https://doi.org/10.1016/j.ecosta.2020.11.002"
         target="_blank" class="btn btn--success btn--sm">Published</a>

      <div class="dropdown-container">
        <button class="btn btn--secondary btn--sm"
                onclick="toggleDropdown('media-ECOSTAT21')">Media ▼</button>
        <div id="media-ECOSTAT21" class="dropdown-menu">
          <a href="https://www.dropbox.com/scl/fi/zwzy0xsbxghl9ddvqy6d1/Aalborg.pdf?rlkey=5m4eqzato4sqye91baxz3b2j9&st=htnt221f&dl=0" target="_blank">Slides (PDF)</a><br>
        </div>
      </div>

      <a href="javascript:toggleDiv('bib-ECOSTAT21')" class="btn btn--warning btn--sm">BIB</a>

    </div>

    <div id="abs-ECOSTAT21" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>A fractionally integrated panel data model with a multi-level cross-sectional dependence is proposed. Such dependence is driven by a factor structure that captures comovements between blocks of variables through top-level factors, and within these blocks by non-pervasive factors. The model can include stationary and non-stationary variables, which makes it flexible enough to analyze relevant dynamics that are frequently found in macroeconomic and financial panels. The estimation methodology is based on fractionally differenced block-by-block cross-sectional averages. Monte Carlo simulations suggest that the procedure performs well in typical samples sizes. This methodology is applied to study the long-run relationship between energy consumption and economic growth. The main results suggest that estimates in some empirical studies may have some positive biases caused by neglecting the presence non-pervasive cross-sectional dependence and long-range dependence processes.</em>
    </div>

    <div id="bib-ECOSTAT21" class="bib-block" style="display:none;">
<pre><code>@article{rodriguez2022energy,
  title={Energy consumption and GDP: a panel data analysis with multi-level cross-sectional dependence},
  author={Rodr{\'\i}guez-Caballero, Carlos Vladimir},
  journal={Econometrics and Statistics},
  volume={23},
  pages={128--146},
  year={2022},
  publisher={Elsevier}
}
</code></pre>
    </div>
  </div>
</div>

</div>

<!--
<button class="year-button" onclick="toggleYear('year2020')">
  2020 ▼
</button>

<div id="year2020" style="display:none;">-->

<div id="year2020" class="year-block" style="display:none;">
<!-- ===================================================== -->
<!-- ==================== PAPER: ECONOMETRICS === -->
<!-- ===================================================== -->

<div class="pub-card">
  <img src="/assets/images/ECN20.png" class="pub-img">
  <div class="pub-info">

    <strong>Long-lasting economic effects of pandemics: Evidence on growth and unemployment</strong><br>
    <u>Rodríguez-Caballero, C.V.</u> & Vera-Valdés, J. Eduardo.<br>
    <em>Econometrics</em>, 2020.


    <div class="btn-row">
      <a href="javascript:toggleDiv('abs-ECO2020')" class="btn btn--info btn--sm">ABS</a>

      <div class="dropdown-container">
        <button class="btn btn--primary btn--sm"
                onclick="toggleDropdown('wp-ECO2020')">Working Papers ▼</button>
        <div id="wp-ECO2020" class="dropdown-menu">
          <a href="https://centrocovid.itam.mx/es/90/contenido/long-lasting-economic-effects-pandemics-evidence-united-kingdom" target="_blank">ITAM WP 2020</a><br>
        </div>
      </div>

      <a href="https://doi.org/10.3390/econometrics8030037"
         target="_blank" class="btn btn--success btn--sm">Published</a>

  <!-- BSc Thesis 
      <div class="dropdown-container">
        <button class="btn btn--secondary btn--sm"
                onclick="toggleDropdown('media-ECO2020')">Media ▼</button>
        <div id="media-ECO2020" class="dropdown-menu">
          <a href="https://www.dropbox.com/scl/fi/zwzy0xsbxghl9ddvqy6d1/Aalborg.pdf?rlkey=5m4eqzato4sqye91baxz3b2j9&st=htnt221f&dl=0" target="_blank">Slides (PDF)</a><br>
        </div>
      </div>-->

      <a href="javascript:toggleDiv('bib-ECO2020')" class="btn btn--warning btn--sm">BIB</a>

    </div>

    <div id="abs-ECO2020" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>This paper studies long economic series to assess the long-lasting effects of pandemics. We analyze if periods that cover pandemics have a change in trend and persistence in growth, and in level and persistence in unemployment. We find that there is an upward trend in the persistence level of growth across centuries. In particular, shocks originated by pandemics in recent times seem to have a permanent effect on growth. Moreover, our results show that the unemployment rate increases and becomes more persistent after a pandemic. In this regard, our findings support the design and implementation of timely counter-cyclical policies to soften the shock of the pandemic.
.</em>
    </div>

    <div id="bib-ECO2020" class="bib-block" style="display:none;">
<pre><code>@article{rodriguez2020long,
  title={Long-lasting economic effects of pandemics: Evidence on growth and unemployment},
  author={Rodr{\'\i}guez-Caballero, C Vladimir and Vera-Vald{\'e}s, J Eduardo},
  journal={Econometrics},
  volume={8},
  number={3},
  pages={37},
  year={2020},
  publisher={MDPI}
}
</code></pre>
    </div>
  </div>
</div>
</div>

<!--
<button class="year-button" onclick="toggleYear('year2019')">
  2019 ▼
</button>

<div id="year2019" style="display:none;">-->

<div id="year2019" class="year-block" style="display:none;">
<!-- ===================================================== -->
<!-- ==================== PAPER: Journal of International Financial Markets, Institutions and Money. === -->
<!-- ===================================================== -->

<div class="pub-card">
  <img src="/assets/images/paper_default.png" class="pub-img">
  <div class="pub-info">

    <strong>A multilevel factor approach for the analysis of CDS commonality and risk contribution</strong><br>
    <u>Rodríguez-Caballero, C.V.</u> & Caporin, M.<br>
    <em>Journal of International Financial Markets, Institutions and Money</em>, 2019.


    <div class="btn-row">
      <a href="javascript:toggleDiv('abs-FIN19')" class="btn btn--info btn--sm">ABS</a>

      <div class="dropdown-container">
        <button class="btn btn--primary btn--sm"
                onclick="toggleDropdown('wp-FIN19')">Working Papers ▼</button>
        <div id="wp-FIN19" class="dropdown-menu">
          <a href="https://pure.au.dk/portal/en/publications/a-multilevel-factor-approach-for-the-analysis-of-cds-commonality--2/" target="_blank">CREATES WP 2019</a><br>
        </div>
      </div>

      <a href="https://doi.org/10.1016/j.intfin.2019.101144"
         target="_blank" class="btn btn--success btn--sm">Published</a>

<!-- =================================
      <div class="dropdown-container">
        <button class="btn btn--secondary btn--sm"
                onclick="toggleDropdown('media-FIN19')">Media ▼</button>
        <div id="media-FIN19" class="dropdown-menu">
          <a href="https://www.dropbox.com/scl/fi/zwzy0xsbxghl9ddvqy6d1/Aalborg.pdf?rlkey=5m4eqzato4sqye91baxz3b2j9&st=htnt221f&dl=0" target="_blank">Slides (PDF)</a><br>
        </div>
      </div>==================== -->

      <a href="javascript:toggleDiv('bib-FIN19')" class="btn btn--warning btn--sm">BIB</a>

    </div>

    <div id="abs-FIN19" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>We introduce a novel multilevel factor model that allows for the presence of global and pervasive factors, local factors and semi-pervasive factors, and that captures common features across subsets of the variables of interest. We develop a model estimation procedure and provide a simulation experiment addressing the consistency of our proposal. We complete the analyses by showing how our multilevel model might explain on the commonality across CDS premiums at the global level. In this respect, we cluster countries by either the Debt/GDP ratio or by sovereign ratings. We show that multilevel models are easier to interpret compared with factor models based on principal component analysis. Finally, we experiment how the multilevel model might allow the recovery of the risk contribution due to the latent factors within a basket of country CDS.</em>
    </div>

    <div id="bib-FIN19" class="bib-block" style="display:none;">
<pre><code>@article{rodriguez2019multilevel,
  title={A multilevel factor approach for the analysis of CDS commonality and risk contribution},
  author={Rodr{\'\i}guez-Caballero, Carlos Vladimir and Caporin, Massimiliano},
  journal={Journal of International Financial Markets, Institutions and Money},
  volume={63},
  pages={101144},
  year={2019},
  publisher={Elsevier}
}
</code></pre>
    </div>
  </div>
</div>

</div>

<!--
<button class="year-button" onclick="toggleYear('year2018')">
  <2018 ▼
</button>

<div id="year2018" style="display:none;">-->

<div id="year2018" class="year-block" style="display:none;">
<!-- ===================================================== -->
<!-- ==================== PAPER: Energy Economics === -->
<!-- ===================================================== -->

<div class="pub-card">
  <img src="/assets/images/ENECO19.png" class="pub-img">
  <div class="pub-info">

    <strong>Energy-growth long-term relationship under structural breaks. Evidence from Canada, 17 Latin American economies and the USA</strong><br>
    <u>Rodríguez-Caballero, C.V.</u> & Ventosa-Santaularia, D.<br>
    <em>Energy Economics</em>, 2017.

    <div class="btn-row">
      <a href="javascript:toggleDiv('abs-ENECO17')" class="btn btn--info btn--sm">ABS</a>

        <a href="https://doi.org/10.1016/j.eneco.2016.10.026"
         target="_blank" class="btn btn--success btn--sm">Published</a>

         <a href="javascript:toggleDiv('bib-ENECO17')" class="btn btn--warning btn--sm">BIB</a>
    </div>

    <div id="abs-ENECO17" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>We study the relationship and the causal link between Electric Power Consumption, EPC, and Gross Domestic Product, GDP (both per capita) for 17 countries in Latin America, Canada and the USA. Considering that many of these economies underwent important economic crises in the last three decades, we therefore model the EPC-GDP relationship through a VEC specification that allows for structural breaks, along with a robust testing methodology of causal links based on the concepts of weak and super exogeneity, rather than Granger causality. Evidence favorable to the growth hypothesis (EPC→GDP) is found for eight countries, while data of three countries support the conservation hypothesis (GDP→EPC). For three countries evidence is favorable to the neutrality hypothesis, but should be considered with caution. As for the remaining five countries the evidence is not conclusive.</em>
    </div>

    <div id="bib-ENECO17" class="bib-block" style="display:none;">
<pre><code>@article{rodriguez2017energy,
  title={Energy-growth long-term relationship under structural breaks. Evidence from Canada, 17 Latin American economies and the USA},
  author={Rodr{\'\i}guez-Caballero, Carlos Vladimir and Ventosa-Santaul{\`a}ria, Daniel},
  journal={Energy Economics},
  volume={61},
  pages={121--134},
  year={2017},
  publisher={Elsevier}
}
</code></pre>
    </div>
  </div>
</div>

<!-- ===================================================== -->
<!-- ==================== PAPER: Energy Economics === -->
<!-- ===================================================== -->

<div class="pub-card">
  <img src="/assets/images/ENECO16.png" class="pub-img">
  <div class="pub-info">

    <strong>Common long-range dependence in a panel of hourly Nord Pool electricity prices and loads. </strong><br>
    Ergemen, Yunus & Haldrup, Niels & <u>Rodríguez-Caballero, C.V.</u> <br>
    <em>Energy Economics</em>, 2016.

    <div class="btn-row">
      <a href="javascript:toggleDiv('abs-ENECO16')" class="btn btn--info btn--sm">ABS</a>

        <a href="https://doi.org/10.1016/j.eneco.2016.09.008"
         target="_blank" class="btn btn--success btn--sm">Published</a>

         <a href="javascript:toggleDiv('bib-ENECO16')" class="btn btn--warning btn--sm">BIB</a>
    </div>

    <div id="abs-ENECO16" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>Equilibrium electricity spot prices and loads are often determined simultaneously in a day-ahead auction market for each hour of the subsequent day. Hence daily observations of hourly prices take the form of a periodic panel rather than a time series of hourly observations. We consider novel panel data approaches to analyse the time series and the cross-sectional dependence of hourly Nord Pool electricity spot prices and loads for the period 2000–2013. Hourly electricity prices and load data are characterized by strong serial long-range dependence in the time series dimension in addition to strong seasonal periodicity, and along the cross-sectional dimension, i.e. the hours of the day, there is a strong dependence which necessarily has to be accounted for in order to avoid spurious inference when focusing on the time series dependence alone. The long-range dependence is modelled in terms of a fractionally integrated panel data model and it is shown that both prices and loads consist of common factors with long memory and with loadings that vary considerably during the day. Due to the competitiveness of the Nordic power market the aggregate supply curve approximates well the marginal costs of the underlying production technology and because the demand is more volatile than the supply, equilibrium prices and loads are argued to identify the periodic power supply curve. The estimated supply elasticities are estimated from fractionally co-integrated relations and range between 0.5 and 1.17 with the largest elasticities being estimated during morning and evening peak hours.</em>
    </div>

    <div id="bib-ENECO16" class="bib-block" style="display:none;">
<pre><code>@article{ergemen2016common,
  title={Common long-range dependence in a panel of hourly Nord Pool electricity prices and loads},
  author={Ergemen, Yunus Emre and Haldrup, Niels and Rodr{\'\i}guez-Caballero, Carlos Vladimir},
  journal={Energy Economics},
  volume={60},
  pages={79--96},
  year={2016},
  publisher={Elsevier}
}
</code></pre>
    </div>
  </div>
</div>

<!-- ===================================================== -->
<!-- ==================== PAPER: bayesiana fisica === -->
<!-- ===================================================== -->

<div class="pub-card">
  <img src="/assets/images/BAY2015.png" class="pub-img">
  <div class="pub-info">

    <strong>Bayesian log-periodic model for financial crashes.</strong><br>
    <u>Rodríguez-Caballero, C.V.</u> <br>
    <em>European Physical Journal B</em>, 2014.

    <div class="btn-row">
      <a href="javascript:toggleDiv('abs-2014')" class="btn btn--info btn--sm">ABS</a>

        <a href="https://doi.org/10.1140/epjb/e2014-41085-6"
         target="_blank" class="btn btn--success btn--sm">Published</a>

         <a href="javascript:toggleDiv('bib-2014')" class="btn btn--warning btn--sm">BIB</a>
    </div>

    <div id="abs-2014" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>This paper introduces a Bayesian approach in econophysics literature about financial bubbles in order to estimate the most probable time for a financial crash to occur. To this end, we propose using noninformative prior distributions to obtain posterior distributions. Since these distributions cannot be performed analytically, we develop a Markov Chain Monte Carlo algorithm to draw from posterior distributions. We consider three Bayesian models that involve normal and Student’s t-distributions in the disturbances and an AR(1)-GARCH(1,1) structure only within the first case. In the empirical part of the study, we analyze a well-known example of financial bubble – the S&P 500 1987 crash – to show the usefulness of the three methods under consideration and crashes of Merval-94, Bovespa-97, IPCMX-94, Hang Seng-97 using the simplest method. The novelty of this research is that the Bayesian models provide 95% credible intervals for the estimated crash time.</em>
    </div>

    <div id="bib-2014" class="bib-block" style="display:none;">
<pre><code>@article{rodriguez2014bayesian,
  title={Bayesian log-periodic model for financial crashes},
  author={Rodr{\'\i}guez-Caballero, Carlos Vladimir and Knapik, Oskar},
  journal={The European Physical Journal B},
  volume={87},
  number={10},
  pages={228},
  year={2014},
  publisher={Springer}
}
</code></pre>
    </div>
  </div>
</div>

<!-- ===================================================== -->
<!-- ==================== PAPER: Journal of Statistical and Econometric Methods, === -->
<!-- ===================================================== -->

<div class="pub-card">
  <img src="/assets/images/daniel2014.png" class="pub-img">
  <div class="pub-info">

    <strong>Granger causality and unit roots.</strong><br>
    <u>Rodríguez-Caballero, C.V.</u> & Ventosa-Santaularia, D. <br>
    <em>Journal of Statistical and Econometric Methods</em>, 2014.

    <div class="btn-row">
      <a href="javascript:toggleDiv('abs-2014b')" class="btn btn--info btn--sm">ABS</a>

        <a href="http://www.scienpress.com/Upload/JSEM/Vol%203_1_7.pdf"
         target="_blank" class="btn btn--success btn--sm">Published</a>

         <a href="javascript:toggleDiv('bib-2014b')" class="btn btn--warning btn--sm">BIB</a>
    </div>

    <div id="abs-2014b" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>The asymptotic behavior of the Granger-causality test under stochastic nonstationarity is studied. Our results confirm that the inference drawn from the test is not reliable when the series are integrated to the first order. In the presence of deterministic components, the test statistic diverges, eventually rejecting the null hypothesis, even when the series are independent of each other. Moreover, controlling for these deterministic elements (in the auxiliary regressions of the test) does not preclude the possibility of drawing erroneous inferences. Granger causality tests should not be used under stochastic nonstationarity, a property typically found in many macroeconomic variables.</em>
    </div>

    <div id="bib-2014b" class="bib-block" style="display:none;">
<pre><code>@article{rodriguez2014granger,
  title={Granger causality and unit roots},
  author={Rodr{\'\i}guez-Caballero, Carlos Vladimir and Ventosa-Santaul{\`a}ria, Daniel},
  journal={Journal of Statistical and Econometric Methods},
  volume={3},
  number={1},
  pages={97--114},
  year={2014},
  publisher={Scienpress Ltd}
}
</code></pre>
    </div>
  </div>
</div>

<!-- ===================================================== -->
<!-- ==================== PAPER: Journal of Statistical and Econometric Methods, === -->
<!-- ===================================================== -->

<div class="pub-card">
  <img src="/assets/images/daniel2014.png" class="pub-img">
  <div class="pub-info">

    <strong>Polynomial regressions and nonsense inference.</strong><br>
    <u>Rodríguez-Caballero, C.V.</u> & Ventosa-Santaularia, D. <br>
    <em>Econometrics</em>, 2013.

    <div class="btn-row">
      <a href="javascript:toggleDiv('abs-2014c')" class="btn btn--info btn--sm">ABS</a>

        <a href="https://doi.org/10.3390/econometrics1030236"
         target="_blank" class="btn btn--success btn--sm">Published</a>

         <a href="javascript:toggleDiv('bib-2014c')" class="btn btn--warning btn--sm">BIB</a>
    </div>

    <div id="abs-2014c" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>Polynomial specifications are widely used, not only in applied economics, but also in epidemiology, physics, political analysis and psychology, just to mention a few examples. In many cases, the data employed to estimate such specifications are time series that may exhibit stochastic nonstationary behavior. We extend Phillips’ results (Phillips, P. Understanding spurious regressions in econometrics. J. Econom. 1986, 33, 311–340.) by proving that an inference drawn from polynomial specifications, under stochastic nonstationarity, is misleading unless the variables cointegrate. We use a generalized polynomial specification as a vehicle to study its asymptotic and finite-sample properties. Our results, therefore, lead to a call to be cautious whenever practitioners estimate polynomial regressions.</em>
    </div>

    <div id="bib-2014c" class="bib-block" style="display:none;">
<pre><code>@article{ventosa2013polynomial,
  title={Polynomial regressions and nonsense inference},
  author={Ventosa-Santaularia, Daniel and Rodr{\'\i}guez-Caballero, Carlos Vladimir},
  journal={Econometrics},
  volume={1},
  number={3},
  pages={236--248},
  year={2013},
  publisher={MDPI}
}
</code></pre>
    </div>
  </div>
</div>

<!-- ===================================================== -->
<!-- ==================== PAPER: Cuadernos de economía === -->
<!-- ===================================================== -->

<div class="pub-card">
  <img src="/assets/images/cuadernos13.png" class="pub-img">
  <div class="pub-info">

    <strong>Metodología para un scoring de clientes sin referencias crediticias</strong><br>
    <u>Rodríguez-Caballero, C.V.</u> & Espin-García, O. <br>
    <em>Cuadernos de economía</em>, 2013.

    <div class="btn-row">
      <a href="javascript:toggleDiv('abs-2014d')" class="btn btn--info btn--sm">ABS</a>

        <a href="http://www.scielo.org.co/scielo.php?pid=S0121-47722013000100007&script=sci_arttext"
         target="_blank" class="btn btn--success btn--sm">Published</a>

         <a href="javascript:toggleDiv('bib-2014d')" class="btn btn--warning btn--sm">BIB</a>
    </div>

    <div id="abs-2014d" class="abstract-block" style="display:none;">
      <strong>Abstract:</strong><br>
      <em>Las decisiones de otorgamiento de crédito son cruciales en la administración de riesgos. Las instituciones financieras han desarrollado y usado modelos de credit scoring para estandarizar y automatizar las decisiones de crédito, sin embargo, no es común encontrar metodologías para aplicarlos a clientes sin referencias crediticias, es decir clientes que carecen de información en los burós nacionales de crédito. En este trabajo se presenta una metodología general para construir un modelo sencillo de credit scoring enfocado justamente a esa población, la cual ha venido tomando una mayor importancia en el sector crediticio latinoamericano. Se usa la información sociodemográfica proveniente de las solicitudes de crédito de una pequeña institución bancaria mexicana para ejemplificar la metodología.</em>
    </div>

    <div id="bib-2014d" class="bib-block" style="display:none;">
<pre><code>@article{espin2013metodologia,
  title={Metodolog{\'\i}a para un scoring de clientes sin referencias crediticias},
  author={Espin-Garc{\'\i}a, Osvaldo and Rodr{\'\i}guez-Caballero, Carlos Vladimir},
  journal={Cuadernos de econom{\'\i}a},
  volume={32},
  number={59},
  pages={137--162},
  year={2013},
  publisher={Cuadernos de Econom{\'\i}a, Facultad de Ciencias Econ{\'o}micas, Universidad Nacional~…}
}
</code></pre>
    </div>
  </div>
</div>
</div>

  <!-- ============================== -->
  <!-- POP-SCIENCE ARTICLES (HIDDEN) -->
  <!-- ============================== -->

  <button class="toggle-all-button" onclick="toggleExtra('popSection')">
    Pop-Science Articles ▼
  </button>
  <div id="popSection" style="display:none; margin-top:5px;">
    <div class="pub-card">
      <div class="pub-info">
        <p>
          <strong>[1] Rodríguez Caballero C.V. & Ventosa Santaulária, D. (2025).</strong><br>
          <em>El impacto indeleble de la regresión.</em><br>
          <strong>Miscelánea Matemática 81</strong>, 67–89.<br>
          DOI:
          <a href="https://doi.org/10.47234/MM.8104" target="_blank">
            https://doi.org/10.47234/MM.8104
          </a>
        </p>
      </div>
    </div>
  </div>

  <!-- ============================== -->
  <!-- TECHNICAL NOTES (HIDDEN) -->
  <!-- ============================== -->

  <button class="toggle-all-button" onclick="toggleExtra('techSection')" style="margin-top:5px;">
    Technical Notes ▼
  </button>
  <div id="techSection" style="display:none; margin-top:5px;">
    <div class="pub-card">
      <div class="pub-info">
        <p>
          <strong>[1] Remittances Payments through Central Banks: An Application to the Central American Countries Exchange Rates.</strong><br>
          <em>Inter-American Development Bank Technical Notes, IDB-TN-1864.</em><br>
          With Daniel Ventosa & Arnoldo López.<br>
          Published in <strong>Economics Bulletin</strong>.<br>
          LINK:
          <a href="https://publications.iadb.org/en/remittances-payments-through-central-banks-application-central-american-countries-exchange-rates"
             target="_blank">IDB Technical Note Series</a>
        </p>
      </div>
    </div>
    <div class="pub-card">
      <div class="pub-info">
        <p>
          <strong>[2] Assessing the Effect of Gender Equality before the Law on Female Labor Participation and GDP per capita in Central America, Panama, and the Dominican Republic.</strong><br>
          <em>Inter-American Development Bank Technical Notes, IDB-TN-2128.</em><br>
          With Arnoldo López.<br>
          Published in <strong>Regional Statistics</strong>.<br>
          LINK:
          <a href="https://publications.iadb.org/publications/english/document/Assessing-the-Effect-of-Gender-Equality-before-the-Law-on-Female-Labor-Participation-and-GDP-per-capita-in-Central-America-Panama-and-the-Dominican-Republic.pdf"
             target="_blank">IDB Technical Note Series</a>
        </p>
      </div>
    </div>
  </div>

  <!-- ============================== -->
  <!-- ARTICLES IN BOOKS (HIDDEN) -->
  <!-- ============================== -->

  <button class="toggle-all-button" onclick="toggleExtra('booksSection')" style="margin-top:5px;">
   Articles in Books ▼
  </button>
  <div id="booksSection" style="display:none; margin-top:5px;">
    <div class="pub-card">
      <div class="pub-info">
        <p>
          <strong>[1] Efectos del Modelo de Atención de la Fundación Camino a Casa.</strong><br>
          En <em>Modelo de atención para recuperar y empoderar vidas: quince años uniendo esfuerzos.</em><br>
          Inter-American Development Bank (2023).<br>
          With Arnoldo López Marmolejo & Emmanuel Mendez Rolón.<br>
          LINK:
          <a href="https://policycommons.net/artifacts/3834781/modelo-de-atencion-para-recuperar-y-empoderar-vidas/4640619/"
             target="_blank">IDB Book</a>
        </p>
      </div>
    </div>
    <div class="pub-card">
      <div class="pub-info">
        <p>
          <strong>[2] Approximation of Hate Detection Processes in Spanish and Other Non-Anglo-Saxon Languages.</strong><br>
          En <em>News Media and Hate Speech Promotion in Mediterranean Countries.</em><br>
          IGI Global (2023), 65–80.<br>
          LINK:
          <a href="https://www.igi-global.com/chapter/approximation-of-hate-detection-processes-in-spanish-and-other-non-anglo-saxon-languages/326105"
             target="_blank">Book Chapter</a>
        </p>
      </div>
    </div>
    <div class="pub-card">
      <div class="pub-info">
        <p>
          <strong>[3] Granger causalidad espuria en la relación de cartera total y vencida de créditos.</strong><br>
          En <em>Administración de riesgos</em>, Vol. IV, 2013.
        </p>
      </div>
    </div>
    <div class="pub-card">
      <div class="pub-info">
        <p>
          <strong>[4] La inferencia bayesiana en la administración de riesgos.</strong><br>
          En <em>Administración de riesgos</em>, Vol. II, 2010.
        </p>
      </div>
    </div>
  </div>

<!-- ============================== -->
<!-- BOOK (HIGH SCHOOL TEXTBOOK) -->
<!-- ============================== -->

<button class="toggle-all-button" onclick="toggleExtra('bookSection')" style="margin-top:5px;">
  Book ▼
</button>

<div id="bookSection" style="display:none; margin-top:5px;">

  <div class="pub-card">
    <div class="pub-info">
      <p>
        <strong>Matemáticas Financieras II</strong><br>
        Editorial GAFRA, 2012.<br>
        Authors: C. Vladimir Rodríguez Caballero & 
        <a href="#" target="_blank">Osvaldo Espin García</a>.<br>
        ISBN: 978-607-8224-42-5.<br><br>

This high school textbook was created to share financial mathematics tools with young students throughout Mexico. It is used nationally as part of the sixth-semester curriculum of the Mexican Education Secretary system.<br><br>

        <strong>Download:</strong> <a href="#" target="_blank">Full Book (PDF)</a>
      </p>
    </div>
  </div>

</div>

<!-- ============================== -->
<!-- DISSERTATIONS -->
<!-- ============================== -->

<button class="toggle-all-button" onclick="toggleExtra('dissertationSection')" style="margin-top:5px;">
  🎓 Dissertations ▼
</button>

<div id="dissertationSection" style="display:none; margin-top:5px;">


  <!-- PhD Dissertation -->
  <div class="pub-card">
    <div class="pub-info">
      <p>
        <strong>PhD Dissertation:</strong><br>
        <em>On Factor Analysis with Long-Range Dependence</em><br>
        PhD in Economics & Business Economics (Econometrics).<br>
        Aarhus University & CREATES.<br>
        Supervisor: 
        <a href="https://www.au.dk/en/nhaldrup@econ.au.dk/" target="_blank">
          Niels Haldrup
        </a><br><br>

        <strong>Download:</strong> <a href="https://pure.au.dk/portal/files/104370677/PhDDissertation.CarlosVladimirRodriguezCaballero.pdf" target="_blank">PhD Dissertation (PDF)</a>
      </p>
    </div>
  </div>


  <!-- MSc Thesis -->
  <div class="pub-card">
    <div class="pub-info">
      <p>
        <strong>MSc Thesis:</strong><br>
        <em>Ensayos sobre la Granger Causalidad</em><br>
        MSc in Econometrics — Universidad de Guanajuato.<br>
        Supervisor: 
        <a href="https://www.ventosa-santaularia.com/" target="_blank">
          Daniel Ventosa Santaulària
        </a><br><br>

        <strong>Download:</strong> <a href="https://c-vladimir-rodriguez-caballero.weebly.com/uploads/6/6/5/9/66590417/master2.pdf" target="_blank">MSc Thesis (PDF)</a>
      </p>
    </div>
  </div>


  <!-- BSc Thesis -->
  <div class="pub-card">
    <div class="pub-info">
      <p>
        <strong>BSc Thesis:</strong><br>
        <em>Inferencia Bayesiana para la volatilidad en el modelo Black & Scholes</em><br>
        BSc in Actuarial Science — Facultad de Ciencias, UNAM.<br>
        Supervisors:  
        <a href="https://www.linkedin.com/in/alejandrovillagran/" target="_blank">Alejandro Villagrán Hernández</a> &  
        <a href="https://www.dpye.iimas.unam.mx/ramses/" target="_blank">Ramsés Humberto Mena Chávez</a><br><br>

        <strong>Download:</strong> <a href="https://c-vladimir-rodriguez-caballero.weebly.com/uploads/6/6/5/9/66590417/bsc._dissertation.pdf" target="_blank">BSc Thesis (PDF)</a>
      </p>
    </div>
  </div>

</div>
