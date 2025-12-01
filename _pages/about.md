---
layout: single
title: "About Me"
permalink: /about/
classes: wide
sidebar: false
author_profile: false
toc: false
---

<!-- ========================================================= -->
<!--                 🌙 DARK MODE TOGGLE BUTTON               -->
<!-- ========================================================= -->

<style>
#darkToggle {
  position: fixed;
  top: 20px;
  right: 25px;
  background: #eee;
  border: none;
  padding: 10px 14px;
  border-radius: 8px;
  cursor: pointer;
  font-size: 15px;
  font-weight: 600;
  box-shadow: 0 3px 8px rgba(0,0,0,0.15);
  transition: .3s;
  z-index: 3000;
}
#darkToggle:hover { background: #ddd; }

/* DARK MODE */
body.dark-mode { background: #111 !important; color: #ddd !important; }
body.dark-mode .about-block { background: #1a1a1a !important; }
body.dark-mode a { color: #9fc1ff !important; }

/* LAYOUT */
.about-wrapper {
  display: flex;
  flex-wrap: wrap;
  gap: 40px;
  margin-top: 20px;
}

.about-text {
  flex: 1;
  min-width: 320px;
  font-size: 19px;
  line-height: 1.7;
}

.about-photo {
  flex: 0 0 320px;
  text-align: center;
}

.about-photo img {
  width: 320px;
  border-radius: 12px;
  box-shadow: 0 8px 25px rgba(0,0,0,0.25);
}

.section-title {
  font-size: 26px;
  font-weight: 700;
  margin-top: 45px;
  margin-bottom: 12px;
}

.section-block {
  background: #f7f9ff;
  padding: 18px 22px;
  border-radius: 10px;
  margin-bottom: 25px;
  box-shadow: 0 4px 16px rgba(0,0,0,0.10);
}

body.dark-mode .section-block {
  background: #222 !important;
  box-shadow: 0 4px 16px rgba(255,255,255,0.05);
}

/* SOCIAL BUTTONS */
.social-row {
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
  margin-top: 25px;
}

.social-btn {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 10px 16px;
  background: #eef2ff;
  border-radius: 8px;
  font-weight: 600;
  border: 1px solid #cdd8ff;
  text-decoration: none;
  color: #222;
  transition: 0.2s;
}

.social-btn:hover { background: #dce4ff; transform: translateY(-2px); }

body.dark-mode .social-btn {
  background: #333 !important;
  border-color: #555;
  color: #eee !important;
}

</style>

<script>
function toggleDarkMode() {
  document.body.classList.toggle("dark-mode");
  localStorage.setItem("darkMode", document.body.classList.contains("dark-mode"));
}

document.addEventListener("DOMContentLoaded", function(){
  if (localStorage.getItem("darkMode") === "true") {
    document.body.classList.add("dark-mode");
  }
});
</script>

<button id="darkToggle" onclick="toggleDarkMode()">🌙</button>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<!-- ========================================================= -->
<!--                        ABOUT SECTION                       -->
<!-- ========================================================= -->

<div class="about-wrapper">

  <div class="about-text">
    <h1 style="margin-top:0;">Carlos Vladimir Rodríguez-Caballero</h1>

    <p>
    I am an Associate Professor of Statistics at the Instituto Tecnológico Autónomo de México (ITAM) 
    and Visiting Researcher at the Department of Economics, Duke University (2025–2026). 
    I hold a PhD in Economics (Econometrics) from Aarhus University and CREATES.
    </p>

    <p>
    My research spans <strong>time-series econometrics</strong>, <strong>long memory</strong>, 
    <strong>dynamic factor models</strong>, <strong>forecasting</strong>, and applied work in 
    climate, macroeconomics, and financial econometrics.
    </p>

    <p>
    I serve as Associate Editor of <em>Latin American Economic Review</em> (2023–2025)  
    and I am a member of the Mexican National System of Researchers (SNI Level II).
    </p>

    <!-- SOCIAL BUTTONS -->
    <div class="social-row">

      <a class="social-btn" href="mailto:vlad.rodriguez@itam.mx">
        <i class="fa-solid fa-envelope"></i> ITAM
      </a>

      <a class="social-btn" href="mailto:vladimir.rodriguez@duke.edu">
        <i class="fa-solid fa-envelope-circle-check"></i> Duke
      </a>

      <a class="social-btn" href="https://github.com/Vlasmetrics7" target="_blank">
        <i class="fab fa-github"></i> GitHub
      </a>

      <a class="social-btn" href="https://scholar.google.com/citations?user=XXXX" target="_blank">
        <i class="fab fa-google"></i> Scholar
      </a>

      <a class="social-btn" href="https://orcid.org/0000-0002-XXXX-XXXX" target="_blank">
        <i class="fab fa-orcid"></i> ORCID
      </a>

      <a class="social-btn" href="https://www.scopus.com/authid/detail.uri?authorId=57195995467" target="_blank">
        <i class="fa-solid fa-database"></i> Scopus
      </a>

      <a class="social-btn" href="https://www.itam.mx" target="_blank">
        <i class="fa-solid fa-landmark"></i> ITAM
      </a>

    </div>

  </div>

  <!-- PHOTO -->
  <div class="about-photo">
    <img src="/assets/images/profile.jpg" alt="Profile Photo">
  </div>

</div>

<!-- ========================================================= -->
<!--                    EVENTS / PARTICIPATIONS                -->
<!-- ========================================================= -->

<h2 class="section-title">Next participation in workshops / conferences</h2>

<div class="section-block">
<ul>
  <li><strong>sIAAE 2025</strong>, Oslo — Presenter (Time-Series Econometrics)</li>
  <li><strong>NBER-NSF Time Series Meeting</strong>, UC Berkeley — Discussant</li>
  <li><strong>EC^2 Conference</strong>, Florence — Paper Presentation (Dynamic Factor Models)</li>
</ul>
</div>

<!-- ========================================================= -->
<!--                             NEWS                          -->
<!-- ========================================================= -->

<h2 class="section-title">News</h2>

<div class="section-block">
<ul>
  <li>📄 New manuscript: <em>“Stressed Predictive Densities for Multivariate Economies”</em></li>
  <li>🎓 Visiting Position confirmed at Duke University (2025–2026)</li>
  <li>📢 FARS package update released on CRAN</li>
</ul>
</div>
