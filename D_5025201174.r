x <- c(78,75,67,77,70,72,78,74,77)
y <- c(100,95,70,90,90,90,89,90,100)

#1a
sel <- y - x
sd(sel, na.rm = FALSE)

#res: 6.359595

#1b
t.test(y, x,  paired = TRUE)

#res: μ x - y = 16.22222

#2a.
library(BSDA)

zsum.test(mean.x=23500, sigma.x=3900, n.x=100, alternative="greater", mu=20000)

#res: μ km = 23500
#karena hasil μ lebih dari 20000, maka klaim disetujui

#2b. di readme

#2c. di readme

#3a. H0 dan H1
H0: μ Bali = μ Bandung
H1: μ Bali ≠ μ Bandung

#3b. Hitung sample statistik
library(BSDA)
tsum.test(mean.x = 3.64, s.x = 1.67, n.x = 19, mean.y = 2.79, s.y = 1.32, n.y = 27, conf.level = 0.95)

#3c. Lakukan uji statistik (df = 2)
sp2 <- (((27 - 1)*(1.32)^2) + ((19 - 1)*(1.67)^2))/(27 + 19 - 2)
sp <- sqrt(sp2)
x2 <- (1/27) + (1/19)
x <- sqrt(x2)
t <- (2.79 - 3.64)/(sp*x)

#val: -1.926715

#3d. Nilai kritikal
qt(p = 0.025, df = 2, lower.tail = FALSE)

#val: (-4.302653, 4.302653)

#3e. di readme

#3f. di readme

