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

/* GRID DE DOS COLUMNAS */
.pub-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(380px, 1fr));
  gap: 30px;
  margin-top: 30px;
}

/* TARJETAS */
.pub-card {
  background: #fff;
  border-radius: 10px;
  padding: 18px;
  box-shadow: 0px 8px 22px rgba(0,0,0,0.15);
  transition: transform 0.15s ease, box-shadow 0.15s ease;
}

.pub-card:hover {
  transform: translateY(-3px);
  box-shadow: 0px 12px 26px rgba(0,0,0,0.22);
}

/* IMAGEN */
.pub-img {
  width: 260px;
  height: auto;
  margin-left: auto;
  margin-right: auto;
  display: block;
  border-radius: 6px;
  margin-bottom: 12px;
  box-shadow: 0px 4px 12px rgba(0,0,0,0.10);
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
  opacity: 0;
  transform: translateY(8px);
  transition: opacity 0.25s ease-out, transform 0.25s ease-out;
}

.dropdown-menu.show {
  display: block;
  opacity: 1;
  transform: translateY(0px);
}

.dropdown-container {
  position: relative;
}

/* PERMITIR SOMBRAS */
.page__content, .page, .page__inner, .mm-page, .mm-page__inner, p {
  overflow: visible !important;
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

# 2025 & 2024 Publications

<div class="pub-grid">

<!-- ============================= -->
<!-- ==== 2025 — PAPER 1 ======== -->
<!-- ============================= -->

<div class="pub-card">

  <img src="/assets/images/IRERE.png" class="pub-img">

  <strong>Economic activity and climate change</strong><br>
  de Juan, A., Poncela, P., <u>Rodríguez-Caballero, C.V.</u>, & Ruiz, E.<br>
  <em>International Review of Environmental and Resource Economics</em>, 2025.

  <div class="btn-row">

    <a href="javascript:toggleDiv('abs-eco2025')" class="btn btn--info btn--sm">ABS</a>

    <a href="https://arxiv.org/pdf/2206.03187" target="_blank"
       class="btn btn--primary btn--sm">Working Paper</a>

    <a href="https://doi.org/10.1561/101.00000176" target="_blank"
       class="btn btn--success btn--sm">Published</a>

    <a href="javascript:toggleDiv('bib-eco2025')" class="btn btn--warning btn--sm">BIB</a>

  </div>

  <div id="abs-eco2025" style="display:none; margin-top:12px;">
    <strong>Abstract:</strong><br>
    <em>
    The links between climate change and economic activity have a critical relevance…
    (tu abstract completo aquí)
    </em>
  </div>

  <div id="bib-eco2025" style="display:none; margin-top:12px;">
<pre><code>@article{de2025economic,
  ... (tu bib completo)
}
</code></pre>
  </div>

</div>


<!-- ============================= -->
<!-- ==== 2024 — PAPER 1 ======== -->
<!-- ============================= -->

<div class="pub-card">

  <img src="/assets/images/JAE24.png" class="pub-img">

  <strong>Expecting the unexpected: Stressed scenarios for economic growth</strong><br>
  Gonzalez-Rivera, G., <u>Rodríguez-Caballero, C.V.</u>, & Ruiz, E.<br>
  <em>Journal of Applied Econometrics</em>, 2024.

  <div class="btn-row">

    <a href="javascript:toggleDiv('abs-stress2024')" class="btn btn--info btn--sm">ABS</a>

    <!-- Working Papers Dropdown -->
    <div class="dropdown-container">
      <button class="btn btn--primary btn--sm"
              onclick="toggleDropdown('wp-stress2024')">
        Working Papers ▼
      </button>
      <div id="wp-stress2024" class="dropdown-menu">
        <a href="https://econ.au.dk/...rp21_06.pdf" target="_blank">CREATES Working Paper 2021</a><br>
        <a href="https://economics.ucr.edu/.../202314.pdf" target="_blank">UCR Working Paper 2023</a>
      </div>
    </div>

    <a href="https://doi.org/10.1002/jae.3060" target="_blank"
       class="btn btn--success btn--sm">Published</a>

    <!-- Media Dropdown -->
    <div class="dropdown-container">
      <button class="btn btn--secondary btn--sm"
              onclick="toggleDropdown('media-stress2024')">
        Media ▼
      </button>
      <div id="media-stress2024" class="dropdown-menu" style="min-width:180px;">
        <a href="https://www.dropbox.com/.../ITAM-Seminar.pdf?dl=0" target="_blank">Slides (PDF)</a><br>
        <a href="https://youtu.be/hWsSMfApqE8" target="_blank">Video presentation</a><br>
        <a href="https://youtu.be/DGJhBLE6CpA" target="_blank">Seminar recording</a>
      </div>
    </div>

    <a href="https://doi.org/10.15456/jae.2024100.1525366766"
       target="_blank" class="btn btn--secondary btn--sm">Reproducity</a>

    <a href="javascript:toggleDiv('bib-stress2024')" class="btn btn--warning btn--sm">BIB</a>

  </div>

  <div id="abs-stress2024" style="display:none; margin-top:12px;">
    <strong>Abstract:</strong>
    <em>
    We propose the construction of conditional growth densities…
    </em>
  </div>

  <div id="bib-stress2024" style="display:none; margin-top:12px;">
<pre><code>@article{gonzalez2024expecting,
  ... (tu bib completo)
}
</code></pre>
  </div>

</div>

</div> 


<!-- ============================= -->
<!-- ==== 2024 — PAPER 2 ======== -->
<!-- ============================= -->

<div class="pub-card">

  <img src="/assets/images/EE24.png" class="pub-img">

  <strong>The Factor Structure of Exchange Rates Volatility: Global and Intermittent Factors</strong><br>
  Caporin, M., <u>Rodríguez-Caballero, C.V.</u>, & Ruiz, E.<br>
  <em>Empirical Economics</em>, 2024.

  <div class="btn-row">

    <!-- ABS -->
    <a href="javascript:toggleDiv('abs-exch2024')" class="btn btn--info btn--sm">
      ABS
    </a>

    <!-- Working Paper directo (si tienes solo 1, cámbialo aquí) -->
    <a href="https://arxiv.org/pdf/2401.12345" target="_blank"
       class="btn btn--primary btn--sm">
      Working Paper
    </a>

    <!-- Published -->
    <a href="https://doi.org/10.1007/s00181-023-02542-3" target="_blank"
       class="btn btn--success btn--sm">
      Published
    </a>

    <!-- Media Dropdown (opcional) -->
    <div class="dropdown-container">
      <button class="btn btn--secondary btn--sm"
              onclick="toggleDropdown('media-exch2024')">
        Media ▼
      </button>
      <div id="media-exch2024" class="dropdown-menu" style="min-width:180px;">
        <!-- Puedes añadir más -->
        <a href="SLIDES_LINK_HERE" target="_blank">Slides (PDF)</a><br>
        <!-- <a href="VIDEO_LINK_HERE" target="_blank">Video presentation</a><br> -->
      </div>
    </div>

    <!-- BIB -->
    <a href="javascript:toggleDiv('bib-exch2024')" class="btn btn--warning btn--sm">
      BIB
    </a>

  </div>

  <!-- Abstract -->
  <div id="abs-exch2024" style="display:none; margin-top:12px;">
    <strong>Abstract:</strong><br>
    <em>
    This paper studies the factor structure driving exchange rate volatility across  
    major world currencies. We identify global and intermittent factors using  
    high-frequency realized measures and a novel methodological approach  
    combining… *(continúa tu texto completo aquí)*.
    </em>
  </div>

  <!-- BibTeX -->
  <div id="bib-exch2024" style="display:none; margin-top:12px;">
<pre><code>@article{caporin2024factor,
  title={The Factor Structure of Exchange Rates Volatility: Global and Intermittent Factors},
  author={Caporin, Massimiliano and Rodr{\'\i}guez-Caballero, C Vladimir and Ruiz, Esther},
  journal={Empirical Economics},
  year={2024},
  publisher={Springer},
  doi={10.1007/s00181-023-02542-3}
}
</code></pre>
  </div>

</div>

