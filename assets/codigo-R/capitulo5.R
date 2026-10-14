# ==============================================================
# Capítulo 5 - Estimación por Intervalos
# Inferencia Estadística, EST-11102, ITAM
# ==============================================================

# --------------------------------------------------------------
# 1. Interpretación frecuentista de un intervalo de confianza
#    (Observación 5.1). Simulamos B = 100 muestras de una
#    N(mu, sigma^2), construimos el IC al 95% para mu en cada una,
#    y contamos qué fracción de los intervalos capturan al
#    verdadero mu.
# --------------------------------------------------------------
set.seed(101)

mu_pob    <- 0.01     # rendimiento medio poblacional (1%)
sigma_pob <- 0.04      # desviación estándar poblacional (4%)
n         <- 30
B         <- 100        # número de muestras simuladas
alpha     <- 0.05
z_c       <- qnorm(1 - alpha / 2)

limites <- t(replicate(B, {
  x <- rnorm(n, mean = mu_pob, sd = sigma_pob)
  xbar <- mean(x)
  s    <- sd(x)
  margen <- z_c * s / sqrt(n)
  c(inferior = xbar - margen, superior = xbar + margen)
}))

cubre <- limites[, "inferior"] <= mu_pob & mu_pob <= limites[, "superior"]
cat("Fracción de intervalos que capturan a mu =", mu_pob, ":\n")
cat(round(mean(cubre), 3), "  (esperado, aproximadamente, 0.95)\n\n")

# Gráfico al estilo de una "forest plot": cada línea horizontal es
# un intervalo; la línea vertical roja es el verdadero mu.
plot(NULL, xlim = range(limites), ylim = c(1, B),
     xlab = expression(mu), ylab = "Muestra simulada",
     main = "Cobertura de 100 intervalos de confianza al 95% para la media")
abline(v = mu_pob, col = "red", lwd = 2)
for (i in 1:B) {
  color <- if (cubre[i]) "steelblue" else "black"
  segments(limites[i, "inferior"], i, limites[i, "superior"], i, col = color)
}
legend("topright", legend = c("Cubre a mu", "No cubre a mu"),
       col = c("steelblue", "black"), lty = 1, bty = "n", cex = 0.8)


# --------------------------------------------------------------
# 2. IC con muestras grandes: media y proporción
#    (Secciones 5.2.1 y 5.2.2)
# --------------------------------------------------------------

# --- Media: reclamaciones de seguros (Ejemplo 5.x) ---
n_rec    <- 225
xbar_rec <- 8690
s_rec    <- 11800
alpha    <- 0.05
z_c      <- qnorm(1 - alpha / 2)

margen_media <- z_c * s_rec / sqrt(n_rec)
ic_media <- c(xbar_rec - margen_media, xbar_rec + margen_media)
cat("IC 95% para el monto medio de reclamación:\n")
cat("(", round(ic_media[1], 1), ",", round(ic_media[2], 1), ")\n\n")

# --- Proporción: tasa de incumplimiento de una cartera ---
n_cartera <- 400
x_incumplen <- 28
p_hat <- x_incumplen / n_cartera

# Condición de validez de la aproximación normal
validez <- c(n_cartera * p_hat, n_cartera * (1 - p_hat))
cat("Condición de validez (ambos deben ser > 5):", validez, "\n")

margen_prop <- z_c * sqrt(p_hat * (1 - p_hat) / n_cartera)
ic_prop <- c(p_hat - margen_prop, p_hat + margen_prop)
cat("IC 95% para la tasa de incumplimiento:\n")
cat("(", round(ic_prop[1], 4), ",", round(ic_prop[2], 4), ")\n\n")

# Verificación con la función prop.test() de R (usa una corrección
# por continuidad ligeramente distinta; los resultados son cercanos
# pero no idénticos a la fórmula "a mano")
print(prop.test(x_incumplen, n_cartera, correct = FALSE))


# --------------------------------------------------------------
# 3. Determinación del tamaño de muestra (Sección 5.3)
# --------------------------------------------------------------

n_para_media <- function(sigma, B, alpha = 0.05) {
  z_c <- qnorm(1 - alpha / 2)
  ceiling((z_c^2 * sigma^2) / B^2)
}

n_para_proporcion <- function(p = 0.5, B, alpha = 0.05) {
  z_c <- qnorm(1 - alpha / 2)
  ceiling((z_c^2 * p * (1 - p)) / B^2)
}

# Ejemplo 5.x: severidad de pérdida (LGD)
cat("Tamaño de muestra para LGD, B = 2000, sigma = 9500, 95%:\n")
cat(n_para_media(sigma = 9500, B = 2000, alpha = 0.05), "\n\n")

# Ejemplo 5.x: encuesta de inversión empresarial
cat("Tamaño de muestra para proporción, B = 0.05, 90%:\n")
cat("  con p piloto = 0.35:",
    n_para_proporcion(p = 0.35, B = 0.05, alpha = 0.10), "\n")
cat("  cota conservadora p = 0.50:",
    n_para_proporcion(p = 0.50, B = 0.05, alpha = 0.10), "\n\n")


# --------------------------------------------------------------
# 4. IC exactos bajo normalidad: media (varianza conocida y
#    desconocida) y varianza (Sección 5.4)
# --------------------------------------------------------------
set.seed(202)

# Simulamos una muestra pequeña de rendimientos mensuales de una
# acción, supuestos normales
n_acc  <- 10
mu_sim <- 0.012
sd_sim <- 0.035
rend   <- rnorm(n_acc, mean = mu_sim, sd = sd_sim)

xbar <- mean(rend)
s    <- sd(rend)
alpha <- 0.10

# --- Caso 1: varianza conocida (se supone sigma = 0.035) ---
sigma_conocida <- 0.035
z_c <- qnorm(1 - alpha / 2)
ic_media_conocida <- xbar + c(-1, 1) * z_c * sigma_conocida / sqrt(n_acc)
cat("IC 90% para la media, sigma conocida:\n")
cat("(", round(ic_media_conocida[1], 4), ",", round(ic_media_conocida[2], 4), ")\n\n")

# --- Caso 2: varianza desconocida (distribución t) ---
t_c <- qt(1 - alpha / 2, df = n_acc - 1)
ic_media_desconocida <- xbar + c(-1, 1) * t_c * s / sqrt(n_acc)
cat("IC 90% para la media, sigma desconocida (a mano):\n")
cat("(", round(ic_media_desconocida[1], 4), ",", round(ic_media_desconocida[2], 4), ")\n\n")

# Verificación: t.test() de R da exactamente el mismo intervalo
print(t.test(rend, conf.level = 1 - alpha)$conf.int)

# --- Caso 3: IC para la varianza (chi-cuadrada) ---
chi2_inf <- qchisq(1 - alpha / 2, df = n_acc - 1)  # cuantil superior (cola derecha chica)
chi2_sup <- qchisq(alpha / 2, df = n_acc - 1)       # cuantil inferior (cola derecha grande)
ic_varianza <- c((n_acc - 1) * s^2 / chi2_inf, (n_acc - 1) * s^2 / chi2_sup)
cat("IC 90% para la varianza de los rendimientos:\n")
cat("(", round(ic_varianza[1], 6), ",", round(ic_varianza[2], 6), ")\n")
cat("IC 90% para la volatilidad (raíz cuadrada):\n")
cat("(", round(sqrt(ic_varianza[1]), 4), ",", round(sqrt(ic_varianza[2]), 4), ")\n\n")


# --------------------------------------------------------------
# 5. IC para diferencia de proporciones (Sección 5.2.3)
# --------------------------------------------------------------

# Ejemplo 5.2.4: tasas de incumplimiento por sector
n1 <- 51902L; p1_hat <- 0.02587   # sector eléctrico-electrónico
n2 <-  8302L; p2_hat <- 0.02854   # sector automotriz

# Verificación de condiciones de validez
cat("Condiciones de validez (todas deben ser > 5):\n")
cat("  n1*p1_hat =", n1 * p1_hat, "\n")
cat("  n1*(1-p1_hat) =", n1 * (1 - p1_hat), "\n")
cat("  n2*p2_hat =", n2 * p2_hat, "\n")
cat("  n2*(1-p2_hat) =", n2 * (1 - p2_hat), "\n\n")

alpha  <- 0.05
z_c    <- qnorm(1 - alpha / 2)
ee_dif_prop <- sqrt(p1_hat * (1 - p1_hat) / n1 + p2_hat * (1 - p2_hat) / n2)
ic_dif_prop <- (p1_hat - p2_hat) + c(-1, 1) * z_c * ee_dif_prop
cat("IC 95% para p1 - p2 (electrónico - automotriz):\n")
cat("(", round(ic_dif_prop[1], 5), ",", round(ic_dif_prop[2], 5), ")\n\n")

# --------------------------------------------------------------
# 6. IC para diferencia de medias, dos muestras (Sección 5.4.4-5.4.5)
# --------------------------------------------------------------

# Ejemplo 5.4.4: diferencia salarial Tijuana vs Ciudad Juárez
n_tj <- 40L; xbar_tj <- 5.35; s_tj <- 1.52
n_cj <- 40L; xbar_cj <- 4.31; s_cj <- 1.10
alpha <- 0.05

# Varianza agrupada (pooled)
sp2 <- ((n_tj - 1) * s_tj^2 + (n_cj - 1) * s_cj^2) / (n_tj + n_cj - 2)
sp  <- sqrt(sp2)
gl  <- n_tj + n_cj - 2
t_c <- qt(1 - alpha / 2, df = gl)

margen_dif <- t_c * sp * sqrt(1 / n_tj + 1 / n_cj)
ic_dif_med <- (xbar_tj - xbar_cj) + c(-1, 1) * margen_dif

cat("Varianza agrupada s_p^2 =", round(sp2, 4), ", s_p =", round(sp, 4), "\n")
cat("Grados de libertad:", gl, " | Cuantil t:", round(t_c, 3), "\n")
cat("IC 95% para mu_Tijuana - mu_CiudadJuarez:\n")
cat("(", round(ic_dif_med[1], 3), ",", round(ic_dif_med[2], 3), ") pesos/hora\n\n")

# Verificación con t.test()
# (simulamos los datos a partir de los resúmenes para que t.test() corra)
set.seed(303)
x_tj <- rnorm(n_tj, mean = xbar_tj, sd = s_tj)
x_cj <- rnorm(n_cj, mean = xbar_cj, sd = s_cj)
cat("Verificación aproximada con t.test() (datos simulados, var.equal=TRUE):\n")
print(t.test(x_tj, x_cj, var.equal = TRUE, conf.level = 0.95)$conf.int)
cat("(Los extremos diferirán levemente por la simulación aleatoria)\n\n")

# --------------------------------------------------------------
# 7. IC para el cociente de varianzas (Sección 5.4.6)
# --------------------------------------------------------------

# Ejemplo 5.4.6: cociente de volatilidades de dos tipos de cambio
n_A <- 20L; s2_A <- 0.000324
n_B <- 20L; s2_B <- 0.000900
alpha <- 0.10

# Cuantiles de la distribución F
gl1 <- n_A - 1   # grados de libertad numerador
gl2 <- n_B - 1   # grados de libertad denominador
F_sup <- qf(1 - alpha / 2, df1 = gl1, df2 = gl2)   # cuantil superior alpha/2
F_inf <- qf(    alpha / 2, df1 = gl1, df2 = gl2)   # cuantil inferior alpha/2

ic_cociente <- c((s2_A / s2_B) * F_inf,
                 (s2_A / s2_B) * F_sup)

cat("IC 90% para sigma_A^2 / sigma_B^2:\n")
cat("  F_{19,19,0.05} =", round(F_sup, 3), "\n")
cat("  F_{19,19,0.95} =", round(F_inf, 3), "\n")
cat("  Cociente s_A^2 / s_B^2 =", round(s2_A / s2_B, 4), "\n")
cat("  Intervalo: (", round(ic_cociente[1], 4), ",",
    round(ic_cociente[2], 4), ")\n\n")

# IC para el cociente de desviaciones estándar
cat("IC 90% para sigma_A / sigma_B (raíz cuadrada de los extremos):\n")
cat("  (", round(sqrt(ic_cociente[1]), 4), ",",
    round(sqrt(ic_cociente[2]), 4), ")\n\n")

# Verificación con var.test()
set.seed(404)
y_A <- rnorm(n_A, mean = 0, sd = sqrt(s2_A))
y_B <- rnorm(n_B, mean = 0, sd = sqrt(s2_B))
cat("Verificación aproximada con var.test() (datos simulados):\n")
print(var.test(y_A, y_B, conf.level = 0.90)$conf.int)
cat("(Los extremos diferirán levemente por la simulación aleatoria)\n\n")

# --------------------------------------------------------------
# 8. El intervalo se angosta conforme crece n
#    (ilustración gráfica de sqrt(n) en el denominador)
# --------------------------------------------------------------
tamanos_n <- seq(5, 200, by = 5)
s_fijo    <- 0.04
z_c       <- qnorm(0.975)

anchos <- 2 * z_c * s_fijo / sqrt(tamanos_n)

plot(tamanos_n, anchos, type = "l", lwd = 2, col = "darkgreen",
     xlab = "Tamaño de muestra n", ylab = "Ancho del intervalo de confianza",
     main = "Ancho del IC al 95% para la media en función de n")
grid()
