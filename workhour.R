library(readxl)

ubs <- read_excel("data/ubs.xlsx", sheet = 1, col_names = F)
ubs <- ubs[ubs$X2 == "Earnings: Working hours and vacation days (average)",]
ubs <- ubs[ubs$X3 == "Work per year (hours)",]

city <- unique(ubs$X1)
city <- city[order(city)]
city

df <- ubs[ubs$X0 == "2012",]
rownames(df) <- c(1:nrow(df))
df <- df[-nrow(df),]
df$city[3] <- "New Zealand"
colnames(df) <- c("year", "city", "type", "unit", "workhour","country")
write.csv(df, file = "data/workhr2012.csv")

df <- tapply(df$workhour, df$country, mean)
