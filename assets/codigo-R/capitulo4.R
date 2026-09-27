# ==============================================================
# Capítulo 4 - Estimación puntual, convergencia y máxima verosimilitud
# Inferencia Estadística, EST-11102, ITAM
# ==============================================================

# Si este script se ejecuta en un entorno con locale POSIX/C (sin
# UTF-8), los acentos en las etiquetas de las figuras (p. ej.
# "distribución", "cuadrática") se corrompen al renderizar. Este
# intento silencioso de fijar un locale UTF-8 evita ese problema; si
# el locale no está disponible en el sistema, no interrumpe el script.
try(Sys.setlocale("LC_CTYPE", "C.UTF-8"), silent = TRUE)

# --------------------------------------------------------------
# 1. Figura: sesgo vs. varianza (Sección 4.2, Figura cap4_sesgo_varianza)
#    Distribuciones EXACTAS (no simuladas) de S^2 y sigma_hat^2 para el
#    Ejemplo 4.2.1 (n=5, sigma^2=100), usando (n-1)S^2/sigma^2 ~ chi^2_(n-1).
# --------------------------------------------------------------
n_fig <- 5
sigma2_fig <- 100
df_fig <- n_fig - 1

# S^2 = (sigma^2/(n-1)) * W, W ~ chi2_(n-1)  =>  densidad de S^2 en s:
dS2 <- function(s) dchisq((df_fig / sigma2_fig) * s, df = df_fig) * (df_fig / sigma2_fig)
# sigma_hat^2 = (sigma^2/n) * W  =>  densidad de sigma_hat^2 en t:
dSigmaHat2 <- function(t) dchisq((n_fig / sigma2_fig) * t, df = df_fig) * (n_fig / sigma2_fig)

x_fig <- seq(0.1, 340, length.out = 1000)
AZUL_ITAM  <- "#003366"
VERDE_ITAM <- "#00783C"
NARANJA    <- "#B5651D"

png("cap4_sesgo_varianza.png", width = 2200, height = 1500, res = 220)
par(mar = c(4.2, 4.2, 1.5, 1.5))
yS2 <- dS2(x_fig); ySigmaHat2 <- dSigmaHat2(x_fig)
ymax_fig <- max(yS2, ySigmaHat2) * 1.15
plot(x_fig, yS2, type = "l", col = VERDE_ITAM, lwd = 3,
     xlab = expression(paste("Valor del estimador de  ", sigma^2)),
     ylab = "Densidad", ylim = c(0, ymax_fig), xlim = c(0, 340),
     cex.lab = 1.15, cex.axis = 1.05)
lines(x_fig, ySigmaHat2, col = NARANJA, lwd = 3)
abline(v = sigma2_fig, col = VERDE_ITAM, lwd = 2, lty = 1)
abline(v = (df_fig / n_fig) * sigma2_fig, col = NARANJA, lwd = 2, lty = 2)
y_bracket <- ymax_fig * 0.92
arrows(x0 = (df_fig / n_fig) * sigma2_fig, y0 = y_bracket, x1 = sigma2_fig, y1 = y_bracket,
       length = 0.08, angle = 20, code = 3, col = "gray30", lwd = 1.6)
text(x = mean(c((df_fig / n_fig) * sigma2_fig, sigma2_fig)), y = y_bracket * 1.045,
     labels = "Sesgo", col = "gray20", cex = 1.05)
legend("topright",
       legend = c(expression(S^2 ~ "(insesgado)"), expression(hat(sigma)^2 ~ "(sesgado)"),
                  expression(sigma^2 ~ "verdadera (100)"), expression(E(hat(sigma)^2) ~ "= 80")),
       col = c(VERDE_ITAM, NARANJA, VERDE_ITAM, NARANJA),
       lwd = c(3, 3, 2, 2), lty = c(1, 1, 1, 2), bty = "n", cex = 0.95, seg.len = 2.2)
dev.off()
cat("Figura exportada: cap4_sesgo_varianza.png\n")

# --------------------------------------------------------------
# 1b. Figura: sesgo y precisión (Sección 4.2, Figura cap4_sesgo_precision)
#     Cuadricula 2x2: sesgado/insesgado x preciso/impreciso.
#     Convencion visual: un "x" fuera del recuadro (la region alrededor
#     de theta) representa una estimacion sesgada; dentro del recuadro,
#     una estimacion insesgada. La dispersion de los puntos (compactos
#     vs. dispersos) representa la precision.
# --------------------------------------------------------------
set.seed(123)
box_half <- 1.3

gen_points <- function(n, cx, cy, sd, inside) {
  pts <- matrix(NA_real_, nrow = n, ncol = 2)
  for (i in 1:n) {
    repeat {
      x <- rnorm(1, cx, sd); y <- rnorm(1, cy, sd)
      es_dentro <- (abs(x) <= box_half) && (abs(y) <= box_half)
      if (inside == es_dentro) { pts[i, ] <- c(x, y); break }
    }
  }
  pts
}

pa <- gen_points(9, cx = 2.1, cy = 2.1, sd = 0.8,  inside = FALSE) # (a) sesgado, poco preciso
pb <- gen_points(9, cx = 2.1, cy = 2.1, sd = 0.15, inside = FALSE) # (b) sesgado, preciso
pc <- gen_points(9, cx = 0,   cy = 0,   sd = 0.8,  inside = TRUE)  # (c) insesgado, poco preciso
pd <- gen_points(9, cx = 0,   cy = 0,   sd = 0.15, inside = TRUE)  # (d) insesgado, preciso

dibujar_panel <- function(pts, etiqueta) {
  plot(NA, xlim = c(-1.9, 3.5), ylim = c(-1.9, 3.5), asp = 1,
       axes = FALSE, xlab = "", ylab = "")
  rect(-box_half, -box_half, box_half, box_half, border = "gray30", lwd = 1.3)
  points(pts[, 1], pts[, 2], pch = 4, cex = 1.6, lwd = 2, col = AZUL_ITAM)
  points(0, 0, pch = 19, cex = 1.1)
  text(0.35, 0.05, expression(theta), cex = 1.3)
  mtext(etiqueta, side = 1, line = 0.5, cex = 1.1, font = 2)
}

png("cap4_sesgo_precision.png", width = 2000, height = 1750, res = 220)
par(mfrow = c(2, 2), mar = c(2, 0.3, 0.3, 0.3), oma = c(0, 0, 0, 0))
dibujar_panel(pa, "(a) Sesgado, poco preciso")
dibujar_panel(pb, "(b) Sesgado, preciso")
dibujar_panel(pc, "(c) Insesgado, poco preciso")
dibujar_panel(pd, "(d) Insesgado, preciso")
dev.off()
cat("Figura exportada: cap4_sesgo_precision.png\n")

# --------------------------------------------------------------
# 1c. Figura: jerarquía de los modos de convergencia (Sección 4.4,
#     Figura cap4_jerarquia_convergencia, Teorema 4.4.1). Elipses
#     anidadas: distribución (más externa) > probabilidad > {casi
#     segura, media} (no anidadas entre sí) > media cuadrática (dentro
#     de media). Inspirado en el diagrama de Rincón (2007), redibujado
#     con estilo y paleta propios.
# --------------------------------------------------------------
draw_ellipse <- function(cx, cy, rx, ry, col, border = "gray30", lwd = 1.4, n = 300) {
  theta <- seq(0, 2 * pi, length.out = n)
  polygon(cx + rx * cos(theta), cy + ry * sin(theta),
          col = col, border = border, lwd = lwd)
}

# Paleta: tonos del azul ITAM, de más claro (externo) a más oscuro (interno)
pal_jer <- colorRampPalette(c("#EAF1F8", AZUL_ITAM))(5)

png("cap4_jerarquia_convergencia.png", width = 2400, height = 1500, res = 220, type = "cairo")
par(mar = c(0.5, 0.5, 0.5, 0.5))
plot(NA, xlim = c(-8, 8), ylim = c(-4.3, 4.3), asp = 1,
     axes = FALSE, xlab = "", ylab = "")

draw_ellipse(0, -0.1, 7.2, 4.0, col = pal_jer[1])                 # distribución
draw_ellipse(0, -0.2, 6.1, 3.2, col = pal_jer[2])                 # probabilidad
draw_ellipse(-2.6, 0.1, 2.3, 2.35, col = pal_jer[3])              # casi segura
draw_ellipse(2.3, 0.1, 2.85, 2.45, col = pal_jer[3])              # media
draw_ellipse(2.85, 0.1, 1.45, 1.45, col = pal_jer[5])             # media cuadrática

text(-2.6, 0.55, "Convergencia\ncasi segura", cex = 1.15, font = 2)
text(2.85, 0.15, "Conv. en\nmedia\ncuadrática", cex = 1.0, font = 2, col = "white")
text(1.55, -1.75, "Conv. en media", cex = 1.1, font = 2)
text(0, -2.75, "Convergencia en probabilidad", cex = 1.25, font = 2)
text(0, -3.75, "Convergencia en distribución", cex = 1.3, font = 2)

dev.off()
cat("Figura exportada: cap4_jerarquia_convergencia.png\n")

# --------------------------------------------------------------
# 2. Verificación del Teorema Central del Límite (Sección 4.7)
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
    "aumenta n: el contenido del Teorema Central del Límite.\n")

# --------------------------------------------------------------
# 2b. Figura: densidad exacta vs. asintótica de Xbar_n, n chico
#     (Sección 4.7, Figura cap4_exacta_vs_asintotica). Población
#     exponencial(lambda), mismos parámetros que arriba. Inspirado en
#     el Gráfico 4.5 de Greene, redibujado con estilo propio.
# --------------------------------------------------------------
n_fig2 <- 10

# Densidad EXACTA de Xbar_n: para una exponencial(lambda), la suma de n
# observaciones es Gamma(forma=n, tasa=lambda), asi que Xbar_n es
# Gamma(forma=n, tasa=n*lambda).
dens_exacta_fig2 <- function(x) dgamma(x, shape = n_fig2, rate = n_fig2 * lambda_pob)
# Densidad ASINTOTICA que predice el TCL: N(mu, sigma^2/n)
dens_asint_fig2 <- function(x) dnorm(x, mean = mu_pob, sd = sigma_pob / sqrt(n_fig2))

x_fig2 <- seq(500, 20000, length.out = 500)

png("cap4_exacta_vs_asintotica.png", width = 2200, height = 1500, res = 220, type = "cairo")
par(mar = c(4.2, 4.5, 2.5, 1))
plot(x_fig2, dens_exacta_fig2(x_fig2), type = "l", lwd = 2.8, col = AZUL_ITAM,
     xlab = "Monto promedio de reclamación", ylab = "Densidad",
     main = bquote("Distribución de " * bar(X)[n] * ": exacta vs. asintótica (n = " * .(n_fig2) * ")"))
lines(x_fig2, dens_asint_fig2(x_fig2), lwd = 2.8, col = NARANJA, lty = 2)
legend("topright", legend = c("Exacta (Gamma)", "Asintótica (Normal, TCL)"),
       col = c(AZUL_ITAM, NARANJA), lwd = 2.8, lty = c(1, 2), bty = "n", cex = 1.05)
dev.off()
cat("Figura exportada: cap4_exacta_vs_asintotica.png\n")


# --------------------------------------------------------------
# 3. Consistencia: la varianza del estimador decrece con n
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
# 4. Máxima verosimilitud: forma cerrada y optimización numérica
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
# 5. Normalidad asintótica del EMV (Teorema 4.9, Sección 4.9)
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

# --------------------------------------------------------------
# 6. Figura: tasas de convergencia de la media y la mediana
#    (Sección 4.7, Ejemplo de eficiencia asintótica media vs.
#    mediana, Figura cap4_tasa_media_mediana). Población N(0,1):
#    sd(media)=1/sqrt(n), sd(mediana)=sqrt(pi/2)/sqrt(n).
# --------------------------------------------------------------
n_vals <- seq(2, 100, by = 1)
sd_media   <- 1 / sqrt(n_vals)
sd_mediana <- sqrt(pi / 2) / sqrt(n_vals)

png("cap4_tasa_media_mediana.png", width = 2200, height = 1500, res = 220, type = "cairo")
par(mar = c(4.2, 4.5, 2.5, 1))
plot(n_vals, sd_media, type = "l", lwd = 2.8, col = AZUL_ITAM,
     ylim = c(0, max(sd_mediana)),
     xlab = "Tamaño de muestra n",
     ylab = "Desviación estándar asintótica",
     main = "Eficiencia asintótica: media vs. mediana (población N(0,1))")
lines(n_vals, sd_mediana, lwd = 2.8, col = NARANJA, lty = 2)
legend("topright", legend = c(expression(sd(bar(X)[n]) == 1/sqrt(n)),
                               expression(sd(M[n]) == sqrt(pi/2)/sqrt(n))),
       col = c(AZUL_ITAM, NARANJA), lwd = 2.8, lty = c(1, 2), bty = "n", cex = 1.05)
dev.off()
cat("Figura exportada: cap4_tasa_media_mediana.png\n")

# --------------------------------------------------------------
# 7. Figura: superficie de la log-verosimilitud de una normal
#    (Sección 4.9, Ejemplo de invarianza, Figura
#    cap4_superficie_verosimilitud). Muestra pequeña de
#    rendimientos diarios (%) de un activo.
# --------------------------------------------------------------
y_ll <- c(1.2, -0.8, 0.5, 0.1, -0.3, 0.9)
t_ll <- length(y_ll)
mu_mle_ll   <- mean(y_ll)
sig2_mle_ll <- mean((y_ll - mu_mle_ll)^2)
cat("\nEMV normal (rendimientos de ejemplo): mu_hat =", round(mu_mle_ll, 4),
    " sigma2_hat =", round(sig2_mle_ll, 4), "\n")

mu_grid   <- seq(mu_mle_ll - 1, mu_mle_ll + 1, length.out = 60)
sig2_grid <- seq(max(0.02, sig2_mle_ll - 0.35), sig2_mle_ll + 0.6, length.out = 60)
lnL <- outer(mu_grid, sig2_grid, Vectorize(function(mu, s2) {
  -0.5 * t_ll * log(2 * pi) - 0.5 * t_ll * log(s2) - sum((y_ll - mu)^2) / (2 * s2)
}))

png("cap4_superficie_verosimilitud.png", width = 2200, height = 1900, res = 220, type = "cairo")
par(mar = c(1, 1, 2, 1))
# Color de cada panel segun su altura promedio (paleta azul-ITAM -> naranja),
# para que el pico (el EMV) resalte con claridad.
nrz <- nrow(lnL); ncz <- ncol(lnL)
alturas_panel <- (lnL[-1, -1] + lnL[-1, -ncz] + lnL[-nrz, -1] + lnL[-nrz, -ncz]) / 4
paleta <- colorRampPalette(c(AZUL_ITAM, "#6E9BB8", NARANJA))(100)
rango <- range(alturas_panel)
idx_color <- 1 + round(99 * (alturas_panel - rango[1]) / diff(rango))
colores_panel <- paleta[idx_color]

res_persp <- persp(mu_grid, sig2_grid, lnL,
      theta = 35, phi = 25, expand = 0.65, ticktype = "detailed",
      col = colores_panel, border = NA, shade = 0.25,
      xlab = "mu", ylab = "sigma^2", zlab = "log L(mu, sigma^2)",
      main = "Superficie de la log-verosimilitud normal")
punto_mle <- trans3d(mu_mle_ll, sig2_mle_ll, max(lnL) + 0.5, res_persp)
points(punto_mle, pch = 19, col = "black", cex = 1.3)
text(punto_mle$x, punto_mle$y - 0.02, labels = "EMV", pos = 3, cex = 1.0)
dev.off()
cat("Figura exportada: cap4_superficie_verosimilitud.png\n")

# --------------------------------------------------------------
# 8. Verificación numérica: MCO y EMV coinciden bajo normalidad
#    (Sección 4.5, Ejemplo de consistencia de MCO). Se estima el
#    mismo modelo de dos formas: minimizando la suma de cuadrados
#    (MCO, vía optim) y maximizando la log-verosimilitud normal
#    (EMV, vía optim), y se comparan contra los valores verdaderos.
# --------------------------------------------------------------
set.seed(666)
Tn <- 2000
x_ols <- rnorm(Tn, 0, 1)
u_ols <- rnorm(Tn, 0, 1)
y_ols <- 1 + 5.5 * x_ols + u_ols

rss <- function(beta) sum((beta[1] + beta[2] * x_ols - y_ols)^2)
ajuste_mco <- optim(par = c(0, 0), fn = rss)

neg_log_verosim <- function(par) {
  beta0 <- par[1]; beta1 <- par[2]; sigma <- par[3]
  -sum(dnorm(y_ols, mean = beta0 + beta1 * x_ols, sd = sigma, log = TRUE))
}
ajuste_emv <- optim(par = c(0, 0, 1), fn = neg_log_verosim,
                     method = "L-BFGS-B", lower = c(-Inf, -Inf, 0.01))

cat("\n--- Verificación: MCO y EMV bajo normalidad (n = 2000, beta verdadero = (1, 5.5)) ---\n")
cat("MCO  (optim, minimiza RSS):        beta0 =", round(ajuste_mco$par[1], 4),
    " beta1 =", round(ajuste_mco$par[2], 4), "\n")
cat("EMV  (optim, maximiza log L):      beta0 =", round(ajuste_emv$par[1], 4),
    " beta1 =", round(ajuste_emv$par[2], 4),
    " sigma_hat =", round(ajuste_emv$par[3], 4), "\n")
cat("Ambos coinciden (hasta el error numérico de optim): bajo normalidad,",
    "el EMV de (beta0, beta1) es exactamente el estimador de MCO.\n")

# --------------------------------------------------------------
# 9. Verificación por simulación: error estándar delta-method del
#    Sharpe ratio (Sección 4.8, Ejemplo del Sharpe ratio). Se
#    simulan muchas muestras, se calcula theta_hat = Xbar/S en cada
#    una, y se compara la desviación estándar empírica de theta_hat
#    contra la fórmula delta-method evaluada en el theta verdadero.
# --------------------------------------------------------------
set.seed(2024)
mu_sr <- 0.05; sigma_sr <- 0.10; n_sr <- 172; B_sr <- 5000
theta_sr <- mu_sr / sigma_sr

theta_hats <- replicate(B_sr, {
  muestra <- rnorm(n_sr, mean = mu_sr, sd = sigma_sr)
  mean(muestra) / sd(muestra)
})

ee_delta_teorico   <- sqrt((1 + theta_sr^2 / 2) / n_sr)
ee_empirico        <- sd(theta_hats)

cat("\n--- Verificación: error estándar delta-method del Sharpe ratio ---\n")
cat("theta verdadero (mu/sigma):", round(theta_sr, 4), "\n")
cat("ee delta-method teórico:   ", round(ee_delta_teorico, 4), "\n")
cat("ee empírico (", B_sr, "réplicas, n =", n_sr, "):", round(ee_empirico, 4), "\n")
cat("La cercanía entre ambos confirma numéricamente la fórmula del",
    "Ejemplo del Sharpe ratio (Método Delta, Sección 4.8).\n")

