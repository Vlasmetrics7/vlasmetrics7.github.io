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
  height: 195px;  /* 4:3 = 260 × 195 */
  object-fit: cover;
  border-radius: 8px;
  flex-shrink: 0;
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

    <div id="abs-eco2025" style="display:none; margin-top:12px;">
      <strong>Abstract:</strong><br>
      <em>
      (tu abstract completo aquí)
      </em>
    </div>

    <div id="bib-eco2025" style="display:none; margin-top:12px;">
<pre><code>@article{de2025economic,
  ... tu bibtex ...
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
          <a href="https://econ.au.dk/.../rp21_06.pdf" target="_blank">CREATES WP 2021</a><br>
          <a href="https://economics.ucr.edu/...202314.pdf" target="_blank">UCR WP 2023</a>
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

    <div id="abs-stress2024" style="display:none; margin-top:12px;">
      <strong>Abstract:</strong><br>
      <em>(abstract completo aquí)</em>
    </div>

    <div id="bib-stress2024" style="display:none; margin-top:12px;">
<pre><code>@article{gonzalez2024expecting,
 ... tu bibtex ...
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

      <a href="https://arxiv.org/pdf/2401.12345"
         target="_blank" class="btn btn--primary btn--sm">Working Paper</a>

      <a href="https://doi.org/10.1007/s00181-023-02542-3"
         target="_blank" class="btn btn--success btn--sm">Published</a>

      <a href="javascript:toggleDiv('bib-exch2024')" class="btn btn--warning btn--sm">BIB</a>

    </div>

    <div id="abs-exch2024" style="display:none; margin-top:12px;">
      <strong>Abstract:</strong><br>
      <em>(abstract aquí)</em>
    </div>

    <div id="bib-exch2024" style="display:none; margin-top:12px;">
<pre><code>@article{caporin2024factor,
  ... tu bibtex ...
}
</code></pre>
    </div>

  </div>

</div>
