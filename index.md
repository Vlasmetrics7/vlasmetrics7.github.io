---
layout: default
title: "Home"
permalink: /
classes: wide
author_profile: false
sidebar: false
toc: false
---

<!-- ================= DARK MODE ================= -->
<style>
  #darkToggle {
    position: fixed;
    top: 20px;
    right: 25px;
    background: #f4f4f4;
    border: none;
    padding: 10px 14px;
    border-radius: 8px;
    cursor: pointer;
    font-size: 14px;
    font-weight: 600;
    z-index: 9999;
    box-shadow: 0 3px 8px rgba(0,0,0,0.2);
  }
  body.dark-mode,
  body.dark-mode .page,
  body.dark-mode .page__content {
    background-color: #111 !important;
    color: #eee !important;
  }
  body.dark-mode a { color: #9ecbff !important; }
  body.dark-mode .social-buttons a { background: #222 !important; border-color: #444 !important; color: #eee !important; }
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
  document.addEventListener("DOMContentLoaded", function(){
    const isDark = localStorage.getItem('darkMode') === 'true';
    if (isDark) document.body.classList.add('dark-mode');
    const btn = document.getElementById('darkToggle');
    if (btn) btn.textContent = isDark ? '☀ Light' : '🌙 Dark';
  });
</script>

<button id="darkToggle" onclick="toggleDarkMode()">🌙 Dark</button>

<!-- ================= MAIN PROFILE ================= -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
  .profile-wrapper {
    max-width: 1400px;
    margin: 0 auto;
    padding: 40px 20px;
  }

  .profile-grid {
    display: grid;
    grid-template-columns: 1fr 380px;
    gap: 60px;
    align-items: start;
  }

.profile-photo img {
  width: 420px;
  height: 520px; /* 🔥 ajusta según lo que visualmente quede mejor */
  object-fit: contain; /* mantiene buena proporción */
  border-radius: 14px;
  box-shadow: 0 8px 22px rgba(0,0,0,0.25);
  display: block;
}

  .profile-text .name {
    font-size: 36px;
    font-weight: 800;
    margin-bottom: 8px;
  }

  .subtitle {
    font-size: 20px;
    color: #666;
    margin-bottom: 20px;
  }

  .profile-text p {
    font-size: 25px;
    line-height: 1;
    text-align: justify;
  }

  .social-buttons {
    margin-top: 25px;
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
  }

  .social-buttons a {
    padding: 9px 14px;
    background: #eef2ff;
    border-radius: 8px;
    border: 1px solid #cdd8ff;
    text-decoration: none;
    font-weight: 600;
    color: #222;
    transition: .2s;
  }

  .social-buttons a:hover {
    transform: translateY(-2px);
    background: #dce4ff;
  }
</style>

<div class="profile-wrapper">
  <div class="profile-grid">

    <div class="profile-text">
      <div class="name">C. Vladimir Rodríguez-Caballero</div>
      <div class="subtitle">Time Series Econometrics </div>

      <p>Associate Professor of Statistics at <a href="https://www.itam.mx" target="_blank">ITAM</a> </p>
      <p>Visiting Professor in the <a href="https://econ.duke.edu/" target="_blank">Department of Economics</a>  at <a href="https://www.duke.edu" target="_blank">Duke University</a> (2025–2026).</p> 
      <p>PhD in Econometrics, Aarhus University & <a href="https://econ.au.dk/research/research-centres/former-research-centres/creates" target="_blank">CREATES</a>.</p>

      <p><strong>Research fields:</strong></p>
      <ul>
        <li>Time-series econometrics and long memory</li>
        <li>High-dimensional factor models</li>
        <li>Macroeconometrics & empirical forecasting</li>
        <li>Climate, energy & financial econometrics</li>
      </ul>

      <div class="social-buttons">
        <a href="mailto:vlad.rodriguez@itam.mx"><i class="fa-solid fa-envelope"></i> ITAM Email</a>
        <a href="mailto:vladimir.rodriguez@duke.edu"><i class="fa-solid fa-envelope-open"></i> Duke Email</a>
        <a href="https://github.com/Vlasmetrics7" target="_blank"><i class="fa-brands fa-github"></i> GitHub</a>
       <!-- === <a href="https://www.itam.mx" target="_blank"><i class="fa-solid fa-landmark"></i> ITAM</a> == -->
        <a href="https://scholar.google.com.mx/citations?user=yzeOjrsAAAAJ&hl=es" target="_blank"><i class="fa-brands fa-google"></i> Scholar</a>
        <a href="https://orcid.org/0000-0002-3601-7715" target="_blank"><i class="fa-brands fa-orcid"></i> ORCID</a>
        <a href="https://www.scopus.com/authid/detail.uri?authorId=56144654500" target="_blank"><i class="fa-solid fa-database"></i> Scopus</a>
      </div>
    </div>

    <div class="profile-photo">
      <img src="assets/images/profile.jpg" alt="profile photo">
    </div>
  </div>

  <!-- ================= ADDITIONAL SECTIONS ================= -->
  <div style="margin-top: 100px;">
    <h2>Next Participation in Workshops / Conferences / Congresses</h2>
    <ul>
      <li><strong>2025:</strong> Financial Econometrics Lunch Group, Oct 20th, Duke University. </li>
      <li><strong>2025:</strong> Taller de frontera. CIMAT 45 Aniversario. By zoom. November 14th.</li>
     <!-- === <li><strong>2026:</strong> Time Series and Empirical Forecasting Symposium, Duke</li>== -->
    </ul>

    <h2 style="margin-top:40px;">News</h2>
    <ul>
      <li><strong>Nov 2025:</strong> Appointed Visiting Professor at Duke University</li>
     <!-- ===  <li><strong>Oct 2025:</strong> New working paper on high-dimensional factor models uploaded</li>
     <li><strong>Aug 2025:</strong> Received ITAM Research Grant</li>== -->
    </ul>
  </div>
</div>

<!-- FontAwesome icons (for JS rendering of icons) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/js/all.min.js"></script>
