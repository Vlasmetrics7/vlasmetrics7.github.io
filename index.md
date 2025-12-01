---
layout: single
permalink: /
classes: wide
author_profile: false
sidebar: false
toc: false
---

<!-- ========================================================= -->
<!--                  OVERRIDE DEL TEMA                        -->
<!-- ========================================================= -->

<style>

/* Hace que Minimal Mistakes NO interfiera */
.home-wrapper .page,
.home-wrapper .page__content {
  padding: 0 !important;
  margin: 0 !important;
  max-width: 200% !important;
}

.home-wrapper {
  width: 200%;
  max-width: 1500px;
  margin: 0 auto;
}

/* ========================================================= */
/*                  TU NUEVO DISEÑO                          */
/* ========================================================= */

.profile-wrapper {
  padding: 50px 20px;
}

.profile-grid {
  display: grid;
  grid-template-columns: 1fr 430px;
  gap: 70px;
  align-items: start;
}

.profile-photo img {
  width: 100%;
  max-width: 430px;
  border-radius: 16px;
  box-shadow: 0 10px 25px rgba(0,0,0,0.25);
  display: block;
}

.profile-photo {
  margin-top: 40px;
}

.profile-text {
  text-align: left;
}

.name {
  font-size: 48px;
  font-weight: 800;
  line-height: 1.15;
  margin-bottom: 12px;
}

.subtitle {
  font-size: 22px;
  color: #555;
  margin-bottom: 28px;
}

.profile-text p {
  font-size: 19px;
  line-height: 1.7;
  text-align: justify;
}

/* ===================== BOTONES ===================== */

.social-buttons {
  margin-top: 30px;
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
}

.social-buttons a {
  padding: 10px 16px;
  background: #eef2ff;
  border-radius: 8px;
  border: 1px solid #cdd8ff;
  font-weight: 600;
  color: #222;
  text-decoration: none;
  transition: .2s;
}
.social-buttons a:hover {
  transform: translateY(-2px);
  background: #dce4ff;
}

</style>

<!-- ICONOS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">


<!-- ========================================================= -->
<!--                CONTENIDO REAL DEL HOME                    -->
<!-- ========================================================= -->

<div class="home-wrapper">

<div class="profile-wrapper">
  <div class="profile-grid">

    <!-- ===================== TEXTO ===================== -->
    <div class="profile-text">

      <div class="name">C. Vladimir Rodríguez-Caballero</div>

      <div class="subtitle">
        Applied Econometrics · Time Series · Climate & Financial Econometrics
      </div>

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

      <!-- ========== BOTONES ========== -->
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

    <!-- ===================== FOTO ===================== -->
    <div class="profile-photo">
      <img src="assets/images/img-6925_orig.jpg">
    </div>

  </div>
</div>

</div>


