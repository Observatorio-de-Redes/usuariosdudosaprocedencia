source("https://github.com/Guadag12/prubea/raw/master/features-exp.R")
source("https://github.com/mkearney/tweetbotornot/raw/master/R/features.R")
source("https://github.com/mkearney/tweetbotornot/raw/master/R/since_last.R")
load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/FOPEA_PROJ/sysdata.rda")
source("https://github.com/mkearney/tweetbotornot/raw/master/R/utils-pipe.R")
source("https://github.com/mkearney/tweetbotornot/raw/master/R/utils.R")
source("https://github.com/mkearney/tweetbotornot/raw/master/R/tweetbotornot.R")

install.packages("textfeatures")
install.packages("gbm")
base_usuarios <- read_csv("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/top_100_tweeteadores.csv")
base_usuarios <- read_csv("df_usuarios.csv")
library(textfeatures)
library(gbm)
library(tidyverse)
library("ROAuth")
library("httr")
library("foreign")
library("twitteR")
library(tidyverse)
library(splitstackshape)
library("tidyverse")
library("sqldf")
library("ROAuth")
library("httr")
library("foreign")
library("twitteR")
library(tidyverse)
library(splitstackshape)
library(sqldf)
library("rtweet")
library("rtweet")

# 2. Nos conectamos a R - (si no funcionan tus credenciales, usa las mias)

#Cambiar el directorio de trabajo#

#Conectarse a Twitter - para esto tienen que tener creada la aplicaci?n en TW#
options(RCurlOptions = list( capath = system.file("CurlSSL", "cacert.pem", package = "RCurl"), ssl.verifypeer = FALSE))
reqURL<-"https://api.twitter.com/oauth/request_token"
accessURL<-"https://api.twitter.com/oauth/access_token"
authURL<-"https://api.twitter.com/oauth/authorize"
consumerKey<-"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" #clave que se da cuando se genera la app individual en Twitter
consumerSecret<-"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" #Idem
access_token <- "xxxxxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
access_secret <- "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
setup_twitter_oauth(consumerKey, consumerSecret, access_token, access_secret)
1
appname <- "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
token <- create_token(app =  appname, consumer_key = consumerKey , 
                      consumer_secret = consumerSecret,
                      access_token = access_token,
                      access_secret = access_secret)
base_usuarios<- sample(son_tweets, size = 180, replace = T)
df <- base_usuarios[1:180,]

df <- as.character(df$screen_name)
a = length(df)

j = 1
data_v <- data
while (j <= length(df)) {
  i <- df[j]
  data <- tweetbotornot(i, fast = F)
  data_v <- append(data_v, data)
  print(i)
  j <- j + 1  
  
  if(j%%180 == 0) {
  print ('Estoy durmiendo la siesta')
  Sys.sleep(960)
  }
}

df_1 <- as.data.frame(do.call(rbind, data_v))

df <- cbind(newColName = rownames(df), df)
rownames(df) <- 1:nrow(df)

df$newColName <- gsub(pattern = "[.][0-9]+", replacement = "", x = df$newColName)
df

df <- df %>% mutate(df, ID = row_number())
df <- df[,1:3]
names(df)
data_bot <- spread(data = df, key = newColName, value = V1)

d_b <- data_bot %>%
  mutate(bot_not = case_when(
        prob_bot >= 0.6 ~ "bot",
        prob_bot <= 0.6 ~ "not_bot",
        TRUE ~ "not_go")) %>%
  filter(bot_not == "bot" | bot_not == "not_bot")

d_b <- d_b %>%
  group_by(bot_not) %>%
  summarise(cantidad = table(bot_not),
            porcentaje = prop.table(cantidad))
prop.table(d_b$cantidad)

j = 1
j_ant = 1
data_v <- c()
while (j <= length(df)) {
  i <- df[j]
  data <- tweetbotornot(i, fast = F)
  data_v <- append(data_v, data)
  print(i)
  j <- j + 1  
  
  if(j - j_ant == 180) {
    print ('Estoy durmiendo la siesta')
    j_ant <- j
    Sys.sleep(960)
  }
}




