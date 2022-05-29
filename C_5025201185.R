# Soal 1

# Membuat Tabel
Responden = c(1, 2, 3, 4, 5, 6, 7, 8, 9)
x = c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y = c(100, 95, 70, 90, 90, 90, 89, 90, 100)
Table = data.frame(Responden, x, y)

# 1 a
standar_deviasi = sd(Table$x-Table$y)
standar_deviasi

# 1 b
t.test(x, y, alternative = "greater", var.equal = FALSE)

# 1 c
install.packages("BSDA")
library("BSDA")
t.test(Table$y - Table$x, alternative = "two.sided", var.equal = TRUE)

# Soal 2
# 2 a terdapat pada README

# 2 b
tsum.test(mean.x=23500, sd(3900), n.x=100)

# 2 c
# Find z value
zValueSecond = (23500-20000)/(3900/sqrt(100))
2 * pnorm(-abs(zValueSecond))

# Soal 3
# 3 a 
h0 = (3.64)/(1.67/sqrt(19))
h1 = (2.79)/(1.32/sqrt(27))
h0
h1

# 3 b
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, mean.y =2.79 , s.y = 1.32, n.y = 27, alternative = "greater", var.equal = TRUE)

# 3 c
install.packages("mosaic")
library(mosaic)
plotDist(dist='t', df=2, col="black")

# 3 d
qchisq(p = 0.05, df = 2, lower.tail = FALSE)

# 3 e
# Terdapat di README

# 3 f
# Terdapat di README

# Soal 4
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

# 4 b
bartlett.test(Length ~ Group, data = dataRead)

# 4 c
model1 = lm(Length ~ Group, data = dataRead)
anova(model1)

# 4 d terdapat pada readme

# 4 e
TukeyHSD(aov(model1))

# 4 f
library(ggplot2)
ggplot(dataRead, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", colour = "black") + scale_x_discrete() + xlab("Grup") +  ylab("Panjang")
# Soal 5
# 5 a
# Soal 5 a
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

# Soal 5 b
GTLImport$Glass <- as.factor(GTLImport)
GTLImport$Temp_Factor <- as.factor(GTLImport$Temp)
str(GTL)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTLImport)
summary(anova)

# Soal 5 c
data_summary <- group_by(GTLImport, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)

# Soal 5 d
tukey <- TukeyHSD(anova)
print(tukey)


# Soal 5 e
tukeyCLD <- multcompLetters4(anova, tukey)
print(tukeyCLD)

CLD <- as.data.frame.list(tukeyCLD$`Glass:Temp_Factor`)
data_summary$tukeyCLD <- CLD$Letters
print(data_summary)

write.csv("GTL_summary.csv")
