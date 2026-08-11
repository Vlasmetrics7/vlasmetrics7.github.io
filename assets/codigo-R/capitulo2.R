# ==============================================================
# Inferencia Estadistica - EST-11102, ITAM
# Capitulo 2: Estadistica Descriptiva
# Codigo correspondiente al Apendice A2.1 del capitulo
#
# Las figuras "Ejemplo 2.2.1" y "Ejemplo 2.2.2" de este script se
# exportan como PNG y se incluyen directamente en el capitulo
# (ver Figuras/cap2_ejemplo1_bm.png y Figuras/cap2_ejemplo2_bm.png),
# siguiendo el estilo de tablas y figuras de SR (Salvatore & Reagle,
# cap. 2, Examples 1 y 2).
# ==============================================================

# --------------------------------------------------------------
# 0. Datos reales: clasificacion de paises por nivel de ingreso
#    Fuente: World Bank, "World Bank Country and Lending Groups"
#    https://datahelpdesk.worldbank.org/knowledgebase/articles/906519
#    Vigente para el año fiscal 2026 (GNI per capita 2024, metodo
#    Atlas). Descarga oficial (xlsx):
#    https://datacatalogfiles.worldbank.org/ddh-published/0037712/
#      DR0095333/CLASS_2026_07_15.xlsx
#    216 economias clasificadas (Venezuela y Etiopia quedan sin
#    clasificar este periodo por falta de datos suficientes)
# --------------------------------------------------------------
paises_bajo <- c(
  "Afghanistan", "Burkina Faso", "Burundi", "Central African Republic",
  "Chad", "Congo, Dem. Rep.", "Eritrea", "Gambia, The", "Guinea-Bissau",
  "Korea, Dem. People's Rep.", "Liberia", "Madagascar", "Malawi", "Mali",
  "Mozambique", "Niger", "Rwanda", "Sierra Leone", "Somalia",
  "South Sudan", "Sudan", "Syrian Arab Republic", "Togo", "Uganda",
  "Yemen, Rep."
)

paises_medio_bajo <- c(
  "Angola", "Bangladesh", "Benin", "Bhutan", "Bolivia", "Cambodia",
  "Cameroon", "Comoros", "Congo, Rep.", "Cote d'Ivoire", "Djibouti",
  "Egypt, Arab Rep.", "Eswatini", "Ghana", "Guinea", "Haiti", "Honduras",
  "India", "Jordan", "Kenya", "Kiribati", "Kyrgyz Republic", "Lao PDR",
  "Lebanon", "Lesotho", "Mauritania", "Micronesia, Fed. Sts.", "Morocco",
  "Myanmar", "Namibia", "Nepal", "Nicaragua", "Nigeria", "Pakistan",
  "Papua New Guinea", "Philippines", "Sao Tome and Principe", "Senegal",
  "Solomon Islands", "Sri Lanka", "Tajikistan", "Tanzania", "Timor-Leste",
  "Tunisia", "Uzbekistan", "Vanuatu", "Viet Nam", "West Bank and Gaza",
  "Zambia", "Zimbabwe"
)

paises_medio_alto <- c(
  "Albania", "Algeria", "Argentina", "Armenia", "Azerbaijan", "Belarus",
  "Belize", "Bosnia and Herzegovina", "Botswana", "Brazil", "Cabo Verde",
  "China", "Colombia", "Cuba", "Dominica", "Dominican Republic",
  "Ecuador", "El Salvador", "Equatorial Guinea", "Fiji", "Gabon",
  "Georgia", "Grenada", "Guatemala", "Indonesia", "Iran, Islamic Rep.",
  "Iraq", "Jamaica", "Kazakhstan", "Kosovo", "Libya", "Malaysia",
  "Maldives", "Marshall Islands", "Mauritius", "Mexico", "Moldova",
  "Mongolia", "Montenegro", "North Macedonia", "Paraguay", "Peru",
  "Samoa", "Serbia", "South Africa", "St. Lucia",
  "St. Vincent and the Grenadines", "Suriname", "Thailand", "Tonga",
  "Turkiye", "Turkmenistan", "Tuvalu", "Ukraine"
)

paises_alto <- c(
  "American Samoa", "Andorra", "Antigua and Barbuda", "Aruba",
  "Australia", "Austria", "Bahamas, The", "Bahrain", "Barbados",
  "Belgium", "Bermuda", "British Virgin Islands", "Brunei Darussalam",
  "Bulgaria", "Canada", "Cayman Islands", "Channel Islands", "Chile",
  "Costa Rica", "Croatia", "Curacao", "Cyprus", "Czechia", "Denmark",
  "Estonia", "Faroe Islands", "Finland", "France", "French Polynesia",
  "Germany", "Gibraltar", "Greece", "Greenland", "Guam", "Guyana",
  "Hong Kong SAR, China", "Hungary", "Iceland", "Ireland", "Isle of Man",
  "Israel", "Italy", "Japan", "Korea, Rep.", "Kuwait", "Latvia",
  "Liechtenstein", "Lithuania", "Luxembourg", "Macao SAR, China",
  "Malta", "Monaco", "Nauru", "Netherlands", "New Caledonia",
  "New Zealand", "Northern Mariana Islands", "Norway", "Oman", "Palau",
  "Panama", "Poland", "Portugal", "Puerto Rico", "Qatar", "Romania",
  "Russian Federation", "San Marino", "Saudi Arabia", "Seychelles",
  "Singapore", "Sint Maarten (Dutch part)", "Slovak Republic",
  "Slovenia", "Spain", "St. Kitts and Nevis", "St. Martin (French part)",
  "Sweden", "Switzerland", "Taiwan, China", "Trinidad and Tobago",
  "Turks and Caicos Islands", "United Arab Emirates", "United Kingdom",
  "United States", "Uruguay", "Virgin Islands (U.S.)"
)

stopifnot(length(paises_bajo) == 25, length(paises_medio_bajo) == 50,
          length(paises_medio_alto) == 54, length(paises_alto) == 87)

paises <- c(paises_bajo, paises_medio_bajo, paises_medio_alto, paises_alto)
niveles_ingreso <- c("Ingreso bajo", "Ingreso medio-bajo",
                      "Ingreso medio-alto", "Ingreso alto")
grupo_ingreso <- factor(
  c(rep(niveles_ingreso[1], length(paises_bajo)),
    rep(niveles_ingreso[2], length(paises_medio_bajo)),
    rep(niveles_ingreso[3], length(paises_medio_alto)),
    rep(niveles_ingreso[4], length(paises_alto))),
  levels = niveles_ingreso, ordered = TRUE
)

datos_bm <- data.frame(pais = paises, grupo_ingreso = grupo_ingreso)
cat("Numero total de economias clasificadas:", nrow(datos_bm), "\n")

# --------------------------------------------------------------
# 1. Ejemplo (estilo SR, Example 1): distribucion de frecuencias
#    simple del grupo de ingreso, con histograma de frecuencia
#    absoluta y relativa (dos paneles, como SR Fig. 2-1)
# --------------------------------------------------------------
tabla_abs <- table(datos_bm$grupo_ingreso)
tabla_rel <- prop.table(tabla_abs)

cat("\n--- Ejemplo 2.2.1: paises por grupo de ingreso (frec. absoluta) ---\n")
print(tabla_abs)
cat("\n--- Frecuencia relativa ---\n")
print(round(tabla_rel, 3))

png("cap2_ejemplo1_bm.png", width = 2400, height = 1100, res = 220)
par(mfrow = c(1, 2), mar = c(7, 4, 3, 1))

bp1 <- barplot(tabla_abs, col = "steelblue", ylim = c(0, 100),
               main = "Panel A: Frecuencia absoluta",
               ylab = "Numero de paises", las = 2, cex.names = 0.8)
text(bp1, tabla_abs + 4, labels = tabla_abs, cex = 0.9)

bp2 <- barplot(tabla_rel, col = "steelblue", ylim = c(0, 0.45),
               main = "Panel B: Frecuencia relativa",
               ylab = "Proporcion de paises", las = 2, cex.names = 0.8)
text(bp2, tabla_rel + 0.02, labels = round(tabla_rel, 3), cex = 0.9)

dev.off()

# --------------------------------------------------------------
# 2. Ejemplo (estilo SR, Example 2): version extendida con
#    frecuencia acumulada, poligono de frecuencias y ojiva.
#    Como el grupo de ingreso es una variable cualitativa ORDINAL
#    (proviene de agrupar el INB per capita continuo en los
#    umbrales oficiales del Banco Mundial: 1135, 4495 y 13935
#    dolares), tiene sentido acumular frecuencias en su orden
#    natural, igual que con intervalos de clase (cuatro paneles,
#    como SR Fig. 2-2)
# --------------------------------------------------------------
tabla_acum <- cumsum(tabla_abs)
tabla_acum_rel <- cumsum(tabla_rel)

cat("\n--- Frecuencia acumulada ---\n")
print(tabla_acum)
cat("\n--- Frecuencia relativa acumulada ---\n")
print(round(tabla_acum_rel, 3))

png("cap2_ejemplo2_bm.png", width = 2400, height = 2000, res = 220)
par(mfrow = c(2, 2), mar = c(7, 4, 3, 1))

# Panel A: histograma de frecuencia absoluta
bp1 <- barplot(tabla_abs, col = "steelblue", ylim = c(0, 100),
               main = "Panel A: Histograma (frec. absoluta)",
               ylab = "Numero de paises", las = 2, cex.names = 0.75)

# Panel B: histograma de frecuencia relativa
bp2 <- barplot(tabla_rel, col = "steelblue", ylim = c(0, 0.45),
               main = "Panel B: Histograma (frec. relativa)",
               ylab = "Proporcion de paises", las = 2, cex.names = 0.75)

# Panel C: poligono de frecuencias (frecuencia absoluta contra
# la posicion ordinal de cada categoria)
plot(seq_along(tabla_abs), as.numeric(tabla_abs), type = "b",
     pch = 19, col = "firebrick", lwd = 2,
     xaxt = "n", xlab = "", ylab = "Numero de paises",
     main = "Panel C: Poligono de frecuencias", ylim = c(0, 100))
axis(1, at = seq_along(tabla_abs), labels = names(tabla_abs),
     las = 2, cex.axis = 0.75)

# Panel D: ojiva (frecuencia relativa acumulada, "menos de"),
# arrancando en 0 antes de la primera categoria
plot(0:4, c(0, as.numeric(tabla_acum_rel)), type = "b", pch = 19,
     col = "darkgreen", lwd = 2, xaxt = "n",
     xlab = "Grupo de ingreso (umbral superior)", ylab = "Frec. relativa acumulada",
     main = "Panel D: Ojiva", ylim = c(0, 1))
axis(1, at = 0:4,
     labels = c("0", "$1,135", "$4,495", "$13,935", "y mas"),
     cex.axis = 0.75)

dev.off()

cat("\nFiguras exportadas: cap2_ejemplo1_bm.png, cap2_ejemplo2_bm.png\n")

# --------------------------------------------------------------
# 3. Diagrama de tallo y hoja (Ejemplo del capitulo: examen de
#    educacion financiera). R construye el diagrama ordenado
#    directamente con stem().
# --------------------------------------------------------------
calificaciones <- c(72, 85, 63, 91, 77, 68, 58, 94, 82, 75, 67, 88,
                     71, 62, 79, 83, 76, 92, 65, 87, 78, 69, 74, 81)

cat("\n--- Diagrama de tallo y hoja: calificaciones (n = 24) ---\n")
stem(calificaciones, scale = 1)

# --------------------------------------------------------------
# 4. Datos cuantitativos: distribucion de frecuencias e histograma
# --------------------------------------------------------------
# Ingreso mensual (miles de pesos) de 50 hogares. Datos fijos (no
# simulados) que reproducen exactamente los conteos de la Tabla 2.3
# del capitulo: 4, 10, 16, 11, 6 y 3 hogares en los intervalos
# [10,15), [15,20), [20,25), [25,30), [30,35) y [35,40).
ingreso <- c(15.1, 13.1, 21.6, 29.8, 38.1, 21.1, 18.3, 36.4, 11.1, 17.5,
             30.5, 23.4, 29.0, 20.0, 27.6, 36.8, 28.0, 28.6, 24.2, 24.0,
             19.4, 11.3, 17.1, 15.1, 29.1, 20.5, 15.4, 10.1, 27.7, 28.5,
             20.5, 23.9, 23.2, 31.1, 24.7, 23.0, 27.8, 22.7, 26.9, 16.1,
             29.2, 18.6, 30.2, 31.4, 30.4, 22.9, 31.1, 16.0, 21.7, 20.8)

# Distribucion de frecuencias con intervalos de amplitud fija
intervalos <- cut(ingreso, breaks = seq(10, 40, by = 5), right = FALSE)
tabla_ingreso <- table(intervalos)
cat("\nDistribucion de frecuencias del ingreso mensual:\n")
print(tabla_ingreso)
cat("\nFrecuencias relativas:\n")
print(round(prop.table(tabla_ingreso), 3))
cat("\nFrecuencias acumuladas:\n")
print(cumsum(tabla_ingreso))

par(mfrow = c(1, 1), mar = c(4, 4, 3, 1))
hist(ingreso,
     breaks = seq(10, 40, by = 5),
     col    = "steelblue",
     border = "white",
     main   = "Distribucion del ingreso mensual de los hogares",
     xlab   = "Ingreso (miles de pesos)",
     ylab   = "Frecuencia")

# Figura de 3 paneles: histograma, poligono de frecuencias y ojiva,
# los tres con los mismos datos de ingreso mensual
marcas_clase <- seq(12.5, 37.5, by = 5)
n_j          <- as.numeric(tabla_ingreso)
fronteras    <- seq(10, 40, by = 5)
N_j          <- cumsum(n_j)

# Mediana leida en la ojiva: interpolacion lineal dentro del
# intervalo mediano (misma formula de la Observacion del capitulo,
# consistente con los segmentos rectos de la propia ojiva)
n_total       <- sum(n_j)
clase_mediana <- min(which(N_j >= n_total / 2))
L_mediana     <- fronteras[clase_mediana]
N_prev        <- if (clase_mediana == 1) 0 else N_j[clase_mediana - 1]
mediana_ojiva <- L_mediana + (n_total / 2 - N_prev) / n_j[clase_mediana] * 5

png("cap2_ingreso_hist_poligono_ojiva.png", width = 2700, height = 1000, res = 220)
par(mfrow = c(1, 3), mar = c(4.5, 4.5, 3, 1))

# Panel A: histograma
hist(ingreso, breaks = fronteras, col = "steelblue",
     border = "white", main = "A. Histograma",
     xlab = "Ingreso (miles de pesos)", ylab = "Frecuencia")

# Panel B: poligono de frecuencias (se cierra con frecuencia 0 en
# una marca de clase antes de la primera y despues de la ultima)
x_poligono <- c(marcas_clase[1] - 5, marcas_clase,
                 tail(marcas_clase, 1) + 5)
y_poligono <- c(0, n_j, 0)
plot(x_poligono, y_poligono, type = "b", pch = 19, col = "firebrick",
     lwd = 2, main = "B. Poligono de frecuencias",
     xlab = "Marca de clase", ylab = "Frecuencia")

# Panel C: ojiva (frecuencia acumulada contra frontera superior),
# con lectura grafica de la mediana
plot(fronteras, c(0, N_j), type = "b", pch = 19, col = "darkgreen",
     lwd = 2, main = "C. Ojiva", xlab = "Ingreso (miles de pesos)",
     ylab = "Frecuencia acumulada")
segments(10, 25, mediana_ojiva, 25, lty = 2, col = "gray40")
segments(mediana_ojiva, 0, mediana_ojiva, 25, lty = 2, col = "gray40")
points(mediana_ojiva, 25, pch = 4, cex = 1.3, col = "gray20", lwd = 2)

dev.off()
cat("Figura exportada: cap2_ingreso_hist_poligono_ojiva.png\n")
cat("Mediana leida en la ojiva (aprox.):", round(mediana_ojiva, 2), "\n")

# --------------------------------------------------------------
# 5. Tipos de curvas de frecuencia: simulacion
#    Cada panel simula una variable con la forma correspondiente
#    (n = 2000) y superpone la curva de frecuencias suavizada
#    (estimador de densidad por kernel) sobre el histograma.
# --------------------------------------------------------------
set.seed(11102)
n_sim <- 2000

png("cap2_curvas_frecuencia.png", width = 2400, height = 2400, res = 220)
par(mfrow = c(3, 3), mar = c(3, 3, 3, 1))

# Simetrica (campana)
x1 <- rnorm(n_sim, mean = 0, sd = 1)
hist(x1, breaks = 30, freq = FALSE, col = "steelblue", border = "white",
     main = "Simetrica (campana)", xlab = "", ylab = "")
lines(density(x1), col = "firebrick", lwd = 2)

# Sesgada a la derecha
x2 <- rgamma(n_sim, shape = 2, rate = 1)
hist(x2, breaks = 30, freq = FALSE, col = "steelblue", border = "white",
     main = "Sesgada a la derecha", xlab = "", ylab = "")
lines(density(x2, from = 0), col = "firebrick", lwd = 2)

# Sesgada a la izquierda
x3 <- -rgamma(n_sim, shape = 2, rate = 1)
hist(x3, breaks = 30, freq = FALSE, col = "steelblue", border = "white",
     main = "Sesgada a la izquierda", xlab = "", ylab = "")
lines(density(x3, to = 0), col = "firebrick", lwd = 2)

# Uniforme
x4 <- runif(n_sim, 0, 1)
hist(x4, breaks = 30, freq = FALSE, col = "steelblue", border = "white",
     main = "Uniforme", xlab = "", ylab = "")
lines(density(x4, from = 0, to = 1), col = "firebrick", lwd = 2)

# Forma de J: Beta(1,5), maximo en el extremo izquierdo
x5 <- rbeta(n_sim, 1, 5)
hist(x5, breaks = 30, freq = FALSE, col = "steelblue", border = "white",
     main = "Forma de J", xlab = "", ylab = "")
lines(density(x5, from = 0, to = 1), col = "firebrick", lwd = 2)

# Forma de J invertida: Beta(5,1), maximo en el extremo derecho
x6 <- rbeta(n_sim, 5, 1)
hist(x6, breaks = 30, freq = FALSE, col = "steelblue", border = "white",
     main = "Forma de J invertida", xlab = "", ylab = "")
lines(density(x6, from = 0, to = 1), col = "firebrick", lwd = 2)

# Forma de U: Beta(0.5, 0.5)
x7 <- rbeta(n_sim, 0.5, 0.5)
hist(x7, breaks = 30, freq = FALSE, col = "steelblue", border = "white",
     main = "Forma de U", xlab = "", ylab = "")
lines(density(x7, from = 0, to = 1), col = "firebrick", lwd = 2)

# Bimodal: mezcla de dos normales (dos regimenes de mercado)
x8 <- c(rnorm(n_sim / 2, mean = -2, sd = 0.6),
        rnorm(n_sim / 2, mean =  2, sd = 0.6))
hist(x8, breaks = 30, freq = FALSE, col = "steelblue", border = "white",
     main = "Bimodal", xlab = "", ylab = "")
lines(density(x8), col = "firebrick", lwd = 2)

# Multimodal: mezcla de tres normales (micro, PyME, gran empresa)
x9 <- c(rnorm(n_sim / 3, mean = -4, sd = 0.5),
        rnorm(n_sim / 3, mean =  0, sd = 0.5),
        rnorm(n_sim / 3, mean =  4, sd = 0.5))
hist(x9, breaks = 30, freq = FALSE, col = "steelblue", border = "white",
     main = "Multimodal", xlab = "", ylab = "")
lines(density(x9), col = "firebrick", lwd = 2)

dev.off()
cat("Figura exportada: cap2_curvas_frecuencia.png\n")

# --------------------------------------------------------------
# 6. Medidas de centralidad y dispersion
# --------------------------------------------------------------
moda_muestral <- function(x) {
  # R no tiene una funcion nativa para la moda; se calcula a partir
  # de la tabla de frecuencias del vector (redondeado a un decimal)
  tab <- table(round(x, 1))
  as.numeric(names(tab)[which.max(tab)])
}

media_ing   <- mean(ingreso)
mediana_ing <- median(ingreso)
moda_ing    <- moda_muestral(ingreso)
var_ing     <- var(ingreso)          # usa divisor n-1
sd_ing      <- sd(ingreso)
rango_ing   <- diff(range(ingreso))
AI_ing      <- IQR(ingreso)
CV_ing      <- sd_ing / media_ing
DM_ing      <- mean(abs(ingreso - media_ing))  # desviacion media
z_ing       <- (ingreso - media_ing) / sd_ing  # variable estandarizada

cat("\n--- Medidas de centralidad y dispersion (ingreso) ---\n")
cat("Media:  ", round(media_ing, 2), "\n")
cat("Mediana:", round(mediana_ing, 2), "\n")
cat("Moda (aprox.):", round(moda_ing, 2), "\n")
cat("Varianza muestral:  ", round(var_ing, 3), "\n")
cat("Desviacion estandar:", round(sd_ing, 3), "\n")
cat("Desviacion media:   ", round(DM_ing, 3), "\n")
cat("Rango:              ", round(rango_ing, 3), "\n")
cat("Amplitud intercuartilica:", round(AI_ing, 3), "\n")
cat("Coeficiente de variacion:", round(CV_ing, 3), "\n")
cat("Primeras 5 puntuaciones z:", round(head(z_ing, 5), 3), "\n")

# --------------------------------------------------------------
# 7. Simulacion: orden media-mediana-moda bajo asimetria
#    (Ejemplo del capitulo, ilustra la Observacion sobre la
#    relacion entre las tres medidas de centralidad y la asimetria)
# --------------------------------------------------------------
set.seed(11102)
n_sim2 <- 5000

sesgo_derecha   <- rgamma(n_sim2, shape = 2, rate = 1)
sesgo_izquierda <- -sesgo_derecha

calc_stats <- function(x) {
  media   <- mean(x)
  mediana <- median(x)
  d <- density(x)
  moda <- d$x[which.max(d$y)]   # moda aproximada: maximo de la
                                 # densidad estimada por kernel
  list(media = media, mediana = mediana, moda = moda, dens = d)
}

der <- calc_stats(sesgo_derecha)
izq <- calc_stats(sesgo_izquierda)

cat("\n--- Sesgada a la derecha ---\n")
cat("Media:  ", round(der$media, 3), "\n")
cat("Mediana:", round(der$mediana, 3), "\n")
cat("Moda (aprox.):", round(der$moda, 3), "\n")
cat("Orden media > mediana > moda:",
    der$media > der$mediana && der$mediana > der$moda, "\n")

cat("\n--- Sesgada a la izquierda ---\n")
cat("Media:  ", round(izq$media, 3), "\n")
cat("Mediana:", round(izq$mediana, 3), "\n")
cat("Moda (aprox.):", round(izq$moda, 3), "\n")
cat("Orden moda > mediana > media:",
    izq$moda > izq$mediana && izq$mediana > izq$media, "\n")

png("cap2_asimetria_centralidad.png", width = 2400, height = 1100, res = 220)
par(mfrow = c(1, 2), mar = c(4, 4, 3, 1))

hist(sesgo_derecha, breaks = 40, freq = FALSE, col = "steelblue",
     border = "white", main = "Sesgada a la derecha",
     xlab = "", ylab = "Densidad")
lines(der$dens, lwd = 2)
abline(v = der$moda, col = "darkorange", lwd = 2, lty = 2)
abline(v = der$mediana, col = "seagreen", lwd = 2, lty = 2)
abline(v = der$media, col = "firebrick", lwd = 2, lty = 2)
legend("topright",
       legend = c(paste0("Moda = ", round(der$moda, 2)),
                  paste0("Mediana = ", round(der$mediana, 2)),
                  paste0("Media = ", round(der$media, 2))),
       col = c("darkorange", "seagreen", "firebrick"),
       lty = 2, lwd = 2, bty = "n", cex = 0.75)

hist(sesgo_izquierda, breaks = 40, freq = FALSE, col = "steelblue",
     border = "white", main = "Sesgada a la izquierda",
     xlab = "", ylab = "Densidad")
lines(izq$dens, lwd = 2)
abline(v = izq$moda, col = "darkorange", lwd = 2, lty = 2)
abline(v = izq$mediana, col = "seagreen", lwd = 2, lty = 2)
abline(v = izq$media, col = "firebrick", lwd = 2, lty = 2)
legend("topleft",
       legend = c(paste0("Moda = ", round(izq$moda, 2)),
                  paste0("Mediana = ", round(izq$mediana, 2)),
                  paste0("Media = ", round(izq$media, 2))),
       col = c("darkorange", "seagreen", "firebrick"),
       lty = 2, lwd = 2, bty = "n", cex = 0.75)

dev.off()
cat("\nFigura exportada: cap2_asimetria_centralidad.png\n")

# --------------------------------------------------------------
# 8. Datos reales: rendimientos del S&P 500, enero-marzo 2020
#    (Ejemplo del capitulo). Rendimientos de enero: Stock Market
#    News, Nasdaq/Yahoo Finance. Rendimiento del 16 de marzo:
#    Wikipedia, List of largest daily changes in the S&P 500 Index.
# --------------------------------------------------------------
fechas_sp500 <- c("2 ene", "3 ene", "10 ene", "20 ene", "23 ene",
                   "31 ene", "16 mar")
rendimientos_sp500 <- c(0.30, 0.80, 0.70, 0.40, 0.03, 0.30, -11.98)
colores_sp500 <- c(rep("steelblue", 6), "firebrick")

media_sp500_sin  <- mean(rendimientos_sp500[1:6])
media_sp500_con  <- mean(rendimientos_sp500)
mediana_sp500    <- median(rendimientos_sp500)

cat("\n--- Rendimientos S&P 500, enero-marzo 2020 ---\n")
cat("Media sin el 16 de marzo:", round(media_sp500_sin, 3), "%\n")
cat("Media con el 16 de marzo:", round(media_sp500_con, 3), "%\n")
cat("Mediana (7 observaciones):", round(mediana_sp500, 3), "%\n")

png("cap2_sp500_outlier.png", width = 2400, height = 1300, res = 220)
par(mar = c(5, 4.5, 3, 1))

barplot(rendimientos_sp500, names.arg = fechas_sp500, col = colores_sp500,
        border = NA, ylim = c(-13, 2),
        main = "Rendimientos diarios del S&P 500 (2020)",
        ylab = "Rendimiento diario (%)", xlab = "",
        las = 2, cex.names = 0.85)

abline(h = 0, col = "gray30", lwd = 1)
abline(h = media_sp500_sin, col = "seagreen", lty = 2, lwd = 2)
abline(h = media_sp500_con, col = "firebrick", lty = 2, lwd = 2)
abline(h = mediana_sp500, col = "purple", lty = 2, lwd = 2)

legend("bottomleft",
       legend = c(paste0("Media sin outlier = ", round(media_sp500_sin, 2), "%"),
                  paste0("Media con outlier = ", round(media_sp500_con, 2), "%"),
                  paste0("Mediana = ", round(mediana_sp500, 2), "%")),
       col = c("seagreen", "firebrick", "purple"),
       lty = 2, lwd = 2, bty = "n", cex = 0.8)

dev.off()
cat("Figura exportada: cap2_sp500_outlier.png\n")

# --------------------------------------------------------------
# 9. Medias ponderada, geometrica y armonica
# --------------------------------------------------------------

# Media ponderada: salario promedio de una empresa (ver Ejemplo del
# capitulo), ponderado por el numero de trabajadores en cada categoria
salarios   <- c(120, 200, 320)
n_trabaj   <- c(30, 12, 8)
media_pond <- sum(salarios * n_trabaj) / sum(n_trabaj)
media_simple <- mean(salarios)
cat("\n--- Media ponderada: salario de la empresa ---\n")
cat("Media ponderada (por num. de trabajadores):", round(media_pond, 2), "\n")
cat("Media simple (ignora el peso de cada grupo):", round(media_simple, 2), "\n")

# Media geometrica: rendimiento promedio de una inversion en 3 anios
tasas_rendimiento <- c(0.01, 0.04, 0.16)
factores <- 1 + tasas_rendimiento
G <- prod(factores)^(1 / length(factores)) - 1
media_aritm_tasas <- mean(tasas_rendimiento)
cat("\n--- Media geometrica: rendimiento de una inversion ---\n")
cat("Media geometrica (rendimiento compuesto real):", round(G * 100, 2), "%\n")
cat("Media aritmetica (sobreestima el rendimiento):",
    round(media_aritm_tasas * 100, 2), "%\n")

# Media armonica: precio promedio de compra (dollar-cost averaging)
precios_unidad <- c(50, 100)
H <- length(precios_unidad) / sum(1 / precios_unidad)
cat("\n--- Media armonica: precio promedio de compra ---\n")
cat("Media armonica (precio efectivo pagado):", round(H, 2), "\n")
cat("Media aritmetica simple (incorrecta aqui):",
    round(mean(precios_unidad), 2), "\n")

# --------------------------------------------------------------
# 10. Diagrama de caja y brazos
# --------------------------------------------------------------

# 7a. Figura de anatomia (valores ilustrativos, no datos reales)
png("cap2_anatomia_boxplot.png", width = 2200, height = 1900, res = 220)
par(mar = c(2, 2, 3, 1), xpd = TRUE)

minimo  <- 2
q1      <- 5
mediana <- 8
q3      <- 12
maximo  <- 18   # mayor valor NO atipico (dentro del bigote)
atipico <- 25   # observacion mas alla del bigote

plot(NA, xlim = c(0, 6.2), ylim = c(-2.5, 27),
     xlab = "", ylab = "", xaxt = "n", yaxt = "n", bty = "n",
     main = "Anatomia de un diagrama de caja y brazos")

segments(1, q1, 1, minimo, lwd = 2)
segments(1, q3, 1, maximo, lwd = 2)
segments(0.85, minimo, 1.15, minimo, lwd = 2)
segments(0.85, maximo, 1.15, maximo, lwd = 2)
rect(0.7, q1, 1.3, q3, col = "steelblue", border = "black", lwd = 2)
segments(0.7, mediana, 1.3, mediana, lwd = 3, col = "white")
segments(0.7, mediana, 1.3, mediana, lwd = 2, col = "black")
points(1, atipico, pch = 1, cex = 1.6, lwd = 2)

etiqueta <- function(y_punto, y_texto, l1, l2, x_punto = 1, x_texto = 1.9) {
  arrows(x_texto - 0.05, y_texto, x_punto + 0.16, y_punto,
         length = 0.08, lwd = 1.2)
  text(x_texto, y_texto + 0.35, l1, adj = 0, cex = 0.8, font = 2)
  text(x_texto, y_texto - 0.35, l2, adj = 0, cex = 0.75)
}

etiqueta(atipico, 25.3, "Valor atipico", "mas alla de 1.5 x RIC")
etiqueta(maximo,  20.3, "Maximo dentro del bigote", "mayor valor no atipico")
etiqueta(q3,      14.3, "Tercer cuartil (Q3)", "75% de los datos esta debajo")
etiqueta(mediana,  9.0, "Mediana", "50% de los datos esta debajo")
etiqueta(q1,       4.0, "Primer cuartil (Q1)", "25% de los datos esta debajo")
etiqueta(minimo,  -0.8, "Minimo dentro del bigote", "menor valor no atipico")

segments(0.5, q1, 0.5, q3, lwd = 1)
segments(0.45, q1, 0.55, q1, lwd = 1)
segments(0.45, q3, 0.55, q3, lwd = 1)
text(0.4, (q1 + q3) / 2, "RIC = Q3 - Q1\n(50% central\nde los datos)",
     cex = 0.7, adj = 1)

dev.off()
cat("Figura exportada: cap2_anatomia_boxplot.png\n")

# 7b. Boxplot real: ingreso mensual de los hogares (Ejemplo del capitulo)
boxplot(ingreso,
        col      = "steelblue",
        border   = "navy",
        main     = "Diagrama de caja y brazos: ingreso mensual",
        ylab     = "Ingreso (miles de pesos)",
        notch    = FALSE,
        outline  = TRUE)

# 7c. Ejemplo del capitulo: rendimientos del IPC (S&P/BMV IPC), datos
# reales via Yahoo Finance. Requiere el paquete quantmod y conexion a
# internet; NO se ejecuta al compilar el libro (por eso no genera una
# figura para el PDF directamente: correlo tu y exporta el PNG que
# necesites con png()/dev.off() como en los demas ejemplos).
if (!requireNamespace("quantmod", quietly = TRUE)) {
  install.packages("quantmod")
}
library(quantmod)

fecha_fin    <- Sys.Date()
fecha_inicio <- fecha_fin - 366 * 10   # aprox. los ultimos 10 anios

getSymbols("^MXX", src = "yahoo", from = fecha_inicio, to = fecha_fin)

# Precio de cierre del indice
plot(Cl(MXX), main = "IPC (S&P/BMV IPC): precio de cierre",
     ylab = "Puntos", xlab = "")

# Rendimientos mensuales, en porcentaje
retornos_ipc <- monthlyReturn(Cl(MXX)) * 100
plot(retornos_ipc, main = "IPC: rendimientos mensuales",
     ylab = "Rendimiento (%)", xlab = "")

# Estadisticas descriptivas de los rendimientos
mediana_ipc <- median(retornos_ipc)
q1_ipc <- quantile(retornos_ipc, 0.25)
q3_ipc <- quantile(retornos_ipc, 0.75)
AI_ipc <- q3_ipc - q1_ipc

cat("\n--- Rendimientos mensuales del IPC (ultimos ~10 anios) ---\n")
cat("Mediana:", round(mediana_ipc, 2), "%\n")
cat("Q1:", round(q1_ipc, 2), "%   Q3:", round(q3_ipc, 2), "%\n")
cat("Amplitud intercuartilica:", round(AI_ipc, 2), "%\n")

# Diagrama de caja y brazos de los rendimientos
boxplot(coredata(retornos_ipc), col = "steelblue", border = "navy",
        main = "Diagrama de caja y brazos: rendimientos mensuales del IPC",
        ylab = "Rendimiento (%)")

# Meses atipicos: fuera de 1.5 x A.I. desde Q1 o Q3
limite_inf <- q1_ipc - 1.5 * AI_ipc
limite_sup <- q3_ipc + 1.5 * AI_ipc
atipicos_ipc <- retornos_ipc[retornos_ipc < limite_inf | retornos_ipc > limite_sup]

cat("\nMeses atipicos (fuera de 1.5 x A.I.):\n")
print(atipicos_ipc)

# --------------------------------------------------------------
# 11. Coeficientes de asimetria y curtosis (ingreso)
# --------------------------------------------------------------
Sk_ingreso <- 3 * (media_ing - mediana_ing) / sd_ing
K_ingreso  <- mean((ingreso - media_ing)^4) / sd_ing^4

cat("\n--- Asimetria y curtosis (ingreso) ---\n")
cat("Coeficiente de asimetria de Pearson (Sk):", round(Sk_ingreso, 3), "\n")
cat("Coeficiente de curtosis (K):", round(K_ingreso, 3),
    ifelse(K_ingreso > 3, "(leptocurtica)",
           ifelse(K_ingreso < 3, "(platicurtica)", "(mesocurtica)")), "\n")

# Figura: los tres tipos de curtosis (curvas teoricas, no datos del capitulo)
# Mesocurtica: normal estandar (curtosis = 3)
# Leptocurtica: t-Student con 5 g.l., reescalada a varianza 1
# Platicurtica: uniforme continua, reescalada a varianza 1
png("cap2_curtosis_tipos.png", width = 2000, height = 1450, res = 220)
par(mar = c(4.5, 4.5, 3, 1))

x <- seq(-4, 4, length.out = 500)
y_meso <- dnorm(x, mean = 0, sd = 1)

df_t <- 5
escala_t <- sqrt((df_t - 2) / df_t)
y_lepto <- dt(x / escala_t, df = df_t) / escala_t

a <- sqrt(3)
y_plati <- dunif(x, min = -a, max = a)

plot(x, y_lepto, type = "l", lwd = 2.5, col = "firebrick",
     ylim = c(0, max(y_lepto, y_meso, y_plati)),
     xlab = "Valor estandarizado (z)", ylab = "Densidad",
     main = "Tipos de curtosis: mesocurtica, leptocurtica y platicurtica")
lines(x, y_meso, lwd = 2.5, col = "black")
lines(x, y_plati, lwd = 2.5, col = "steelblue")
legend("topright",
       legend = c("Leptocurtica (K > 3)", "Mesocurtica (K = 3)",
                  "Platicurtica (K < 3)"),
       col = c("firebrick", "black", "steelblue"), lwd = 2.5, bty = "n")

dev.off()
cat("Figura exportada: cap2_curtosis_tipos.png\n")

# Contraejemplo: la curtosis NO mide "que tan puntiaguda" es una
# distribucion (Westfall, 2014, "Kurtosis as Peakedness, 1905-2014.
# R.I.P.", The American Statistician). Comparamos una triangular
# (curtosis baja, pico anguloso/puntiagudo) contra una mezcla de
# uniforme + cola pesada (curtosis alta, pico plano/meseta): el
# resultado es justo lo opuesto de lo que predeciria la idea de
# "curtosis = puntiagudez".
set.seed(11102)
n_kurt <- 500000

# Triangular simetrica, varianza 1: suma de dos Uniform(-a/2,a/2)
a_tri <- sqrt(6)
x_tri <- runif(n_kurt, -a_tri / 2, a_tri / 2) +
         runif(n_kurt, -a_tri / 2, a_tri / 2)

# Normal estandar (referencia, K=3)
x_norm_k <- rnorm(n_kurt)

# "Torre plana": 90% Uniform(-1.5,1.5) + 10% N(0,9), reescalada a
# varianza 1 (contaminacion que agrega colas pesadas sin afectar
# la meseta central)
comp <- rbinom(n_kurt, 1, 0.9)
x_raw <- ifelse(comp == 1, runif(n_kurt, -1.5, 1.5), rnorm(n_kurt, 0, 3))
x_flat <- x_raw / sd(x_raw)

kurt <- function(x) mean((x - mean(x))^4) / (var(x) * (n_kurt - 1) / n_kurt)^2
K_tri  <- kurt(x_tri)
K_norm <- kurt(x_norm_k)
K_flat <- kurt(x_flat)

cat("\n--- Contraejemplo: curtosis y forma del pico ---\n")
cat("Kurtosis triangular (pico anguloso):", round(K_tri, 2), "\n")
cat("Kurtosis normal (referencia):", round(K_norm, 2), "\n")
cat("Kurtosis torre plana (pico en meseta):", round(K_flat, 2), "\n")
cat("La de MENOR curtosis tiene el pico MAS puntiagudo, y viceversa.\n")

png("cap2_curtosis_contraejemplo.png", width = 2400, height = 950, res = 220)
par(mfrow = c(1, 3), mar = c(4.5, 4.5, 3, 1))

hist(x_tri, breaks = 60, freq = FALSE, col = "steelblue", border = "white",
     xlim = c(-4, 4), ylim = c(0, 0.42),
     main = paste0("Triangular (K = ", round(K_tri, 2), ")"),
     xlab = "Pico anguloso, no suave", ylab = "Densidad")

hist(x_norm_k, breaks = 60, freq = FALSE, col = "steelblue", border = "white",
     xlim = c(-4, 4), ylim = c(0, 0.42),
     main = paste0("Normal (K = ", round(K_norm, 2), ")"),
     xlab = "Referencia", ylab = "Densidad")

hist(x_flat, breaks = 60, freq = FALSE, col = "steelblue", border = "white",
     xlim = c(-4, 4), ylim = c(0, 0.42),
     main = paste0("Uniforme + colas (K = ", round(K_flat, 2), ")"),
     xlab = "Pico plano (meseta)", ylab = "Densidad")

dev.off()
cat("Figura exportada: cap2_curtosis_contraejemplo.png\n")

# --------------------------------------------------------------
# 12. Datos cualitativos bivariados: tabla de contingencia
# --------------------------------------------------------------
# Tamano de empresa vs. acceso a linea de credito bancaria (n = 300)
set.seed(11102)
tamano  <- sample(c("PyME", "Grande"), 300, replace = TRUE, prob = c(2/3, 1/3))
credito <- ifelse(tamano == "PyME",
                   sample(c("Con credito", "Sin credito"), 300, replace = TRUE,
                          prob = c(0.30, 0.70)),
                   sample(c("Con credito", "Sin credito"), 300, replace = TRUE,
                          prob = c(0.75, 0.25)))

tabla_contingencia <- table(tamano, credito)
cat("\n--- Tabla de contingencia: tamano de empresa x credito ---\n")
print(tabla_contingencia)
cat("\nProporcion con credito, por renglon (tamano de empresa):\n")
print(round(prop.table(tabla_contingencia, margin = 1), 3))

# --------------------------------------------------------------
# 13. Datos cuantitativos bivariados: diagrama de dispersion,
#    covarianza y correlacion (Ley de Okun)
# --------------------------------------------------------------
set.seed(11102)
n_trim <- 40

# Crecimiento del PIB (media 2%, desv. est. 1.5%)
crecimiento_pib <- rnorm(n_trim, mean = 2, sd = 1.5)

# La Ley de Okun predice una relacion negativa:
# cambio en desempleo ~ -0.4 * crecimiento del PIB + ruido
cambio_desempleo <- -0.4 * crecimiento_pib + rnorm(n_trim, mean = 0.8, sd = 0.5)

covarianza  <- cov(crecimiento_pib, cambio_desempleo)
correlacion <- cor(crecimiento_pib, cambio_desempleo)
cat("\n--- Ley de Okun: PIB vs. desempleo ---\n")
cat("Covarianza muestral: ", round(covarianza, 4), "\n")
cat("Correlacion de Pearson:", round(correlacion, 4), "\n")

plot(crecimiento_pib, cambio_desempleo,
     pch  = 19, col = "steelblue",
     main = "Ley de Okun (datos ilustrativos)",
     xlab = "Crecimiento del PIB (%)",
     ylab = "Cambio en la tasa de desempleo (p.p.)")
abline(lm(cambio_desempleo ~ crecimiento_pib), col = "red", lwd = 2)
legend("topright", legend = paste("r =", round(correlacion, 3)), bty = "n")

# --------------------------------------------------------------
# 11b. Correlacion de Spearman (Ejemplo del capitulo: acuerdo
#      entre dos analistas de credito que ordenan 8 bonos)
# --------------------------------------------------------------
rango_analista_A <- c(1, 3, 2, 5, 4, 6, 8, 7)
rango_analista_B <- c(2, 1, 3, 4, 6, 5, 7, 8)

# method = "spearman" le pide a cor() usar los rangos en vez de
# los valores originales (equivalente a la formula abreviada del
# capitulo cuando no hay rangos empatados)
r_spearman <- cor(rango_analista_A, rango_analista_B, method = "spearman")
cat("\n--- Correlacion de Spearman: dos analistas de credito ---\n")
cat("r_s =", round(r_spearman, 3), "\n")

# --------------------------------------------------------------
# 14. Estudio de caso: inflacion en la OCDE, 2019-2021
#     Fuente: Banco Mundial, indicador FP.CPI.TOTL.ZG (Inflation,
#     consumer prices, annual %), API consultado julio de 2026 para
#     los 38 paises miembros de la OCDE.
# --------------------------------------------------------------
inflacion_ocde <- data.frame(
  pais = c("Australia","Austria","Belgium","Canada","Switzerland",
           "Chile","Colombia","Costa Rica","Czechia","Germany",
           "Denmark","Spain","Estonia","Finland","France",
           "United Kingdom","Greece","Hungary","Ireland","Iceland",
           "Israel","Italy","Japan","Korea, Rep.","Lithuania",
           "Luxembourg","Latvia","Mexico","Netherlands","Norway",
           "New Zealand","Poland","Portugal","Slovak Republic",
           "Slovenia","Sweden","Turkiye","United States"),
  y2019 = c(1.611,1.531,1.437,1.949,0.363,2.558,3.523,2.096,
            2.848,1.446,0.758,0.700,2.277,1.024,1.108,1.738,
            0.253,3.339,0.938,3.014,0.818,0.611,0.469,0.383,
            2.335,1.743,2.811,3.636,2.634,2.168,1.620,2.227,
            0.338,2.665,1.631,1.784,15.177,1.812),
  y2020 = c(0.847,1.382,0.741,0.717,-0.726,3.045,2.527,0.725,
            3.161,0.145,0.421,-0.323,-0.445,0.291,0.476,0.989,
            -1.248,3.327,-0.326,2.848,-0.575,-0.138,-0.025,0.537,
            1.200,0.820,0.219,3.397,1.272,1.287,1.715,3.374,
            -0.012,1.937,-0.055,0.497,12.279,1.234),
  y2021 = c(2.864,2.767,2.440,3.395,0.582,4.525,3.495,1.726,
            3.840,3.067,1.853,3.093,4.653,2.195,1.642,2.518,
            1.224,5.111,2.340,4.444,1.480,1.874,-0.233,2.498,
            4.684,2.527,3.276,5.689,2.676,3.484,3.941,5.055,
            1.266,3.150,1.917,2.163,19.596,4.698)
)

cat("\n--- Inflacion OCDE: media y mediana por anio ---\n")
for (col in c("y2019", "y2020", "y2021")) {
  cat(col, "media:", round(mean(inflacion_ocde[[col]]), 2),
      "mediana:", round(median(inflacion_ocde[[col]]), 2), "\n")
}
cat("\nPaises con caida 2019 -> 2020:",
    sum(inflacion_ocde$y2020 < inflacion_ocde$y2019), "de", nrow(inflacion_ocde), "\n")
cat("Paises con subida 2020 -> 2021:",
    sum(inflacion_ocde$y2021 > inflacion_ocde$y2020), "de", nrow(inflacion_ocde), "\n")

png("cap2_inflacion_ocde_covid.png", width = 2400, height = 1200, res = 220)
par(mfrow = c(1, 2), mar = c(4, 4, 3, 1))

# Panel A: boxplots comparativos por anio
boxplot(inflacion_ocde$y2019, inflacion_ocde$y2020, inflacion_ocde$y2021,
        names = c("2019", "2020", "2021"),
        col = c("steelblue", "firebrick", "seagreen"),
        main = "Panel A: Inflacion anual, paises OCDE",
        ylab = "Inflacion (%, IPC, promedio anual)")
abline(h = 0, lty = 2, col = "gray50")

# Panel B: dispersion 2020 vs 2019 con linea de 45 grados
plot(inflacion_ocde$y2019, inflacion_ocde$y2020,
     pch = 19, col = "steelblue",
     xlim = c(-2, 16), ylim = c(-2, 16),
     xlab = "Inflacion 2019 (%)", ylab = "Inflacion 2020 (%)",
     main = "Panel B: 2020 vs. 2019 por pais")
abline(a = 0, b = 1, col = "firebrick", lwd = 2, lty = 2)
text(12, 14, "linea de 45:\nsin cambio", col = "firebrick", cex = 0.8)

dev.off()
cat("\nFigura exportada: cap2_inflacion_ocde_covid.png\n")
