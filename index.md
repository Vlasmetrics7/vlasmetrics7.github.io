---
layout: single
title: "Home"
permalink: /
classes: wide
author_profile: false
sidebar: false
toc: false
---

<!-- ========================================================= -->
<!--                  🌙 DARK MODE TOGGLE                      -->
<!-- ========================================================= -->

<style>
#darkToggle {
  position: fixed;
  top: 20px;
  right: 25px;
  background: #e6e6e6;
  border: none;
  padding: 10px 14px;
  border-radius: 8px;
  cursor: pointer;
  font-size: 15px;
  font-weight: 600;
  box-shadow: 0 3px 10px rgba(0,0,0,0.15);
  transition: .3s;
  z-index: 9999;
}
#darkToggle:hover { transform: translateY(-2px); background: #d4d4d4; }

/* DARK MODE */
.dark-mode {
  filter: invert(1) hue-rotate(180deg);
}
.dark-mode img {
  filter: invert(1) hue-rotate(180deg);
}
</style>

<script>
function toggleDarkMode() {
    document.documentElement.classList.toggle('dark-mode');
    localStorage.setItem('darkMode', document.documentElement.classList.contains('dark-mode'));
}
document.addEventListener("DOMContentLoaded", function(){
    if (localStorage.getItem('darkMode') === 'true') {
        document.documentElement.classList.add('dark-mode');
    }
});
</script>

<button id="darkToggle" onclick="toggleDarkMode()">🌙</button>

<!-- ========================================================= -->
<!--                  PROFILE LAYOUT WIDE                      -->
<!-- ========================================================= -->

<style>
.profile-wrapper {
  max-width: 1400px;      /* 🔥 mucho más ancho */
  margin: 0 auto;
  padding: 40px 20px;
}

.profile-flex {
  display: flex;
  gap: 60px;
  align-items: flex-start;
}

/* FOTO MÁS GRANDE */
.profile-photo img {
  width: 360px;           /* 🔥 aumentado */
  border-radius: 14px;
  box-shadow: 0 8px 22px rgba(0,0,0,0.28);
}

/* TEXTO MÁS ANCHO */
.profile-text {
  flex: 1;
  font-size: 18px;
  line-height: 1.65;
}

.name {
  font-size: 44px;
  font-weight: 800;
  margin-bottom: 10px;
}

.subtitle {
  font-size: 22px;
  color: #555;
  margin-bottom: 25px;
}

/* BOTONES */
.social-buttons {
  margin-top: 30px;
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
}
.social-buttons a {
  padding: 9px 16px;
  background: #eef2ff;
  border-radius: 8px;
  border: 1px solid #cdd8ff;
  text-decoration: none;
  font-weight: 600;
  color: #222;
  transition: .2s;
}
.social-buttons a:hover { transform: translateY(-2px); background: #dce4ff; }
</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<div class="profile-wrapper">
  <div class="profile-flex">

    <!-- =========================================== -->
    <!--                 TEXTO                       -->
    <!-- =========================================== -->
    <div class="profile-text">
      <div class="name">Carlos Vladimir Rodríguez-Caballero</div>

      <div class="subtitle">
        Applied Econometrics · Time Series · Climate & Financial Econometrics
      </div>

      Associate Professor of Statistics at ITAM and Visiting Researcher at Duke University (2025–2026).  
      PhD in Economics (Econometrics), Aarhus University & CREATES.

      <br><br>

      <strong>Research fields:</strong>
      <ul>
        <li>Time-series econometrics and long memory</li>
        <li>High-dimensional factor models</li>
        <li>Macroeconometrics & empirical forecasting</li>
        <li>Climate, energy & financial econometrics</li>
      </ul>

      <!-- BOTONES -->
      <div class="social-buttons">
        <a href="mailto:vlad.rodriguez@itam.mx"><i class="fa-solid fa-envelope"></i> ITAM Email</a>
        <a href="mailto:vladimir.rodriguez@duke.edu"><i class="fa-solid fa-envelope-open"></i> Duke Email</a>
        <a href="https://github.com/Vlasmetrics7" target="_blank"><i class="fa-brands fa-github"></i> GitHub</a>
        <a href="https://www.itam.mx" target="_blank"><i class="fa-solid fa-landmark"></i> ITAM</a>
        <a href="https://scholar.google.com" target="_blank"><i class="fa-brands fa-google"></i> Scholar</a>
        <a href="https://orcid.org" target="_blank"><i class="fa-brands fa-orcid"></i> ORCID</a>
        <a href="https://www.scopus.com/authid/detail.uri?authorId=57195995467" target="_blank"><i class="fa-solid fa-database"></i> Scopus</a>
      </div>
    </div>

    <!-- =========================================== -->
    <!--                 FOTO                        -->
    <!-- =========================================== -->
    <div class="profile-photo">
      <img src="/assets/images/profile.jpg">
    </div>

  </div>
</div>
