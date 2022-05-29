<br>
Nama: Haidar Fico Ramadhan Aryputra
NRP: 5025201185
Kelas: Probabilitas Statistik C
</br>
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
![image](https://user-images.githubusercontent.com/7030663/170884746-6e050c81-60d8-48a7-89bf-ad1cd0a368bb.png)
## 1 b
Untuk mencari p-value menggunakan kode sebagai berikut:
```
t.test(x, y, alternative = "greater", var.equal = FALSE)
```
Menggunakan fungsi t.test untuk mendapat p-value sehingga mendapat hasil:
![image](https://user-images.githubusercontent.com/7030663/170884763-a94dbd61-00e1-43bc-a386-7be36f6fd677.png)
## 1 c
Dengan menggunakan kode ini:
```
t.test(Table$y - Table$x, alternative = "two.sided", var.equal = TRUE)
```
Akan mendapatkan hasil berupa:
![image](https://user-images.githubusercontent.com/7030663/170885773-f0fa5a67-a3a8-4b58-a660-8facec87a981.png)


# Soal 2
![image](https://user-images.githubusercontent.com/7030663/170884838-ee2fa84b-f5d4-4aa7-84e0-19d952fd4f58.png)
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
![image](https://user-images.githubusercontent.com/7030663/170884852-a08a25ce-066f-4cf7-a415-a7a39815d9e2.png)
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
![image](https://user-images.githubusercontent.com/7030663/170884879-0f87c69c-f792-4073-abf9-746e262c6808.png)

## 3 b
Dengan menggunakan:
```
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, mean.y =2.79 , s.y = 1.32, n.y = 27, alternative = "greater", var.equal = TRUE)
```
mendapatkan hasil:
![image](https://user-images.githubusercontent.com/7030663/170884909-a742a282-8a8d-4bd4-b661-97bcb72fb1b9.png)
## 3 c
Dengan menggunakan library mosaic akan menggunakan kode sebagai berikut:
```
install.packages("mosaic")
library(mosaic)
plotDist(dist='t', df=2, col="black")
```
Sehingga akan mendapatkan hasil sebagai berikut:
![image](https://user-images.githubusercontent.com/7030663/170884928-cfc9d7e2-4079-4c4d-a912-92d76f3e071f.png)

## 3 d
Dengan menggunakan kode:
```
qchisq(p = 0.05, df = 2, lower.tail = FALSE)
```
Sehingga akan mendapatkan hasil:
![image](https://user-images.githubusercontent.com/7030663/170884938-134e4859-4ac0-4ab3-ad92-a4d90f3b2d06.png)
## 3 e
Sesuai dengan teori, karena p-value < a, sehingga hipotesis pertama ditolak.

## 3 f
Rata-rata saham di Bandung tidak sama dengan rata-rata saham di Bali

# Soal 4
## 4 a
Mengimport data menggunakan kode seperti ini:
```
dataRead <- read.table("onewayanova.txt",h=T)
attach(dataRead)
names(dataRead)

dataRead$Group <- as.factor(dataRead$Group)
dataRead$Group = factor(dataRead$Group,labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih"))

class(dataRead$Group)

#4 a

Group1 <- subset(dataRead, Group == "Kucing Oren")
Group2 <- subset(dataRead, Group == "Kucing Hitam")
Group3 <- subset(dataRead, Group == "Kucing Putih")

qqnorm(Group1$Length)
qqline(Group1$Length)

qqnorm(Group2$Length)
qqline(Group2$Length)

qqnorm(Group2$Length)
qqline(Group2$Length)
```
Setelah itu, akan digrup sesuai kategori-kategorinya.
# 4 b
Dengan menggunakan kode
```
bartlett.test(Length ~ Group, data = dataRead)
```
Akan membuahkan hasil:
![image](https://user-images.githubusercontent.com/7030663/170886064-26e2a541-2193-4535-8570-fe6c99f169b2.png)
# 4 c
Dengan menggunakan kode
```
model1 = lm(Length ~ Group, data = dataRead)
anova(model1)
```
Akan mendapat hasil:
![image](https://user-images.githubusercontent.com/7030663/170886089-0ed047c3-f503-4a31-8ccb-f3acacf1d254.png)
# 4 d
Dari percobaan ini, mendapat nilai p 0.8054. Selain itu, dapat disimpulkan bahwa kategori yang pertama memiliki
panjang yang lebih besar dari yang lain.
# 4 e
Menggunakan kode:
```
TukeyHSD(aov(model1))
```
Akan mendapat hasil:
![image](https://user-images.githubusercontent.com/7030663/170886192-77f55fb2-a0ee-4c6c-8f8a-b11d8b6ae241.png)
# 4 f
Dengan menggunakan kode:
```
library(ggplot2)
ggplot(dataRead, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", colour = "black") + scale_x_discrete() + xlab("Grup") +  ylab("Panjang")
```
Akan mendapatkan hasil:
![image](https://user-images.githubusercontent.com/7030663/170886296-eea6bdb0-eb60-4676-8317-08b2817b1b8b.png)



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
![image](https://user-images.githubusercontent.com/7030663/170884972-82d30186-362e-46d4-9797-a0b9879c49a2.png)
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
![image](https://user-images.githubusercontent.com/7030663/170885716-9ea8ad82-0b96-4ea9-af18-058ebace44df.png)

## 5 c 
Dengan kode ini:
```
data_summary <- group_by(GTLImport, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)
```
mendapat hasil sebagai berikut:
![image](https://user-images.githubusercontent.com/7030663/170885039-346bbec1-0c45-4195-a485-a7ac25cf864a.png)
## 5 d
Dengan kode ini:
```
tukeyRes <- TukeyHSD(anova)
tukeyRes
```
Mendapat hasil sebagai berikut:
![image](https://user-images.githubusercontent.com/7030663/170885738-9780a38d-a581-4945-8e50-710ce9202d35.png)

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
![image](https://user-images.githubusercontent.com/7030663/170885063-4e49f872-9bc5-4a0c-9b0f-91633e633e68.png)
