---
layout: single
title: "Research"
permalink: /research/
---

<!-- ===================== -->
<!--  1. CONTENIDO HTML    -->
<!-- ===================== -->

<h2>What I Research</h2>

<p>
My research program develops a coherent econometric framework that links multilevel factor structures, fractional integration, long-memory dynamics, and stress-scenario propagation across macroeconomic, financial, energy, and climate-related systems. 
<br>
<br>
Across applications (from growth-in-stress densities to electricity markets, exchange-rate volatility, long economic histories, labour participation, pollution, and credit dynamics), most of my research papers uncover persistent common components, heterogeneous cross-sectional structures, and non-negligible tail risks that shape macroeconomic adjustment and policy design.
<br><br><br>
My research fields are:
<br>
- Non-stationary time series analysis  
- Modelling of persistence (long memory models)  
- Panel data models and dynamic factor models  
- Forecasting
<br>
<br>

You can find related publications in the [Publications](/publications/) and [Working Papers](/working-papers/) sections.
<br><br>
</p>

<button class="research-toggle" onclick="toggleResearchText()">Read Full Research Overview ▼</button>

<div id="research-full" class="research-hidden">
<!-- ============================= -->
<!--   RESEARCH OVERVIEW SECTION   -->
<!-- ============================= -->

<h2>What I Research</h2>

<p>
My work spans econometrics, time-series modelling, climate–economy interactions,
long-range dependence, multi-level factor models, and the study of structural dynamics 
in macro-financial systems. Below is a compact overview summarizing the themes that 
appear recurrently across my published and ongoing research.
</p>

<button class="research-toggle" onclick="toggleResearchText()">Read Full Research Overview ▼</button>

<div id="research-full" class="research-hidden">
  <p>
The links between climate change and economic activity have a critical relevance for the
well-being of future generations. Consequently, many publications are devoted to
understanding and measuring them. This paper is a comprehensive survey of recent
contributions using econometric methods. We update previous surveys focusing on partial
aspects of the complex relationships linking the economy and climate change. Starting from
economic activity, the channels that relate it to climate change are energy consumption and
the consequent pollution. Hence, we first describe the main econometric contributions of the
interactions between economic activity and energy consumption, then explain the
contributions and interactions of economic activity to pollution. Finally, we look at the main
results on the relationship between climate change and economic activity. A necessary
consequence of climate change is the increasing occurrence of extreme weather phenomena.
Therefore, we also survey contributions on the economic effects of catastrophic climate
phenomena.
<br><br>

We propose the construction of conditional growth densities under stressed factor scenarios to
assess the level of exposure of an economy to small probability but potentially catastrophic
economic and/or financial scenarios, which can be either domestic or international. The choice
of severe yet plausible stress scenarios is based on the joint probability distribution of the
underlying factors driving growth, which are extracted with a multilevel dynamic factor model
(DFM) from a wide set of domestic/worldwide and/or macroeconomic/financial variables.
All together, we provide a risk management tool that allows for a complete visualization of the
dynamics of the growth densities under average scenarios and extreme scenarios.
<br><br>

In this paper, we consider a fractionally integrated multi-level dynamic factor model
(FI-ML-DFM) to represent commonalities in the hourly evolution of realized volatilities of
several international exchange rates. The FI-ML-DFM assumes common global factors active
during the 24 h of the day, accompanied by intermittent factors active at mutually exclusive
times. We propose determining the number of global factors using a distance among the
intermittent loadings. We show that although the bulk of common dynamics of exchange rate
realized volatilities can be attributed to global factors, there are non-negligible effects of
intermittent factors.
<br><br>

A dynamic multi-level factor model with possible stochastic time trends is proposed. In the
model, long-range dependence and short memory dynamics are allowed in global and local
common factors as well as in the innovations. We estimate factors using prewhitened series,
canonical correlations, and a sequential least-squares algorithm. The methodology performs
well in simulations and is applied to the Nord Pool electricity market.
<br><br>

We introduce a high-dimensional factor model with time-varying loadings and develop an
estimation procedure based on principal components and iterative GLS with wavelets. We
apply the method to the Nord Pool electricity market’s prices and loads.
<br><br>

A fractionally integrated panel data model with multi-level cross-sectional dependence is
proposed. It captures comovements between groups of variables via top-level and local
factors, allowing stationary and nonstationary behaviour. We apply it to long-run relationships
between energy consumption and economic growth.
<br><br>

We introduce a multilevel factor model capturing global, local, and semi-pervasive factors to
explain the commonality in CDS spreads. These models are more interpretable than PCA and
help recover risk contributions of latent factors in baskets of sovereign credit default swaps.
<br><br>

We study the causal link between electricity consumption and GDP (per capita) using VEC
models with structural breaks and exogeneity-based inference. Evidence varies across
countries, revealing multiple energy–growth regimes.
<br><br>

We analyze long economic series to assess persistent effects of pandemics on growth and
unemployment. Recent pandemics appear to have permanent effects on growth and increase
unemployment persistence, supporting timely countercyclical policies.
<br><br>

We develop Bayesian approaches for dating financial crashes in major historical bubbles
(S&P500, Hang Seng, Merval, IPCMX). These models provide 95% credible intervals for crash
timing.
<br><br>

Polynomial specifications estimated under stochastic nonstationarity can lead to misleading
inference unless variables cointegrate. We generalize Phillips (1986) and highlight risks for
numerous applied fields.
<br><br>

Las decisiones de otorgamiento de crédito son cruciales en la administración de riesgos.
Presentamos una metodología para credit scoring en poblaciones sin historial crediticio, con
aplicación en una institución bancaria mexicana.
  </p>
</div>


</div>

<!-- ===================== -->
<!--        2. CSS         -->
<!-- ===================== -->

<style>
.research-toggle {
  background: #e4ecff;
  border: 1px solid #b7c8ff;
  padding: 10px 18px;
  border-radius: 8px;
  cursor: pointer;
  font-weight: 600;
  margin-top: 15px;
  transition: background 0.2s;
}

.research-toggle:hover {
  background: #d7e3ff;
}

#research-full {
  margin-top: 18px;
  padding: 16px 20px;
  background: #fafbff;
  border-left: 4px solid #8aa5ff;
  border-radius: 6px;
  display: none;
  font-size: 15px;
  line-height: 1.45;
}
</style>

<!-- ===================== -->
<!--       3. SCRIPT       -->
<!-- ===================== -->

<script>
function toggleResearchText() {
  const box = document.getElementById("research-full");
  const btn = document.querySelector(".research-toggle");

  if (box.style.display === "none" || box.style.display === "") {
    box.style.display = "block";
    btn.textContent = "Hide Full Research Overview ▲";
  } else {
    box.style.display = "none";
    btn.textContent = "Read Full Research Overview ▼";
  }
}
</script>


