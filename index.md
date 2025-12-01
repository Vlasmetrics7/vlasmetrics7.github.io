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
    z-index: 3000;
  }
  #darkToggle:hover {
    transform: translateY(-2px);
    background: #d4d4d4;
  }

  /* ===================== DARK MODE ===================== */
  body.dark-mode {
    background: #111 !important;
    color: #ddd !important;
  }

  body.dark-mode .profile-card {
    background: #1b1b1b !important;
    color: #ddd !important;
    box-shadow: 0 5px 20px rgba(255,255,255,0.10) !important;
  }

  body.dark-mode .social-btn {
    background: #222 !important;
    border-color: #333 !important;
    color: #eee !important;
  }
  body.dark-mode .social-btn:hover {
    background: #333 !important;
  }

  body.dark-mode .stat-item {
    background: #222 !important;
    color: #eee !important;
  }

</style>

<script>
  function toggleDarkMode() {
    document.body.classList.toggle('dark-mode');
    localStorage.setItem('darkMode', document.body.classList.contains('dark-mode'));
  }

  // Mantener preferencia entre visitas
  document.addEventListener("DOMContentLoaded", function(){
    if (localStorage.getItem('darkMode') === 'true') {
      document.body.classList.add('dark-mode');
    }
  });
</script>

<button id="darkToggle" onclick="toggleDarkMode()">🌙 Dark Mode</button>

<!-- ========================================================= -->
<!--                         PROFILE CARD                      -->
<!-- ========================================================= -->

<style>

.profile-container {
  max-width: 850px;
  margin: 0 auto;
  padding: 35px 25px;
}

.profile-card {
  background: #ffffff;
  padding: 35px;
  border-radius: 18px;
  text-align: center;
  box-shadow: 0 8px 24px rgba(0,0,0,0.18);
  transition: .25s;
}

/* Foto */
.profile-pic {
  width: 180px;
  height: 180px;
  border-radius: 50%;
  object-fit: cover;
  box-shadow: 0 6px 18px rgba(0,0,0,0.28);
  margin-bottom: 20px;
}

/* Nombre */
.profile-name {
  font-size: 38px;
  font-weight: 700;
  margin-bottom: 6px;
}

/* Subtítulo */
.profile-subtitle {
  font-size: 20px;
  color: #555;
  margin-bottom: 25px;
}

/* Botón grid */
.social-grid {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 14px;
  margin-bottom: 35px;
}

/* Botones */
.social-btn {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 10px 16px;
  background: #eef2ff;
  border-radius: 8px;
  font-weight: 600;
  font-size: 15px;
  text-decoration: none;
  border: 1px solid #cdd8ff;
  transition: .20s ease;
  color: #222;
}
.social-btn:hover {
  transform: translateY(-2px);
  background: #dce4ff;
}

/* Font Awesome icons */
.social-btn i {
  font-size: 18px;
}

/* About text */
.about-text {
  margin-top: 25px;
  font-size: 18px;
  line-height: 1.6;
  text-align: left;
}

/* Stats Section */
.stats-container {
  margin-top: 40px;
  display: flex;
  justify-content: center;
  gap: 20px;
  flex-wrap: wrap;
}

.stat-item {
  background: #f6f6ff;
  padding: 16px 20px;
  border-radius: 12px;
  min-width: 150px;
  text-align: center;
  box-shadow: 0 4px 14px rgba(0,0,0,0.12);
}

.stat-title {
  font-size: 14px;
  color: #666;
}

.stat-value {
  font-size: 26px;
  font-weight: 700;
  margin-top: 4px;
}

</style>

<!-- ICONOS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<div class="profile-container">

  <div class="profile-card">

    <!-- FOTO -->
    <img src="/assets/images/profile.jpg" class="profile-pic">

    <!-- NOMBRE -->
    <div class="profile-name">Carlos Vladimir Rodríguez-Caballero</div>

    <!-- SUBTÍTULO -->
    <div class="profile-subtitle">
      Applied Econometrics · Time Series · Climate & Financial Econometrics
    </div>

    <!-- BOTONES -->
    <div class="social-grid">

      <a href="mailto:vlad.rodriguez@itam.mx" target="_blank" class="social-btn">
        <i class="fa-solid fa-envelope"></i> ITAM Email
      </a>

      <a href="mailto:vladimir.rodriguez@duke.edu" target="_blank" class="social-btn">
        <i class="fa-solid fa-envelope-circle-check"></i> Duke Email
      </a>

      <a href="https://github.com/Vlasmetrics7" target="_blank" class="social-btn">
        <i class="fa-brands fa-github"></i> GitHub
      </a>

      <a href="https://www.itam.mx" target="_blank" class="social-btn">
        <i class="fa-solid fa-landmark"></i> ITAM
      </a>

      <a href="https://scholar.google.com/citations?user=XXXXXX" target="_blank" class="social-btn">
        <i class="fa-brands fa-google"></i> Scholar
      </a>

      <a href="https://orcid.org/0000-0002-XXXX-XXXX" target="_blank" class="social-btn">
        <i class="fa-brands fa-orcid"></i> ORCID
      </a>

      <a href="https://www.scopus.com/authid/detail.uri?authorId=57195995467" target="_blank" class="social-btn">
        <i class="fa-solid fa-database"></i> Scopus
      </a>

    </div>

    <!-- STATISTICS -->
    <div class="stats-container">
      <div class="stat-item">
        <div class="stat-title">Citations</div>
        <div class="stat-value">1,234</div>
      </div>

      <div class="stat-item">
        <div class="stat-title">h-Index</div>
        <div class="stat-value">17</div>
      </div>

      <div class="stat-item">
        <div class="stat-title">GitHub Repos</div>
        <div class="stat-value">12</div>
      </div>
    </div>

    <!-- ABOUT TEXT -->
    <div class="about-text">
     I am an Associate Professor of Statistics at the Instituto Tecnológico Autónomo de México (ITAM) and Visiting Researcher at the Department of Economics, Duke University (2025–2026). I hold a PhD in Economics (Econometrics) from Aarhus University and CREATES.

My main research fields include:

- Time-series econometrics and long memory  
- High-dimensional data and forecasting  
- Macroeconometrics  
- Applied studies in financial econometrics, energy, climate, and macroeconomics  

I serve as Associate Editor of *Latin American Economic Review* (2023–2025) 

Member of the Mexican National System of Researchers (SNI, Level II).

    </div>

  </div>
</div>
