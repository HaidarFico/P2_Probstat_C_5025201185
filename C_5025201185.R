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
# install.packages("BSDA")
# library("BSDA")
t.test(Table$y - Table$x, alternative = "two.sided", var.equal = TRUE)

# Soal 2
# 2 a terdapat pada README

# 2 b
tsum.test(mean.x=23500, sd(3900), n.x=100)

# 2 c terdapat pada README
