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

<!-- ========================================================= -->
<!--                 🌙 DARK MODE TOGGLE BUTTON               -->
<!-- ========================================================= -->

<style>
  /* Botón flotante arriba-derecha */
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
  #darkToggle:hover {
    transform: translateY(-2px);
    background: #d4d4d4;
  }

  /* ===================== DARK MODE GLOBAL ===================== */
  body.dark-mode,
  body.dark-mode .page,
  body.dark-mode .page__content,
  body.dark-mode .masthead,
  body.dark-mode .site-header,
  body.dark-mode .site-footer {
    background-color: #111 !important;
    color: #eee !important;
  }

  /* Enlaces en oscuro */
  body.dark-mode a {
    color: #9ecbff !important;
  }

  /* Tarjeta principal de tu portada */
  body.dark-mode .profile-wrapper,
  body.dark-mode .profile-flex,
  body.dark-mode .profile-text {
    background-color: #111 !important;
    color: #eee !important;
  }

  /* Para que imágenes no se inviertan (las dejamos normales) */
  body.dark-mode img {
    filter: none !important;
  }
</style>

<script>
  function toggleDarkMode() {
    const body = document.body;
    const btn  = document.getElementById('darkToggle');

    body.classList.toggle('dark-mode');

    const isDark = body.classList.contains('dark-mode');
    localStorage.setItem('darkMode', isDark);

    if (btn) btn.textContent = isDark ? '☀ Light' : '🌙 Dark';
  }

  // Mantener preferencia entre visitas
  document.addEventListener("DOMContentLoaded", function(){
    const isDark = localStorage.getItem('darkMode') === 'true';
    const btn    = document.getElementById('darkToggle');

    if (isDark) document.body.classList.add('dark-mode');
    if (btn)    btn.textContent = isDark ? '☀ Light' : '🌙 Dark';
  });
</script>

<button id="darkToggle" onclick="toggleDarkMode()">🌙 Dark</button>


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
