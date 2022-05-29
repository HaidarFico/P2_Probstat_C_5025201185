# Soal 1
## 1a 
Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas
## Jawab
Pengerjaan soal ini dengan menggunakan kode:
```
# Membuat Tabel
Responden = c(1, 2, 3, 4, 5, 6, 7, 8, 9)
x = c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y = c(100, 95, 70, 90, 90, 90, 89, 90, 100)
Table = data.frame(Responden, x, y)

# 1 a
standar_deviasi = sd(Table$x-Table$y)
standar_deviasi
```
Pertama dengan menggunakan c untuk membuat "array" yang nanti akan digabung dalam
table. Setelah itu akan mencari standar deviasi dengan menggunakan fungsi sd. Dari itu
mendapat hasil berupa:
TODO FOTO
## 1 b
Untuk mencari p-value menggunakan kode sebagai berikut:
```
t.test(x, y, alternative = "greater", var.equal = FALSE)
```
Menggunakan fungsi t.test untuk mendapat p-value sehingga mendapat hasil:
TODO FOTO
## 1 c
TODO

# Soal 2
TODO KASIH FOTO
## 2 a
Setuju, karena hasil dari z tidak mengikuti hasil dari h0. Sehingga mobil memiliki rata-rata lebih dari 20000 km/tahun

## 2 b
Output dari Z test adalah antara mean yang benar lebih dari 20000 atau h1 dianggap sebagai yang benar

## 2 c
Kode yang dipakai adalah:
```
zValueSecond = (23500-20000)/(3900/sqrt(100))
2 * pnorm(-abs(zValueSecond))
```
Dari ini mendapat P yang berupa:
TODO FOTO
Karena P-Value mendekati 0, sehingga h1 diterima.

# Soal 3
## 3 a
Dengan menggunakan kode sebagai berikut:
```
h0 = (3.64)/(1.67/sqrt(19))
h1 = (2.79)/(1.32/sqrt(27))
h0
h1
```
Kita dapat mengetahui h0 dan h1:
TODO FOTO

## 3 b
Dengan menggunakan:
```
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, mean.y =2.79 , s.y = 1.32, n.y = 27, alternative = "greater", var.equal = TRUE)
```
mendapatkan hasil:
TODO FOTO
## 3 c
Dengan menggunakan library mosaic akan menggunakan kode sebagai berikut:
```
install.packages("mosaic")
library(mosaic)
plotDist(dist='t', df=2, col="blue")
```
Sehingga akan mendapatkan hasil sebagai berikut:
TODO FOTO

## 3 d
Dengan menggunakan kode:
```
qchisq(p = 0.05, df = 2, lower.tail = FALSE)
```
Sehingga akan mendapatkan hasil:
TODO FOTO
## 3 e
Sesuai dengan teori, karena p-value < a, sehingga hipotesis pertama ditolak.

## 3 f
Rata-rata saham di Bandung tidak sama dengan rata-rata saham di Bali

# Soal 4
# Soal 5
## 5 a
dengan kode ini:
```
install.packages("multcompView")
library(dplyr)
library(ggplot2)
library(readr)
library(multcompView)


GTLImport <- read_csv("GTL.csv")
head(GTLImport)
str(GTL)

qplot(x = Temp, y = Light, geom = "point", data = GTLImport) +
  facet_grid(.~Glass, labeller = label_both)
```
Mendapat hasil sebagai berikut:
TODO FOTO
## 5 b
Dengan kode ini:
```
GTL$Glass <- as.factor(GTLImport$Glass)
GTL$Temp_Factor <- as.factor(GTLImport$Temp)
str(GTLImport)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTLImport)
summary(anova)
```
mendapat hasil sebagai berikut:
TODO FOTO
## 5 c 
Dengan kode ini:
```
data_summary <- group_by(GTLImport, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)
```
mendapat hasil sebagai berikut:
TODO FOTO
## 5 d
Dengan kode ini:
```
tukeyRes <- TukeyHSD(anova)
tukeyRes
```
## 5 e
Dengan kode ini:
```
tukeyCLD <- multcompLetters4(anova, tukey)
print(tukeyCLD)

CLD <- as.data.frame.list(tukeyCLD$`Glass:Temp_Factor`)
data_summary$tukeyCLD <- CLD$Letters
print(data_summary)

write.csv("GTL_summary.csv")
```
Mendapat hasil sebagai berikut:
TODO FOTO