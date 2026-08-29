# ==============================================================
# Capítulo 4 - Estimación puntual, convergencia y máxima verosimilitud
# Inferencia Estadística, EST-11102, ITAM
# ==============================================================

# --------------------------------------------------------------
# 1. Verificación del Teorema Central del Límite (Sección 4.7)
#    Población NO normal: exponencial(lambda = 1/8500), que modela
#    montos de reclamaciones de seguros (Ejercicio del capítulo).
# --------------------------------------------------------------
set.seed(123)

lambda_pob <- 1 / 8500          # tasa de la exponencial
mu_pob     <- 1 / lambda_pob    # media poblacional = 8500
sigma_pob  <- 1 / lambda_pob    # desv. estándar poblacional (exp: sigma = mu)

B <- 10000                      # número de muestras simuladas
tamanos_n <- c(2, 10, 30, 100)  # tamaños de muestra a comparar

par(mfrow = c(2, 2), mar = c(4, 4, 3, 1))
for (n in tamanos_n) {
  # Para cada tamaño de muestra, simulamos B medias muestrales
  medias <- replicate(B, mean(rexp(n, rate = lambda_pob)))

  # Estandarizamos: Z = sqrt(n)*(Xbarra - mu) / sigma
  z <- sqrt(n) * (medias - mu_pob) / sigma_pob

  hist(z, breaks = 50, freq = FALSE, col = "lightblue", border = "white",
       main = paste0("n = ", n),
       xlab = "Z estandarizada", ylab = "Densidad",
       xlim = c(-4, 4))
  curve(dnorm(x), col = "red", lwd = 2, add = TRUE)
}
mtext("Convergencia a N(0,1) del TCL (población exponencial)",
      side = 3, line = -1.5, outer = TRUE, cex = 1.1)

cat("Nótese cómo, aunque la población exponencial es muy asimétrica,\n",
    "la distribución de Z se acerca a la normal estándar conforme\n",
    "aumenta n --el contenido del Teorema Central del Límite.\n")


# --------------------------------------------------------------
# 2. Consistencia: la varianza del estimador decrece con n
#    (Sección 4.6). Estimador: S^2 (varianza muestral) de una
#    población de rendimientos simulados N(0.01, 0.04^2).
# --------------------------------------------------------------
set.seed(456)

mu_r    <- 0.01
sigma_r <- 0.04
tamanos_n2 <- c(5, 15, 30, 60, 120, 250)
B2 <- 5000

resultados_s2 <- lapply(tamanos_n2, function(n) {
  replicate(B2, var(rnorm(n, mean = mu_r, sd = sigma_r)))
})
names(resultados_s2) <- paste0("n=", tamanos_n2)

par(mfrow = c(1, 1), mar = c(4, 4, 3, 1))
boxplot(resultados_s2,
        col = "lightgreen",
        main = expression(paste("Distribución de ", S^2, " para distintos ", n)),
        xlab = "Tamaño de muestra", ylab = expression(S^2))
abline(h = sigma_r^2, col = "red", lwd = 2, lty = 2)
legend("topright", legend = expression(sigma^2 ~ "verdadera"),
       col = "red", lty = 2, lwd = 2, bty = "n")

# Verificación numérica: la varianza de S^2 across simulaciones decrece
tabla_consistencia <- data.frame(
  n          = tamanos_n2,
  media_S2   = sapply(resultados_s2, mean),
  var_S2     = sapply(resultados_s2, var)
)
print(tabla_consistencia)
cat("\nLa varianza de S^2 entre simulaciones (columna var_S2) disminuye\n",
    "monótonamente con n: evidencia empírica de consistencia (Sección 4.6).\n")


# --------------------------------------------------------------
# 3. Máxima verosimilitud: forma cerrada y optimización numérica
#    (Sección 4.9)
# --------------------------------------------------------------

# --- 3a. EMV cerrado: Bernoulli (proporción de incumplimiento) ---
set.seed(789)
n_credito <- 500
p_real    <- 0.06
incumplimientos <- rbinom(n_credito, size = 1, prob = p_real)

p_hat <- mean(incumplimientos)  # EMV: proporción muestral
cat("\n--- EMV Bernoulli (incumplimiento de crédito) ---\n")
cat("p real:", p_real, " | p_hat (EMV):", round(p_hat, 4), "\n")

# --- 3b. EMV cerrado: Exponencial (tiempo entre reclamaciones) ---
set.seed(101)
n_reclamos <- 50
lambda_real <- 1 / 12  # 1 reclamo cada 12 días en promedio
tiempos <- rexp(n_reclamos, rate = lambda_real)

lambda_hat <- 1 / mean(tiempos)  # EMV cerrado: 1/Xbarra
cat("\n--- EMV Exponencial (tiempo entre reclamaciones) ---\n")
cat("lambda real:", round(lambda_real, 4),
    " | lambda_hat (EMV):", round(lambda_hat, 4), "\n")

# --- 3c. EMV numérico vía optim(): distribución Gamma(forma, tasa) ---
# Útil cuando no hay forma cerrada, p. ej. severidad de siniestros.
set.seed(202)
forma_real <- 3
tasa_real  <- 0.5
severidad  <- rgamma(200, shape = forma_real, rate = tasa_real)

log_verosimilitud_gamma <- function(par, datos) {
  forma <- par[1]; tasa <- par[2]
  if (forma <= 0 || tasa <= 0) return(-Inf)  # respetar el espacio parametral
  sum(dgamma(datos, shape = forma, rate = tasa, log = TRUE))
}

ajuste <- optim(
  par     = c(1, 1),                     # valores iniciales
  fn      = function(par) -log_verosimilitud_gamma(par, severidad),
  method  = "L-BFGS-B",
  lower   = c(1e-4, 1e-4)
)

cat("\n--- EMV numérico: severidad de siniestros ~ Gamma(forma, tasa) ---\n")
cat("Parámetros reales:      forma =", forma_real, " tasa =", tasa_real, "\n")
cat("EMV (optim, L-BFGS-B):  forma =", round(ajuste$par[1], 3),
    " tasa =", round(ajuste$par[2], 3), "\n")


# --------------------------------------------------------------
# 4. Normalidad asintótica del EMV (Teorema 4.9, Sección 4.9)
#    Verificación por simulación para el modelo Bernoulli:
#    sqrt(n)*(p_hat - p) --> N(0, p(1-p))
# --------------------------------------------------------------
set.seed(303)
p0 <- 0.06
n_grande <- 500
B3 <- 8000

p_hats <- replicate(B3, mean(rbinom(n_grande, size = 1, prob = p0)))
z_emv  <- sqrt(n_grande) * (p_hats - p0) / sqrt(p0 * (1 - p0))

par(mfrow = c(1, 1), mar = c(4, 4, 3, 1))
hist(z_emv, breaks = 50, freq = FALSE, col = "lightblue", border = "white",
     main = "Normalidad asintótica del EMV (modelo Bernoulli)",
     xlab = expression(sqrt(n)*(hat(p)-p[0])/sqrt(p[0]*(1-p[0]))),
     ylab = "Densidad")
curve(dnorm(x), col = "red", lwd = 2, add = TRUE)
legend("topright", legend = c("Simulación (EMV)", "N(0,1) teórica"),
       col = c("lightblue", "red"), lwd = c(NA, 2), pch = c(15, NA), bty = "n")

cat("\nMedia de Z simulada:", round(mean(z_emv), 4), "(teórica: 0)\n")
cat("Varianza de Z simulada:", round(var(z_emv), 4), "(teórica: 1)\n")
cat("Esta simulación confirma numéricamente el Teorema 4.9:",
    "el EMV estandarizado se distribuye aproximadamente N(0,1)",
    "para n suficientemente grande.\n")
