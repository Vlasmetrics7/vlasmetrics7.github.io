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
  .dropdown-menu {
    display: none;
    position: absolute;
    background: rgba(255,255,255,0.95);
    border: 1px solid #ddd;
    padding: 10px 14px;
    border-radius: 6px;
    box-shadow: 0px 6px 14px rgba(0,0,0,0.20);
    z-index: 20;
    opacity: 0;
    transform: translateY(8px);
    transition: opacity 0.25s ease-out, transform 0.25s ease-out;
  }

  .dropdown-menu.show {
    display: block;
    opacity: 1;
    transform: translateY(0px);
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

## Journal Publications

## 2025

<div class="pub-entry" style="margin-bottom: 2rem; display:flex; align-items:flex-start;">

  <!-- Imagen -->
  <img src="/assets/images/IRERE.png" alt="Paper figure" 
       style="width:140px; margin-top:5px; margin-right:25px;">

  <div>

  <!-- === CONTENIDO AJUSTADO === -->

  <!-- Título -->
  <strong>Economic activity and climate change</strong><br>

  <!-- Autores -->
  de Juan, A., Poncela, P., <u>Rodríguez-Caballero, C.V.</u>, & Ruiz, E.<br>

  <!-- Journal + Año -->
  <em>International Review of Environmental and Resource Economics</em>, 2025.

  <br><br>

  <!-- Botones -->
  <a href="javascript:toggleDiv('abs-eco2025')" class="btn btn--info btn--sm">ABS</a>

  <!-- PDF (preprint / arxiv / wp) -->
  <a href="https://arxiv.org/pdf/2206.03187" target="_blank"  class="btn btn--primary btn--sm">Working Paper</a>

  <!-- Published version -->
  <a href="https://doi.org/10.1561/101.00000176" target="_blank"  class="btn btn--success btn--sm">Published</a>

  <!-- BibTeX -->
  <a href="javascript:toggleDiv('bib-eco2025')" class="btn btn--warning btn--sm">BIB</a>

  <!-- Abstract -->
  <div id="abs-eco2025" style="display:none; margin-top:1rem;">
    <strong>Abstract:</strong><br>
    <em>(The links between climate change and economic activity
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
phenomena.)</em>
  </div>

  <!-- BibTeX -->
  <div id="bib-eco2025" style="display:none; margin-top:1rem;">
<pre><code>@article{de2025economic,
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
</code></pre>
  </div>
  </div>
</div>

## 2024

<div class="pub-entry" style="margin-bottom: 2rem; display:flex; align-items:flex-start;">

  <!-- Imagen -->
  <img src="/assets/images/JAE24.png" alt="Paper figure" 
       style="width:140px; margin-top:5px; margin-right:25px;">

  <div>

  <!-- Título -->
  <strong>Expecting the unexpected: Stressed scenarios for economic growth</strong><br>

  <!-- Autores -->
  Gonzalez-Rivera, G., <u>Rodríguez-Caballero, C.V.</u>, and Ruiz, E.<br>

  <!-- Journal + Año -->
  <em>Journal of Applied Econometrics</em>, 2024.

  <br><br>

  <!-- ===== BLOQUE DE BOTONES ===== -->
  <div class="btn-row" style="display:flex; gap:10px; flex-wrap:wrap; align-items:center;">

    <!-- ABS -->
    <a href="javascript:toggleDiv('abs-ID2024')" class="btn btn--info btn--sm">ABS</a>

    <!-- Working Papers Dropdown -->
    <div style="display:inline-block; position:relative;">
      <button class="btn btn--primary btn--sm" onclick="toggleDropdown('wp-ID2024')">
        Working Papers ▼
      </button>

      <div id="wp-ID2024" class="dropdown-menu">
        <a href="https://econ.au.dk/fileadmin/site_files/filer_oekonomi/Working_Papers/CREATES/2021/rp21_06.pdf" target="_blank">
          CREATES Working Paper 2021
        </a><br>

        <a href="https://economics.ucr.edu/repec/ucr/wpaper/202314.pdf" target="_blank">
          UCR Working Paper 2023
        </a>
      </div>
    </div>

    <!-- Published Version -->
    <a href="https://doi.org/10.1002/jae.3060" target="_blank" class="btn btn--success btn--sm">
      Published
    </a>

    <!-- Media Dropdown -->
    <div style="display:inline-block; position:relative;">
      <button class="btn btn--secondary btn--sm" onclick="toggleDropdown('media-ID2024')">
        Media ▼
      </button>

      <div id="media-ID2024" class="dropdown-menu" style="min-width:180px;">
        <a href="https://www.dropbox.com/scl/fi/7v2gcs5str3vd3yu00iga/ITAM-Seminar.pdf?rlkey=5o5fribeiuaoffypoh7as6zoy&st=ojrfjs57&dl=0" target="_blank">Slides (PDF)</a><br>
        <a href="https://youtu.be/hWsSMfApqE8" target="_blank">Video presentation</a><br>
        <a href="https://youtu.be/DGJhBLE6CpA" target="_blank">Seminar recording</a><br>
      </div>
    </div>

    <!-- Reproducibility -->
    <a href="https://doi.org/10.15456/jae.2024100.1525366766" target="_blank" class="btn btn--secondary btn--sm">
      Reproducity
    </a>

    <!-- BIB -->
    <a href="javascript:toggleDiv('bib-ID2024')" class="btn btn--warning btn--sm">
      BIB
    </a>

  </div>
  <!-- ===== FIN BLOQUE DE BOTONES ===== -->

  <!-- ===== ABSTRACT (DEBE IR FUERA DEL BLOQUE) ===== -->
  <div id="abs-ID2024" style="display:none; margin-top:1rem; width:100%; clear:both;">
    <strong>Abstract:</strong><br>
    <em>We propose the construction of conditional growth densities under stressed factor scenarios...</em>
  </div>

  <!-- ===== BIBTEX (FUERA TAMBIÉN) ===== -->
  <div id="bib-ID2024" style="display:none; margin-top:1rem; width:100%; clear:both;">
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
</code></pre>
  </div>

  </div>
</div>
