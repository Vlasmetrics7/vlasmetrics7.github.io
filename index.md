---
layout: single
title: ""
permalink: /
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
  max-width: 1150px;
  margin: 0 auto;
  padding: 35px 25px;
  display: flex;
  gap: 45px;
  align-items: center;
}

.profile-left {
  flex: 1;
}

.profile-right {
  flex: 1;
  text-align: center;
}

.profile-card {
  background: #ffffff;
  padding: 35px;
  border-radius: 18px;
  box-shadow: 0 8px 24px rgba(0,0,0,0.18);
  transition: .25s;
}

.profile-pic {
  width: 280px;
  height: 280px;
  border-radius: 12px;
  object-fit: cover;
  box-shadow: 0 6px 18px rgba(0,0,0,0.28);
}

.profile-name {
  font-size: 40px;
  font-weight: 700;
  margin-bottom: 6px;
}

.profile-subtitle {
  font-size: 22px;
  color: #555;
  margin-bottom: 25px;
}

.social-grid {
  display: flex;
  flex-wrap: wrap;
  gap: 14px;
  margin: 30px 0;
}

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

.about-text {
  margin-top: 15px;
  font-size: 18px;
  line-height: 1.6;
}

.section-title {
  font-size: 26px;
  font-weight: 700;
  margin-top: 50px;
  margin-bottom: 15px;
}

.news-box, .events-box {
  background: #f7f7ff;
  padding: 18px 22px;
  border-radius: 12px;
  margin-bottom: 14px;
  box-shadow: 0 3px 10px rgba(0,0,0,0.12);
}
</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">


<div class="profile-container">

  <!-- LEFT SIDE: TEXT -->
  <div class="profile-left">
    <div class="profile-name">Carlos Vladimir Rodríguez-Caballero</div>
    <div class="profile-subtitle">Applied Econometrics · Time Series · Climate & Financial Econometrics</div>

    <div class="about-text">
      Associate Professor of Statistics at ITAM and Visiting Researcher at Duke University (2025–2026).  
      PhD in Economics (Econometrics), Aarhus University & CREATES.

      <br><br>
      Research fields:
      <ul>
        <li>Time-series econometrics and long memory</li>
        <li>High-dimensional factor models</li>
        <li>Macroeconometrics & empirical forecasting</li>
        <li>Climate, energy & financial econometrics</li>
      </ul>
    </div>

    <!-- SOCIAL BUTTONS -->
    <div class="social-grid">

      <a href="mailto:vlad.rodriguez@itam.mx" class="social-btn">
        <i class="fa-solid fa-envelope"></i> ITAM Email
      </a>

      <a href="mailto:vladimir.rodriguez@duke.edu" class="social-btn">
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
  </div>

  <!-- RIGHT SIDE: PHOTO -->
  <div class="profile-right">
    <img src="/assets/images/profile.jpg" class="profile-pic">
  </div>

</div>



<!-- ====================== EVENTS SECTION ====================== -->

<div class="section-title">Next Speaking Events / Workshops</div>

<div class="events-box">• 2025 — Bank of England Seminar (Invited)</div>
<div class="events-box">• 2025 — Duke Econometrics Workshop</div>
<div class="events-box">• 2025 — ITAM-Duke Joint Seminar Series</div>


<!-- ====================== NEWS SECTION ====================== -->

<div class="section-title">News</div>

<div class="news-box">• 2025 — Visiting Researcher, Duke University</div>
<div class="news-box">• 2024 — JAE paper accepted</div>
<div class="news-box">• 2024 — Climate-econometrics survey published</div>
