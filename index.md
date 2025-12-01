---
layout: default
title: "Carlos Vladimir Rodríguez-Caballero"
permalink: /
---

<style>
:root {
  --bg-color: #ffffff;
  --text-color: #1a1a1a;
  --link-color: #1a73e8;
}

body {
  background-color: var(--bg-color);
  color: var(--text-color);
  font-family: system-ui, sans-serif;
}

.intro {
  display: flex;
  align-items: flex-start;
  justify-content: center;
  gap: 60px;
  max-width: 1400px;
  margin: 40px auto;
  padding: 0 20px;
}

.text-block {
  flex: 1;
  font-size: 18px;
  line-height: 1.7;
  text-align: justify;
}

.text-block h1 {
  font-size: 40px;
  font-weight: 800;
  margin-bottom: 12px;
}

.text-block .subtitle {
  font-size: 20px;
  color: #555;
  margin-bottom: 22px;
}

.text-block ul {
  margin-top: 8px;
  padding-left: 1.4rem;
}

.profile-photo img {
  width: 360px;
  border-radius: 12px;
  box-shadow: 0 8px 22px rgba(0,0,0,0.2);
  margin-top: 16px;
}

.social-buttons {
  margin-top: 28px;
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
}

.social-buttons a {
  background: #eef2ff;
  border: 1px solid #cdd8ff;
  padding: 9px 16px;
  border-radius: 8px;
  font-weight: 600;
  color: #222;
  text-decoration: none;
  transition: 0.2s;
}

.social-buttons a:hover {
  background: #dce4ff;
  transform: translateY(-2px);
}

/* DARK MODE */
body.dark-mode {
  --bg-color: #121212;
  --text-color: #e4e4e4;
  --link-color: #90caf9;
}

.dark-toggle {
  position: fixed;
  top: 12px;
  right: 16px;
  padding: 8px 12px;
  border: none;
  border-radius: 8px;
  background: #f1f1f1;
  cursor: pointer;
  font-size: 15px;
  font-weight: 600;
  box-shadow: 0 3px 8px rgba(0,0,0,0.2);
  z-index: 9999;
}
body.dark-mode .dark-toggle {
  background: #2a2a2a;
  color: #fff;
}
</style>

<!-- Botón modo oscuro -->
<button class="dark-toggle" onclick="toggleDarkMode()" id="darkToggle">🌙 Dark</button>

<script>
  function toggleDarkMode() {
    const body = document.body;
    const btn  = document.getElementById('darkToggle');
    body.classList.toggle('dark-mode');
    const isDark = body.classList.contains('dark-mode');
    localStorage.setItem('darkMode', isDark);
    btn.textContent = isDark ? '☀ Light' : '🌙 Dark';
  }

  document.addEventListener("DOMContentLoaded", function(){
    const isDark = localStorage.getItem('darkMode') === 'true';
    const btn    = document.getElementById('darkToggle');
    if (isDark) document.body.classList.add('dark-mode');
    if (btn)    btn.textContent = isDark ? '☀ Light' : '🌙 Dark';
  });
</script>

<!-- ====================== PERFIL ========================== -->

<div class="intro">
  <div class="text-block">
    <h1>Carlos Vladimir Rodríguez-Caballero</h1>
    <div class="subtitle">Applied Econometrics · Time Series · Climate & Financial Econometrics</div>

    <p>
      Associate Professor of Statistics at ITAM and Visiting Researcher at Duke University (2025–2026).  
      PhD in Economics (Econometrics), Aarhus University & CREATES.
    </p>

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
      <a href="https://www.itam.mx" target="_blank"><i class="fa-solid fa-landmark"></i> ITAM</a>
      <a href="https://scholar.google.com" target="_blank"><i class="fa-brands fa-google"></i> Scholar</a>
      <a href="https://orcid.org" target="_blank"><i class="fa-brands fa-orcid"></i> ORCID</a>
      <a href="https://www.scopus.com/authid/detail.uri?authorId=57195995467" target="_blank"><i class="fa-solid fa-database"></i> Scopus</a>
    </div>
  </div>

  <div class="profile-photo">
    <img src="assets/images/img-6925_orig.jpg" alt="Foto de Carlos Vladimir Rodríguez-Caballero">
  </div>
</div>
