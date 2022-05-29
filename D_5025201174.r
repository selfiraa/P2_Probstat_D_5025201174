x <- c(78,75,67,77,70,72,78,74,77)
y <- c(100,95,70,90,90,90,89,90,100)

#1a
sel <- y - x
sd(sel, na.rm = FALSE)

#res: 6.359595

#1b
t.test(y, x,  paired = TRUE)

#res: μ x - y = 16.22222

#1c
qt(p = 0.025, df = 8, lower.tail = FALSE)
#res: 2.306004

#2a
library(BSDA)

zsum.test(mean.x=23500, sigma.x=3900, n.x=100, alternative="greater", mu=20000)

#res: μ km = 23500
#karena hasil μ lebih dari 20000, maka klaim disetujui

#2b. Berdasarkan output yang dihasilkan, dengan keyakinan 95% H0 ditolak/terdapat cukup bukti di mana rata-rata secara signifikan lebih besar dari 20000.

#2c. P-value yang dihasilkan sangat kecil sehingga H0 ditolak.

#3a
H0: μ Bali = μ Bandung
H1: μ Bali ≠ μ Bandung

#3b
library(BSDA)
tsum.test(mean.x = 3.64, s.x = 1.67, n.x = 19, mean.y = 2.79, s.y = 1.32, n.y = 27, conf.level = 0.95)

#3c
sp2 <- (((27 - 1)*(1.32)^2) + ((19 - 1)*(1.67)^2))/(27 + 19 - 2)
sp <- sqrt(sp2)
x2 <- (1/27) + (1/19)
x <- sqrt(x2)
t <- (2.79 - 3.64)/(sp*x)

#val: -1.926715

#3d
qt(p = 0.025, df = 2, lower.tail = FALSE)

#val: (-4.302653, 4.302653)

#3e. Hasil uji terletak di interval nilai kritikal, maka H0 tidak ditolak/sample tidak memiliki cukup bukti yang bertentangan dengan H0.

#3f. Berdasarkan hasil pengujian, diyakini 95% bahwa rata-rata saham di Bali dan di Bandung adalah sama.

#4a
df4 <- read.delim("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt")
library(ggpubr)
ggboxplot(df4, x = "Group", y = "Length", color = "Group", ylab = "Length", xlab = "Group")

#4b
library(onewaytests)
bartlett.test(Length ~ Group, data = df4)

#4c
Model1 <- lm(formula = Group ~ Length, data = df4)
print(Model1)

#4d
summary(Model1)$coefficients[2,4]

#5a
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)
GTL <- read_csv("https://drive.google.com/u/0/uc?id=1aLUOdw_LVJq6VQrQEkuQhZ8FW43FemTJ&export=download")
head(GTL)
str(GTL)
qplot(x = Temp, y = Light, geom = "point", data = GTL) + facet_grid(.~Glass, labeller = label_both)

#5b
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

#5c
data_summary <- group_by(GTL, Glass, Temp) %>% summarise(mean=mean(Light), sd=sd(Light)) %>% arrange(desc(mean))
print(data_summary)

#5d
tukey <- TukeyHSD(anova)
print(tukey)

#5e
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)
cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)
