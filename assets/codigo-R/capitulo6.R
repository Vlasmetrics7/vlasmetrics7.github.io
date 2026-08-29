# ==============================================================
# Capítulo 6 - Pruebas de Hipótesis Paramétricas
# Inferencia Estadística, EST-11102, ITAM
# ==============================================================

# --------------------------------------------------------------
# 1. Prueba para la media: muestra grande (Z) y población normal
#    con varianza desconocida (t), verificada contra t.test()
#    (Secciones 6.8.1 y 6.10.2)
# --------------------------------------------------------------

# --- Muestra grande: rendimiento medio de un fondo (Ejemplo 6.x) ---
n_fondo    <- 64
xbar_fondo <- 0.011
s_fondo    <- 0.040
mu0        <- 0

z_obs <- sqrt(n_fondo) * (xbar_fondo - mu0) / s_fondo
valor_p_dos_colas <- 2 * (1 - pnorm(abs(z_obs)))
cat("Prueba Z para la media (muestra grande):\n")
cat("  z_obs =", round(z_obs, 3), "  valor-p =", round(valor_p_dos_colas, 4), "\n\n")

# --- Población normal, varianza desconocida: rendimiento de una acción ---
# Construimos una muestra simulada cuya media y desviación estándar
# muestrales coinciden EXACTAMENTE con las del Ejemplo 6.10.2 del libro
# (xbar = 1.8%, s = 3.2%), reescalando un vector normal estándar, para
# poder verificar el cálculo "a mano" contra t.test() con esos mismos
# números.
set.seed(301)
n_accion <- 16
xbar_objetivo <- 0.018
s_objetivo    <- 0.032
z_aux <- rnorm(n_accion)
rend  <- (z_aux - mean(z_aux)) / sd(z_aux) * s_objetivo + xbar_objetivo

mu0_accion <- 0.01
xbar <- mean(rend)
s    <- sd(rend)
t_obs <- sqrt(n_accion) * (xbar - mu0_accion) / s
valor_p_t <- 1 - pt(t_obs, df = n_accion - 1)   # H1: mu > mu0, una cola derecha

cat("Prueba t para la media (poblacion normal, sigma desconocida):\n")
cat("  t_obs =", round(t_obs, 3), "  valor-p =", round(valor_p_t, 4), "\n")

# Verificación con t.test(): la hipótesis alternativa "greater"
# corresponde a H1: mu > mu0
print(t.test(rend, mu = mu0_accion, alternative = "greater"))


# --------------------------------------------------------------
# 2. Prueba binomial exacta para una proporción con muestra
#    pequeña, verificada contra binom.test()
#    (Sección 6.9)
# --------------------------------------------------------------

n_campana <- 10
x_campana <- 8
p0_campana <- 0.5

# Cálculo "a mano" del valor-p, H1: p > p0
valor_p_binom <- sum(dbinom(x_campana:n_campana, size = n_campana, prob = p0_campana))
cat("\nPrueba binomial exacta (a mano):\n")
cat("  valor-p =", round(valor_p_binom, 4), "\n")

# Verificación con binom.test()
print(binom.test(x_campana, n_campana, p = p0_campana, alternative = "greater"))


# --------------------------------------------------------------
# 3. Prueba chi-cuadrada para la varianza de una población normal
#    (Sección 6.10.3)
# --------------------------------------------------------------

n_fx      <- 25
s2_fx     <- 0.000441
sigma20   <- 0.000225   # volatilidad diaria historica al cuadrado

chi2_obs <- (n_fx - 1) * s2_fx / sigma20
valor_p_chi2 <- 1 - pchisq(chi2_obs, df = n_fx - 1)   # H1: sigma^2 > sigma0^2

cat("\nPrueba chi-cuadrada para la varianza:\n")
cat("  chi2_obs =", round(chi2_obs, 3),
    "  valor crítico (0.05) =", round(qchisq(0.95, df = n_fx - 1), 3),
    "  valor-p =", round(valor_p_chi2, 5), "\n")


# --------------------------------------------------------------
# 4. Diferencia de medias (varianzas iguales) y diferencia de
#    varianzas para dos poblaciones normales, verificadas contra
#    t.test(var.equal = TRUE) y var.test()
#    (Sección 6.12)
# --------------------------------------------------------------
set.seed(302)

# Igual que en el bloque anterior, reescalamos para que las medias y
# desviaciones estándar muestrales coincidan exactamente con las del
# Ejemplo 6.12.1 (clientes con/sin tarjeta de lealtad), y así verificar
# los cálculos "a mano" del libro contra t.test() y var.test().
reescalar <- function(n, media_obj, sd_obj) {
  z <- rnorm(n)
  (z - mean(z)) / sd(z) * sd_obj + media_obj
}

n1 <- 20; n2 <- 25
grupo1 <- reescalar(n1, 45.2, 8.1)   # clientes con tarjeta de lealtad
grupo2 <- reescalar(n2, 39.6, 7.4)   # clientes sin tarjeta

# --- Prueba F para diferencia de varianzas (Sección 6.12.2) ---
s1 <- sd(grupo1); s2 <- sd(grupo2)
F_obs <- s1^2 / s2^2
cat("\nPrueba F para diferencia de varianzas:\n")
cat("  F_obs =", round(F_obs, 3), "\n")
print(var.test(grupo1, grupo2))

# --- Prueba t para diferencia de medias, varianzas iguales (pooled) ---
sp2 <- ((n1 - 1) * s1^2 + (n2 - 1) * s2^2) / (n1 + n2 - 2)
sp  <- sqrt(sp2)
t_obs_dif <- (mean(grupo1) - mean(grupo2)) / (sp * sqrt(1 / n1 + 1 / n2))
gl <- n1 + n2 - 2

cat("\nPrueba t para diferencia de medias (varianzas iguales, pooled):\n")
cat("  s_p =", round(sp, 3), "  t_obs =", round(t_obs_dif, 3),
    "  valor crítico (0.05, dos colas) =", round(qt(0.975, df = gl), 3), "\n")

# Verificación con t.test(var.equal = TRUE)
print(t.test(grupo1, grupo2, var.equal = TRUE))


# --------------------------------------------------------------
# 5. Verificación numérica de la dualidad IC <-> pruebas de dos
#    colas (Teorema 6.13.1), usando el fondo del bloque 1
# --------------------------------------------------------------

alpha <- 0.05
z_c   <- qnorm(1 - alpha / 2)
margen <- z_c * s_fondo / sqrt(n_fondo)
ic_media <- c(xbar_fondo - margen, xbar_fondo + margen)

rechaza_prueba <- abs(z_obs) > z_c
rechaza_por_ic <- !(ic_media[1] <= mu0 && mu0 <= ic_media[2])

cat("\nDualidad IC <-> prueba de dos colas:\n")
cat("  IC 95% para mu: (", round(ic_media[1], 4), ",", round(ic_media[2], 4), ")\n")
cat("  Se rechaza H0 via la prueba Z?      ", rechaza_prueba, "\n")
cat("  mu0 = 0 cae fuera del IC 95%?       ", rechaza_por_ic, "\n")
cat("  Coinciden ambas conclusiones?       ", rechaza_prueba == rechaza_por_ic, "\n\n")


# --------------------------------------------------------------
# 6. Simulación Monte Carlo de la función de potencia
#    (Definición 6.4.3): P(rechazar H0 | theta verdadero),
#    para H0: mu = 10 vs. H1: mu > 10, sigma = 2 conocida,
#    en función de n y del verdadero mu.
# --------------------------------------------------------------
set.seed(303)

mu0_pot    <- 10
sigma_pot  <- 2
alpha_pot  <- 0.05
z_alpha    <- qnorm(1 - alpha_pot)
B_sim      <- 2000

potencia_mc <- function(n, mu_verdadero) {
  rechazos <- replicate(B_sim, {
    x <- rnorm(n, mean = mu_verdadero, sd = sigma_pot)
    z <- sqrt(n) * (mean(x) - mu0_pot) / sigma_pot
    z > z_alpha
  })
  mean(rechazos)
}

mus <- seq(9.5, 12, by = 0.25)
tamanos_n <- c(16, 36, 64)

potencia_mat <- sapply(tamanos_n, function(n) sapply(mus, potencia_mc, n = n))
colnames(potencia_mat) <- paste0("n=", tamanos_n)

cat("Potencia estimada por Monte Carlo (filas = mu verdadero, columnas = n):\n")
print(round(cbind(mu = mus, potencia_mat), 3))

matplot(mus, potencia_mat, type = "l", lwd = 2, lty = 1,
        col = c("steelblue", "darkorange", "forestgreen"),
        xlab = expression(mu), ylab = "Potencia estimada",
        main = "Función de potencia: efecto de n sobre 1 - beta")
abline(h = alpha_pot, lty = 2, col = "gray40")
abline(v = mu0_pot, lty = 2, col = "gray40")
legend("bottomright", legend = paste0("n = ", tamanos_n),
       col = c("steelblue", "darkorange", "forestgreen"), lwd = 2, bty = "n")
