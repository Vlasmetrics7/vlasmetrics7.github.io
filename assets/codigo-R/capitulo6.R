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

# ==============================================================
# BLOQUES DE LAS SECCIONES 6.1 A 6.4 (conceptos, errores, estadístico
# de prueba, región de rechazo, potencia y valor-p)
# Los bloques 7 a 9 generan las figuras y verifican las cifras del
# texto. Ejecutar con el directorio de trabajo en Figuras/ para que
# los .png caigan ahí.
# ==============================================================

try(Sys.setlocale("LC_CTYPE", "C.UTF-8"), silent = TRUE)
AZUL_ITAM  <- "#003366"
NARANJA    <- "#B5651D"
VERDE_ITAM <- "#00783C"
CORAL      <- "#C0432A"

# --------------------------------------------------------------
# 7. Figuras de la Sección 6.4
# --------------------------------------------------------------

# --- 7a. Errores tipo I y II de la prueba Z de una cola
#     (Figura 6.5; Ejemplo 6.4.2: n = 36, sigma = 4, alpha = 0.05, mu_a = 1)
alpha7 <- 0.05
delta7 <- sqrt(36) * 1 / 4                 # delta = 1.5
crit7  <- qnorm(1 - alpha7)                # 1.645
beta7  <- pnorm(crit7 - delta7)            # 0.5576

png("cap6_rechazo_errores.png", width = 2200, height = 1400, res = 220)
par(mar = c(4.2, 4.2, 1.2, 1.2))
x <- seq(-3.5, 5.5, length.out = 800)
plot(x, dnorm(x), type = "n", ylim = c(0, 0.47), xlim = c(-3.5, 5.5),
     xlab = "Valor del estadístico Z", ylab = "Densidad",
     cex.lab = 1.15, cex.axis = 1.05)
# beta: area bajo la alternativa a la izquierda del valor critico
xb <- seq(-3.5, crit7, length.out = 300)
polygon(c(xb, rev(xb)), c(dnorm(xb, delta7), rep(0, length(xb))),
        col = adjustcolor(NARANJA, 0.35), border = NA)
# alpha: area bajo H0 a la derecha del valor critico
xa <- seq(crit7, 5.5, length.out = 300)
polygon(c(xa, rev(xa)), c(dnorm(xa), rep(0, length(xa))),
        col = adjustcolor(AZUL_ITAM, 0.55), border = NA)
lines(x, dnorm(x), col = AZUL_ITAM, lwd = 3)
lines(x, dnorm(x, delta7), col = NARANJA, lwd = 3)
abline(v = crit7, lty = 2, lwd = 2, col = "gray30")
text(crit7, 0.455, expression(paste("valor crítico  ", z[0.05], " = 1.645")),
     pos = 4, cex = 0.95)
text(-0.9, 0.30, expression(paste("Bajo ", H[0], ":  ", mu, " = 0")),
     col = AZUL_ITAM, cex = 1.0)
text(3.4, 0.33, expression(paste("Bajo ", mu[a], " = 1  (", delta, " = 1.5)")),
     col = NARANJA, cex = 1.0)
text(2.45, 0.055, expression(alpha == 0.05), col = AZUL_ITAM, cex = 1.1)
text(0.45, 0.075, expression(beta %~~% 0.558), col = NARANJA, cex = 1.1)
text(-2.2, 0.2, expression(paste("No rechazar ", H[0])), cex = 0.95)
text(4.4, 0.2, expression(paste("Rechazar ", H[0])), cex = 0.95)
dev.off()

# --- 7b. Funcion de potencia de la prueba Z (Figura 6.6)
pot_una_cola <- function(mu, n, alpha, sigma = 4, mu0 = 0)
  1 - pnorm(qnorm(1 - alpha) - sqrt(n) * (mu - mu0) / sigma)
pot_dos_colas <- function(mu, n, alpha, sigma = 4, mu0 = 0) {
  d <- sqrt(n) * (mu - mu0) / sigma
  1 - pnorm(qnorm(1 - alpha / 2) - d) + pnorm(-qnorm(1 - alpha / 2) - d)
}

png("cap6_potencia.png", width = 2400, height = 1200, res = 220)
par(mfrow = c(1, 2), mar = c(4.2, 4.2, 2.2, 1.0))
mu_a <- seq(-0.5, 3, length.out = 300)
plot(mu_a, pot_una_cola(mu_a, 16, 0.05), type = "l", lwd = 3, col = AZUL_ITAM,
     ylim = c(0, 1), xlab = expression(mu), ylab = expression(Potencia(mu)),
     main = "(A) Efecto de n (una cola, α = 0.05)", cex.main = 1.0,
     cex.lab = 1.1)
lines(mu_a, pot_una_cola(mu_a, 36, 0.05), lwd = 3, col = NARANJA)
lines(mu_a, pot_una_cola(mu_a, 64, 0.05), lwd = 3, col = VERDE_ITAM)
abline(h = 0.05, lty = 3, col = "gray40"); abline(v = 0, lty = 3, col = "gray40")
legend(x = 1.95, y = 0.46, legend = c("n = 16", "n = 36", "n = 64"),
       col = c(AZUL_ITAM, NARANJA, VERDE_ITAM), lwd = 3, bty = "n")
mu_b <- seq(-3, 3, length.out = 400)
plot(mu_b, pot_una_cola(mu_b, 36, 0.05), type = "l", lwd = 3, col = AZUL_ITAM,
     ylim = c(0, 1.32), yaxt = "n", xlab = expression(mu), ylab = expression(Potencia(mu)),
     main = "(B) Una cola vs. dos colas (n = 36)", cex.main = 1.0,
     cex.lab = 1.1)
lines(mu_b, pot_dos_colas(mu_b, 36, 0.05), lwd = 3, col = NARANJA)
lines(mu_b, pot_una_cola(mu_b, 36, 0.01), lwd = 3, col = VERDE_ITAM, lty = 2)
abline(h = 0.05, lty = 3, col = "gray40"); abline(v = 0, lty = 3, col = "gray40")
axis(2, at = seq(0, 1, 0.2))
legend("top", legend = c("una cola, α = 0.05", "dos colas, α = 0.05", "una cola, α = 0.01"),
       col = c(AZUL_ITAM, NARANJA, VERDE_ITAM), lwd = 3, lty = c(1, 1, 2), bty = "n",
       cex = 0.9)
dev.off()

# --- 7c. Valor-p de una y de dos colas (Figura 6.7; Ejemplo 6.4.4; z_obs = 1.8)
zobs <- 1.8
png("cap6_valor_p.png", width = 2400, height = 1100, res = 220)
par(mfrow = c(1, 2), mar = c(4.2, 4.4, 2.2, 1.0))
x <- seq(-4, 4, length.out = 600)
# (A) una cola
plot(x, dnorm(x), type = "n", ylim = c(0, 0.5), xlab = "z", ylab = "Densidad",
     main = "(A) Una cola", cex.main = 1.0, cex.lab = 1.1)
xa <- seq(zobs, 4, length.out = 200)
polygon(c(xa, rev(xa)), c(dnorm(xa), rep(0, length(xa))),
        col = adjustcolor(NARANJA, 0.6), border = NA)
lines(x, dnorm(x), col = AZUL_ITAM, lwd = 3)
abline(v = qnorm(0.95), lty = 2, lwd = 2, col = "gray30")
abline(v = zobs, lwd = 2, col = NARANJA)
text(zobs + 0.1, 0.22, "valor-p\n= 0.0359", col = NARANJA, pos = 4, cex = 0.95)
legend("topleft", legend = c("valor crítico 1.645", "valor observado 1.8"),
       col = c("gray30", NARANJA), lty = c(2, 1), lwd = 2, bty = "n", cex = 0.85)
# (B) dos colas
plot(x, dnorm(x), type = "n", ylim = c(0, 0.5), xlab = "z", ylab = "Densidad",
     main = "(B) Dos colas", cex.main = 1.0, cex.lab = 1.1)
xr <- seq(zobs, 4, length.out = 200); xl <- seq(-4, -zobs, length.out = 200)
polygon(c(xr, rev(xr)), c(dnorm(xr), rep(0, length(xr))),
        col = adjustcolor(NARANJA, 0.6), border = NA)
polygon(c(xl, rev(xl)), c(dnorm(xl), rep(0, length(xl))),
        col = adjustcolor(NARANJA, 0.6), border = NA)
lines(x, dnorm(x), col = AZUL_ITAM, lwd = 3)
abline(v = c(-1, 1) * qnorm(0.975), lty = 2, lwd = 2, col = "gray30")
abline(v = c(-1, 1) * zobs, lwd = 2, col = NARANJA)
text(2.2, 0.25, "valor-p\n= 2 × 0.0359\n= 0.0719", col = NARANJA, pos = 4, cex = 0.95)
legend("topleft", legend = c("valores críticos ±1.96", "valores observados ±1.8"),
       col = c("gray30", NARANJA), lty = c(2, 1), lwd = 2, bty = "o", bg = "white",
       box.lty = 0, cex = 0.85)
dev.off()

# --- 7d. Region de rechazo con estadistico discreto (Figura 6.4)
#     Ejemplo 6.4.1: B ~ Bin(20, p), region {B >= 15}
png("cap6_binomial_rechazo.png", width = 2200, height = 1300, res = 220)
par(mar = c(4.2, 4.2, 1.2, 1.2))
k <- 0:20
w <- 0.38
plot(NA, xlim = c(-0.5, 20.5), ylim = c(0, 0.24), xlab = "B (número de fondos que superan al índice)",
     ylab = "Probabilidad", cex.lab = 1.1)
rect(k - w, 0, k, dbinom(k, 20, 0.5), col = ifelse(k >= 15, AZUL_ITAM, adjustcolor(AZUL_ITAM, 0.35)),
     border = "white")
rect(k, 0, k + w, dbinom(k, 20, 0.7), col = ifelse(k >= 15, NARANJA, adjustcolor(NARANJA, 0.35)),
     border = "white")
abline(v = 14.5, lty = 2, lwd = 2, col = "gray30")
text(14.4, 0.235, "región de rechazo  B ≥ 15", pos = 4, cex = 0.95)
legend("topleft", legend = c("Bajo H0: p = 0.5", "Bajo p = 0.7"),
       fill = c(AZUL_ITAM, NARANJA), bty = "n")
dev.off()

# --------------------------------------------------------------
# 8. Verificación numérica de las cifras de las Secciones 6.1 a 6.4
# --------------------------------------------------------------
cat("\n--- Cartera (Ejemplos 6.1.1 y 6.2.1): sd de X bajo p = 0.05, n = 400\n")
print(sqrt(400 * 0.05 * 0.95))

cat("\n--- Prueba de signos, n = 20 (Ejemplo 6.4.1, Cuadro 6.4)\n")
tab_bin <- data.frame(
  k        = 13:16,
  tamano   = round(1 - pbinom(12:15, 20, 0.5), 4),
  beta_07  = round(pbinom(12:15, 20, 0.7), 4))
tab_bin$potencia_07 <- round(1 - tab_bin$beta_07, 4)
print(tab_bin)
cat("valor-p (una cola) B = 15:", round(1 - pbinom(14, 20, 0.5), 4),
    " B = 14:", round(1 - pbinom(13, 20, 0.5), 4), "\n")
cat("binom.test (B = 15, una cola):",
    round(binom.test(15, 20, 0.5, alternative = "greater")$p.value, 4), "\n")

cat("\n--- Potencia y tamano de muestra (Ejemplos 6.4.2 y 6.4.3)\n")
cat("beta(1):", round(1 - pot_una_cola(1, 36, 0.05), 4),
    " potencia una cola:", round(pot_una_cola(1, 36, 0.05), 4),
    " potencia dos colas:", round(pot_dos_colas(1, 36, 0.05), 4), "\n")
n_una  <- (qnorm(0.95) + qnorm(0.90))^2 * 16 / 1
n_dos  <- (qnorm(0.975) + qnorm(0.90))^2 * 16 / 1
cat("n una cola:", round(n_una, 2), "-> ", ceiling(n_una),
    "  n dos colas (aprox.):", round(n_dos, 2), "-> ", ceiling(n_dos), "\n")
# n exacto en dos colas: menor n con potencia >= 0.90
n_dos_exacto <- which(pot_dos_colas(1, 1:400, 0.05) >= 0.90)[1]
cat("n dos colas (exacto):", n_dos_exacto, "\n")

cat("\n--- Valor-p (Ejemplos 6.3.1 y 6.4.4)\n")
cat("una cola:", round(1 - pnorm(1.8), 4), " dos colas:", round(2 * (1 - pnorm(1.8)), 4), "\n")

cat("\n--- Significancia estadistica vs. relevancia (Ejemplo 6.4.6)\n")
z_a <- sqrt(1e6) * 15 / 6000
z_b <- 4 * 2500 / 6000
cat("(a) z =", z_a, " valor-p dos colas =", round(2 * (1 - pnorm(z_a)), 4),
    " IC95 =", 15 + c(-1, 1) * 1.96 * 6000 / sqrt(1e6), "\n")
cat("(b) z =", round(z_b, 3), " valor-p dos colas =", round(2 * (1 - pnorm(z_b)), 4), "\n")

# --------------------------------------------------------------
# 9. Distribucion del valor-p bajo H0 (Proposicion 6.4.4)
# --------------------------------------------------------------
set.seed(306)
B_p <- 100000
# (a) estadistico continuo: prueba Z de una cola, n = 25, H0 cierta
p_cont <- replicate(B_p, {
  x <- rnorm(25)
  1 - pnorm(sqrt(25) * mean(x))
})
cat("\nContinuo: P(p <= 0.05) =", mean(p_cont <= 0.05),
    "  P(p <= 0.50) =", mean(p_cont <= 0.50), "\n")
# (b) estadistico discreto: B ~ Bin(10, 1/2), H1: p > 1/2
b_sim <- rbinom(B_p, 10, 0.5)
p_disc <- 1 - pbinom(b_sim - 1, 10, 0.5)
cat("Discreto: P(p <= 0.05) =", mean(p_disc <= 0.05),
    " (exacto:", round(1 - pbinom(8, 10, 0.5), 4), ")\n")

# --------------------------------------------------------------
# 10. Verificacion numerica de los ejercicios 6.4.3 a 6.4.9
#     (sin soluciones: son cifras de control para el profesor)
# --------------------------------------------------------------
cat("\n--- Ej. 6.4.3: beta y n (sigma = 5, mu0 = 50, mu_a = 52)\n")
cat("potencia n = 25:", round(pot_una_cola(52, 25, 0.05, sigma = 5, mu0 = 50), 4),
    " n minimo (90%):", ceiling((qnorm(0.95) + qnorm(0.90))^2 * 25 / 4), "\n")
cat("\n--- Ej. 6.4.4: dos colas, n = 25\n")
cat("potencia en 52:", round(pot_dos_colas(52, 25, 0.05, sigma = 5, mu0 = 50), 4),
    " en 48:", round(pot_dos_colas(48, 25, 0.05, sigma = 5, mu0 = 50), 4), "\n")
cat("\n--- Ej. 6.4.5: Bin(10, p), RR = {X >= c}\n")
print(data.frame(c = 7:9, tamano = round(1 - pbinom(6:8, 10, 0.5), 4),
                 pot_p08 = round(1 - pbinom(6:8, 10, 0.8), 4),
                 pot_p06 = round(1 - pbinom(6:8, 10, 0.6), 4)))
cat("\n--- Ej. 6.4.6: z_obs = -2.1\n")
cat("una cola:", round(pnorm(-2.1), 4), " dos colas:", round(2 * pnorm(-2.1), 4), "\n")
cat("\n--- Ej. 6.4.7: 12 aciertos de 15\n")
cat("una cola:", round(1 - pbinom(11, 15, 0.5), 4),
    " dos colas (doble):", round(2 * (1 - pbinom(11, 15, 0.5)), 4),
    " tamano de {X >= 12} (rechaza si p <= 0.05):",
    round(1 - pbinom(11, 15, 0.5), 4),
    " (con X = 11 el valor-p seria", round(1 - pbinom(10, 15, 0.5), 4), ")\n")
cat("\n--- Ej. 6.4.8: chi2, n = 21, s2 = 6.5, sigma0^2 = 4\n")
est8 <- 20 * 6.5 / 4
cat("estadistico:", est8, " valor critico:", round(qchisq(0.95, 20), 3),
    " valor-p:", round(1 - pchisq(est8, 20), 4),
    " potencia en sigma^2 = 8:", round(1 - pchisq(qchisq(0.95, 20) * 4 / 8, 20), 4), "\n")
cat("\n--- Ej. 6.4.9: n = 250000, sigma = 10, xbar = 0.05\n")
z9 <- sqrt(250000) * 0.05 / 10
cat("z =", z9, " valor-p =", round(2 * (1 - pnorm(z9)), 4),
    " IC95 =", 0.05 + c(-1, 1) * 1.96 * 10 / sqrt(250000), "\n")

# --------------------------------------------------------------
# 11. Figura del Ejemplo 6.1.1: distribucion de X bajo p = 0.05,
#     n = 400, con X = 22 y X = 40 marcados y una "zona gris" sin umbral
#     (Figura 6.1). Ejecutar desde Figuras/.
# --------------------------------------------------------------
png("cap6_cartera_zona_gris.png", width = 2200, height = 1200, res = 220)
par(mar = c(4.2, 4.4, 1.2, 1.2))
xs <- 8:44
pr <- dbinom(xs, 400, 0.05)
# color continuo de azul (esperable) a naranja (evidencia en contra), sin umbral
pal <- colorRampPalette(c(AZUL_ITAM, "gray70", NARANJA))(length(xs))
t_col <- pmin(pmax((xs - 20) / 20, 0), 1)
cols <- pal[1 + round(t_col * (length(xs) - 1))]
plot(NA, xlim = c(7, 49), ylim = c(0, 0.115), xlab = "X (número de incumplimientos en n = 400 créditos)",
     ylab = "Probabilidad bajo p = 0.05", cex.lab = 1.05)
rect(xs - 0.45, 0, xs + 0.45, pr, col = cols, border = "white")
# zona gris: banda sin trazo de umbral
rect(27.5, -0.002, 36.5, 0.108, col = adjustcolor("gray50", 0.10), border = NA)
text(32, 0.100, "zona gris:\n¿dónde empieza lo\ndemasiado alto?", cex = 0.95, col = "gray25")
abline(v = 22, lty = 2, lwd = 2, col = "gray30")
text(22.3, 0.090, "X = 22\nno sorprende", pos = 4, cex = 0.9)
abline(v = 40, lty = 2, lwd = 2, col = "gray30")
text(40.3, 0.075, "X = 40\nextraordinario", pos = 4, cex = 0.9)
text(14.5, 0.108, "lo esperable si\nla cartera cumple", cex = 0.95, col = AZUL_ITAM)
text(44.5, 0.108, "evidencia\nen contra", cex = 0.95, col = NARANJA)
dev.off()

# --------------------------------------------------------------
# 12. Figura de la Definicion 6.2.4: alpha y beta(theta_1) sin cifras.
#     Misma H0 y mismo umbral en ambos paneles; solo cambia theta_1
#     (alternativa lejana vs. cercana). Prueba de una cola, H1: theta > theta_0.
#     (Figura 6.2). Ejecutar desde Figuras/.
# --------------------------------------------------------------
png("cap6_alpha_beta_conceptual.png", width = 2400, height = 1100, res = 220)
par(mfrow = c(1, 2), mar = c(4.4, 1.6, 2.4, 1.0))
xg  <- seq(-3.5, 7, length.out = 800)
cr  <- qnorm(0.95)                                # umbral (no se rotula con cifras)
panel_ab <- function(th1, titulo) {
  plot(NA, xlim = c(-3.5, 7), ylim = c(0, 0.62), xaxt = "n", yaxt = "n",
       xlab = "valor que resume la muestra", ylab = "", main = titulo, cex.main = 1.05)
  # beta: area de la curva bajo H1 a la izquierda del umbral
  xb <- xg[xg <= cr]
  polygon(c(xb, rev(xb)), c(dnorm(xb, th1), rep(0, length(xb))),
          col = adjustcolor(NARANJA, 0.45), border = NA)
  # alpha: area de la curva bajo H0 a la derecha del umbral
  xa <- xg[xg >= cr]
  polygon(c(xa, rev(xa)), c(dnorm(xa, 0), rep(0, length(xa))),
          col = adjustcolor(AZUL_ITAM, 0.55), border = NA)
  lines(xg, dnorm(xg, 0),   lwd = 3, col = AZUL_ITAM)
  lines(xg, dnorm(xg, th1), lwd = 3, col = NARANJA)
  abline(v = cr, lty = 2, lwd = 2, col = "gray30")
  axis(1, at = c(0, th1), labels = expression(theta[0], theta[1]), tick = TRUE)
  text(cr - 0.15, 0.58, expression(paste("No rechazar ", H[0])), pos = 2, cex = 0.95)
  text(cr + 0.15, 0.58, expression(paste("Rechazar ", H[0])),    pos = 4, cex = 0.95)
  text(min(0, -0.6), 0.45, expression(paste("Bajo ", H[0], ": ", theta == theta[0])),
       col = AZUL_ITAM, cex = 0.95)
  text(max(th1, 4.4), 0.45, expression(paste("Bajo ", H[1], ": ", theta == theta[1])),
       col = NARANJA, cex = 0.95)
  # etiquetas de las areas
  arrows(cr + 1.3, 0.07, cr + 0.45, 0.012, length = 0.08, col = AZUL_ITAM, lwd = 1.5)
  text(cr + 1.45, 0.085, expression(alpha), col = AZUL_ITAM, cex = 1.3)
}
panel_ab(3.6, expression(paste("(A) ", theta[1], " lejos de ", theta[0])))
arrows(1.5, 0.185, 1.3, 0.012, length = 0.08, col = NARANJA, lwd = 1.5)
text(1.5, 0.21, expression(beta), col = NARANJA, cex = 1.3)
panel_ab(1.8, expression(paste("(B) ", theta[1], " cerca de ", theta[0])))
text(1.0, 0.09, expression(beta), col = NARANJA, cex = 1.3)
dev.off()

# --------------------------------------------------------------
# 13. Figura de la Tabla 6.3: regiones de rechazo de la prueba Z
#     en los tres tipos de alternativa (alpha = 0.05).
#     Misma distribucion nula N(0,1) en los tres paneles; solo cambia
#     donde se coloca la probabilidad alpha. (Figura 6.3).
#     Ejecutar desde Figuras/.
# --------------------------------------------------------------
png("cap6_regiones_rechazo.png", width = 2100, height = 860, res = 180)
par(mfrow = c(1, 3), mar = c(4.6, 0.8, 4.4, 0.8), oma = c(0, 0, 0, 0))
al13 <- 0.05
z1   <- qnorm(1 - al13)        # z_alpha     = 1.645
z2   <- qnorm(1 - al13 / 2)    # z_(alpha/2) = 1.960
xg13 <- seq(-4, 4, length.out = 800)

# Sombrea la densidad N(0,1) entre a y b
sombra13 <- function(a, b, col) {
  x <- xg13[xg13 >= a & xg13 <= b]
  polygon(c(x, rev(x)), c(dnorm(x), rep(0, length(x))), col = col, border = NA)
}
# Lienzo comun: curva, ejes y titulo de dos renglones
lienzo13 <- function(titulo, subtitulo) {
  plot(NA, xlim = c(-4, 4), ylim = c(0, 0.50), xaxt = "n", yaxt = "n",
       xlab = "valor del estadístico Z", ylab = "", main = "")
  axis(1, at = -3:3)
  mtext(titulo,    side = 3, line = 2.6, cex = 0.95, font = 2)
  mtext(subtitulo, side = 3, line = 1.5, cex = 0.85, col = "gray30")
}
gris13 <- adjustcolor("gray60", 0.25)
azul13 <- adjustcolor(AZUL_ITAM, 0.60)

# (A) H1: theta > theta_0  (una cola, derecha)
lienzo13(expression(paste("(A) ", H[1], ": ", theta > theta[0])), "una cola, derecha")
sombra13(-4, z1, gris13); sombra13(z1, 4, azul13)
lines(xg13, dnorm(xg13), lwd = 3, col = AZUL_ITAM)
abline(v = z1, lty = 2, lwd = 2, col = "gray30")
text(z1 - 0.15, 0.47, expression(paste("No rechazar ", H[0])), pos = 2, cex = 0.8)
text(z1 + 0.15, 0.47, expression(paste("Rechazar ", H[0])),    pos = 4, cex = 0.8)
text(z1 + 0.12, 0.415, expression(z[0.05] == "1.645"), pos = 4, cex = 0.85, col = "gray20")
text(-0.1, 0.17, expression(paste(1 - alpha == 0.95)), cex = 1.0, col = "gray30")
arrows(z1 + 1.35, 0.11, z1 + 0.45, 0.012, length = 0.08, col = AZUL_ITAM, lwd = 1.5)
text(z1 + 1.35, 0.135, expression(alpha == 0.05), col = AZUL_ITAM, cex = 0.95)

# (B) H1: theta < theta_0  (una cola, izquierda)
lienzo13(expression(paste("(B) ", H[1], ": ", theta < theta[0])), "una cola, izquierda")
sombra13(-z1, 4, gris13); sombra13(-4, -z1, azul13)
lines(xg13, dnorm(xg13), lwd = 3, col = AZUL_ITAM)
abline(v = -z1, lty = 2, lwd = 2, col = "gray30")
text(-z1 - 0.15, 0.47, expression(paste("Rechazar ", H[0])),    pos = 2, cex = 0.8)
text(-z1 + 0.15, 0.47, expression(paste("No rechazar ", H[0])), pos = 4, cex = 0.8)
text(-z1 - 0.12, 0.415, expression(paste("−", z[0.05], " = −1.645")), pos = 2, cex = 0.85, col = "gray20")
text(0.1, 0.17, expression(paste(1 - alpha == 0.95)), cex = 1.0, col = "gray30")
arrows(-z1 - 1.35, 0.11, -z1 - 0.45, 0.012, length = 0.08, col = AZUL_ITAM, lwd = 1.5)
text(-z1 - 1.35, 0.135, expression(alpha == 0.05), col = AZUL_ITAM, cex = 0.95)

# (C) H1: theta != theta_0  (dos colas)
lienzo13(expression(paste("(C) ", H[1], ": ", theta != theta[0])), "dos colas")
sombra13(-z2, z2, gris13); sombra13(-4, -z2, azul13); sombra13(z2, 4, azul13)
lines(xg13, dnorm(xg13), lwd = 3, col = AZUL_ITAM)
abline(v = c(-z2, z2), lty = 2, lwd = 2, col = "gray30")
text(-z2 - 0.1, 0.47, expression(paste("Rechazar ", H[0])), pos = 2, cex = 0.8)
text(z2 + 0.1,  0.47, expression(paste("Rechazar ", H[0])), pos = 4, cex = 0.8)
text(0, 0.47, expression(paste("No rechazar ", H[0])), cex = 0.8)
text(-z2 - 0.12, 0.415, expression(paste("−", z[0.025], " = −1.960")), pos = 2, cex = 0.85, col = "gray20")
text( z2 + 0.12, 0.415, expression(z[0.025] == "1.960"), pos = 4, cex = 0.85, col = "gray20")
text(0, 0.17, expression(paste(1 - alpha == 0.95)), cex = 1.0, col = "gray30")
arrows(z2 + 1.1, 0.11, z2 + 0.4, 0.008, length = 0.08, col = AZUL_ITAM, lwd = 1.5)
text(z2 + 1.1, 0.135, expression(alpha / 2 == 0.025), col = AZUL_ITAM, cex = 0.9)
arrows(-z2 - 1.1, 0.11, -z2 - 0.4, 0.008, length = 0.08, col = AZUL_ITAM, lwd = 1.5)
text(-z2 - 1.1, 0.135, expression(alpha / 2 == 0.025), col = AZUL_ITAM, cex = 0.9)
dev.off()
