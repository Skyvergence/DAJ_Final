library(readxl)
library(dplyr)
library(ggplot2)
library(ggthemes)

##### Import Data #####
math <- read.csv("data/ESCSMath_2012.csv", header = T)
science <- read.csv("data/ESCSScienceLiteracy_2012.csv", header = T)
reading <- read.csv("data/ESCSReadingLiteracy_2012.csv", header = T)


##### PRIDE data: Math lower than level 2 #####
math_l2 <- read_excel("data/Math_percentage_0312.xls", sheet = 4, col_names = F)
math_l2 <- math_l2[10:78,]
math_l2 <- math_l2[-c(1,48-11+1),]
math_l2 <- math_l2[,-ncol(math_l2)]

math_l2$X2[math_l2$X2 == "m"] <- NA
math_l2$X3[math_l2$X3 == "m"] <- NA
math_l2$X4[math_l2$X4 == "m"] <- NA
math_l2$X5[math_l2$X5 == "m"] <- NA

colnames(math_l2) <- c("Ed_system","2003","2006","2009","2012")
rownames(math_l2) <- 1:nrow(math_l2)

math_l2 <- math_l2[-c(35:37),]
math_l2 <- math_l2[1:64,]
rownames(math_l2) <- 1:nrow(math_l2)


##### PRIDE data: Math higher than level 5 #####
math_t5 <- read_excel("data/Math_percentage_0312.xls", sheet = 5, col_names = F)
math_t5 <- math_t5[11:78,]


math_t5$X2[math_t5$X2 == "m"] <- NA
math_t5$X3[math_t5$X3 == "m"] <- NA
math_t5$X4[math_t5$X4 == "m"] <- NA
math_t5$X5[math_t5$X5 == "m"] <- NA

colnames(math_t5) <- c("Ed_system","2003","2006","2009","2012")
rownames(math_t5) <- 1:nrow(math_t5)

math_t5 <- math_t5[-c(35:38),]
rownames(math_t5) <- 1:nrow(math_t5)


##### PRIDE data: Science lower than level 2 #####
science_l2 <- read_excel("data/Science_percentage_0012.xls", sheet = 4, col_names = F)
science_l2 <- science_l2[9:75,]

science_l2$X2[science_l2$X2 == "m"] <- NA
science_l2$X3[science_l2$X3 == "m"] <- NA
science_l2$X4[science_l2$X4 == "m"] <- NA


colnames(science_l2) <- c("Ed_system","2006","2009","2012")
rownames(science_l2) <- 1:nrow(science_l2)

science_l2 <- science_l2[-c(35:37),]
rownames(science_l2) <- 1:nrow(science_l2)


##### PRIDE data: Science higher than level 5 #####
science_t5 <- read_excel("data/Science_percentage_0012.xls", sheet = 5, col_names = F)
science_t5 <- science_t5[10:76,]

science_t5$X2[science_t5$X2 == "m"] <- NA
science_t5$X3[science_t5$X3 == "m"] <- NA
science_t5$X4[science_t5$X4 == "m"] <- NA


colnames(science_t5) <- c("Ed_system","2006","2009","2012")
rownames(science_t5) <- 1:nrow(science_t5)

science_t5 <- science_t5[-c(35:37),]
rownames(science_t5) <- 1:nrow(science_t5)

##### PRIDE data: Reading lower than level 2 #####
reading_l2 <- read_excel("data/Reading_percentage_0012.xls", sheet = 4, col_names = F)
reading_l2 <- reading_l2[11:79,]

reading_l2$X2[reading_l2$X2 == "m"] <- NA
reading_l2$X3[reading_l2$X3 == "m"] <- NA
reading_l2$X4[reading_l2$X4 == "m"] <- NA
reading_l2$X5[reading_l2$X5 == "m"] <- NA
reading_l2$X6[reading_l2$X6 == "m"] <- NA


colnames(reading_l2) <- c("Ed_system","2000","2003","2006","2009","2012")
rownames(reading_l2) <- 1:nrow(reading_l2)

reading_l2 <- reading_l2[-c(35:39),]
rownames(reading_l2) <- 1:nrow(reading_l2)

##### PRIDE data: Reading higher than level 5 #####
reading_t5 <- read_excel("data/Reading_percentage_0012.xls", sheet = 5, col_names = F)
reading_t5 <- reading_t5[11:79,]

reading_t5$X2[reading_t5$X2 == "m"] <- NA
reading_t5$X3[reading_t5$X3 == "m"] <- NA
reading_t5$X4[reading_t5$X4 == "m"] <- NA
reading_t5$X5[reading_t5$X5 == "m"] <- NA
reading_t5$X6[reading_t5$X6 == "m"] <- NA


colnames(reading_t5) <- c("Ed_system","2000","2003","2006","2009","2012")
rownames(reading_t5) <- 1:nrow(reading_t5)

reading_t5 <- reading_t5[-c(35:39),]
rownames(reading_t5) <- 1:nrow(reading_t5)





##### gini of asia development #####
gini_asia <- read_excel("data/asia_gini.xls", sheet = 1, col_names = F)
gini_asia <- gini_asia[11:59,]
gini_asia <- gini_asia[,-1]
colnames(gini_asia) <- c("Country", 1990:2013)
rownames(gini_asia) <- c(1:nrow(gini_asia))
gini_asia[1,2:ncol(gini_asia)] <- as.character(gini_asia[1, 2:ncol(gini_asia)])
gini_asia <- gini_asia[-1,]
rownames(gini_asia) <- c(1:nrow(gini_asia))

# gini_asia[1,7] <- as.character(strsplit(gini_asia[1,7], split = "\\.")[[1]][1])
# gini_asia[1,"2012"] <- as.character(strsplit(gini_asia[1,"2012"], split = "\\.")[[1]][1])

##### gini of world bank #####
gini_wb <- read_excel("data/world_bank_gini.xls", sheet = 1, col_names = F)
gini_wb <- gini_wb[-c(1:3),]
colnames(gini_wb) <- gini_wb[1,]
gini_wb <- gini_wb[-1,]
rownames(gini_wb) <- 1:nrow(gini_wb)


##### Education resources (Primary pupil–teacher ratio) #####
primary_ratio <- read_excel("data/primary_ratio.xls", sheet = 1, col_names = F)
primary_ratio <- primary_ratio[10:58,]
primary_ratio <- primary_ratio[,-1]
colnames(primary_ratio) <- c("region", 1990:2013)
rownames(primary_ratio) <- 1:nrow(primary_ratio)
primary_ratio <- primary_ratio[-1,]
rownames(primary_ratio) <- 1:nrow(primary_ratio)

##### Education resources (Secondary pupil–teacher ratio) #####
secondary_ratop <- read_excel("data/secondary_ratio.xls", sheet = 1, col_names = F)
secondary_ratop <- secondary_ratop[10:58,]
secondary_ratop <- secondary_ratop[,-1]
colnames(secondary_ratop) <- c("region", 1990:2013)
rownames(secondary_ratop) <- 1:nrow(secondary_ratop)
secondary_ratop <- secondary_ratop[-1,]
rownames(secondary_ratop) <- 1:nrow(secondary_ratop)




##### Combine working hour with other data #####
workhr2012 <- read_csv("C:/Users/Leo/Desktop/R105/R105/Final_Project/data/workhr2012.csv")
workhr2012$workhour <- as.numeric(workhr2012$workhour)
data <- data.frame("country" = workhr2012$country, "workhour" = workhr2012$workhour)
data <- tapply(data$workhour, data$country, mean)
data <- data.frame(data)
data$country <- rownames(data)
data$workhour12 <- data$data
data <- data[,-1]
rownames(data) <- c(1:nrow(data))

pisa2012 <- read_csv("C:/Users/Leo/Desktop/R105/R105/Final_Project/data/PISA2012.csv")
colnames(pisa2012) <- c("country", "reading", "math", "science")
data <- inner_join(data, pisa2012, c("country" = "country"))
data <- inner_join(data, math_l2, c("country" = "Ed_system"))
data <- data[,-c((ncol(data)-3):(ncol(data)-1))]
colnames(data) <- c("country","workhour12","reading","math","science","math_l2")

data <- inner_join(data, math_t5, c("country" = "Ed_system"))
data <- data[,-c((ncol(data)-3):(ncol(data)-1))]
colnames(data) <- c("country","workhour12","reading","math","science","math_l2", "math_t5")

data <- inner_join(data, reading_l2, c("country" = "Ed_system"))
data <- data[,-c((ncol(data)-4):(ncol(data)-1))]
colnames(data) <- c("country","workhour12","reading","math","science",
                    "math_l2", "math_t5",
                    "reading_l2")

data <- inner_join(data, reading_t5, c("country" = "Ed_system"))
data <- data[,-c((ncol(data)-4):(ncol(data)-1))]
colnames(data) <- c("country","workhour12","reading","math","science",
                    "math_l2", "math_t5",
                    "reading_l2", "reading_t5")

data <- inner_join(data, science_l2, c("country" = "Ed_system"))
data <- data[,-c((ncol(data)-2):(ncol(data)-1))]
colnames(data) <- c("country","workhour12","reading","math","science",
                    "math_l2", "math_t5",
                    "reading_l2", "reading_t5",
                    "science_l2")

data <- inner_join(data, science_t5, c("country" = "Ed_system"))
data <- data[,-c((ncol(data)-2):(ncol(data)-1))]
colnames(data) <- c("country","workhour12","reading","math","science",
                    "math_l2", "math_t5",
                    "reading_l2", "reading_t5",
                    "science_l2", "science_t5")
data$science_t5 <- as.numeric(data$science_t5)

##### Correlation test #####
cor.test(data$math, data$workhour12)
cor.test(data$reading, data$workhour12)
cor.test(data$science, data$workhour12)


cor.test(data$math_l2, data$workhour12)
cor.test(data$math_t5, data$workhour12)

cor.test(data$reading_l2, data$workhour12)
cor.test(data$reading_t5, data$workhour12)

cor.test(data$science_l2, data$workhour12)
cor.test(data$science_t5, data$workhour12)

##### Math score vs working hour #####
cor.test(data$math, data$workhour12)
ggplot(data, aes(x=workhour12, y=math)) +
    geom_point(shape=1) +
    geom_smooth(method=lm)+
    xlab("Working Hour") +
    ylab("Math Score") +
    labs(title = "PISA Math Score and Working Hour" ) + 
    theme(plot.title = element_text(lineheight=.8, face="bold")) +
    theme_few()




##### Reading score vs working hour #####
cor.test(data$reading, data$workhour12)
ggplot(data, aes(x=workhour12, y=reading)) +
    geom_point(shape=1) +
    geom_smooth(method=lm)+
    xlab("Working Hour") +
    ylab("Reading Score") +
    labs(title = "PISA Reading Score and Working Hour" ) + 
    theme(plot.title = element_text(lineheight=.8, face="bold")) +
    theme_few()


##### Science score vs working hour #####
cor.test(data$science, data$workhour12)
ggplot(data, aes(x=workhour12, y=science)) +
    geom_point(shape=1) +
    geom_smooth(method=lm)+
    xlab("Working Hour") +
    ylab("Science Score") +
    labs(title = "PISA Science Score and Working Hour" ) + 
    theme(plot.title = element_text(lineheight=.8, face="bold")) +
    theme_few()


##### PISA Math below level 2 and Working Hour
ggplot(data, aes(x=workhour12, y=math_l2)) +
    geom_point(shape=1) +
    geom_smooth(method=lm)+
    xlab("Working Hour") +
    ylab("Percentage of students below Level 2 in mathematics in PISA") +
    labs(title = "PISA Math below level 2 and Working Hour" ) + 
    theme(plot.title = element_text(lineheight=.8, face="bold")) +
    theme_few()


##### PISA Science below level 2 and Working Hour
ggplot(data, aes(x=workhour12, y=science_l2)) +
    geom_point(shape=1) +
    geom_smooth(method=lm)+
    xlab("Working Hour") +
    ylab("Percentage of students below Level 2 in science in PISA") +
    labs(title = "PISA Science below level 2 and Working Hour" ) + 
    theme(plot.title = element_text(lineheight=.8, face="bold")) +
    theme_few()


##### PISA Reading below level 2 and Working Hour
ggplot(data, aes(x=workhour12, y=reading_l2)) +
    geom_point(shape=1) +
    geom_smooth(method=lm)+
    xlab("Working Hour") +
    ylab("Percentage of students below Level 2 in reading in PISA") +
    labs(title = "PISA Reading below level 2 and Working Hour" ) + 
    theme(plot.title = element_text(lineheight=.8, face="bold")) +
    theme_few()


hist(data$math)
hist(data$science)
hist(data$reading)
hist(data$workhour12)

summary(data)
