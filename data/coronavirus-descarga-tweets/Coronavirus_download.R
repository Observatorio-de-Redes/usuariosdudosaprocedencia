  ###########################0603
  
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
  setwd("D:/Guada/Ad Hoc/Difusion redes/Coronavirus/abril_2020/")
  
  #Conectarse a Twitter - para esto tienen que tener creada la aplicacion en TW#
  options(RCurlOptions = list( capath = system.file("CurlSSL", "cacert.pem", package = "RCurl"), ssl.verifypeer = FALSE))
  reqURL<-"https://api.twitter.com/oauth/request_token"
  accessURL<-"https://api.twitter.com/oauth/access_token"
  authURL<-"https://api.twitter.com/oauth/authorize"
  consumerKey<-"xxxxxxxxxxxxxxxxx" #clave que se da cuando se genera la app individual en Twitter
  consumerSecret<-"xxxxxxxxxxxxxxxxx" #Idem
  access_token <- "xxxxxxxxxxxxxxxxx-xxxxxxxxxxxxxxxxx"
  access_secret <- "xxxxxxxxxxxxxxxxx"
  setup_twitter_oauth(consumerKey, consumerSecret, access_token, access_secret)
  1

yesterday <- Sys.Date()-1 ##la fecha de ayer
today <- Sys.Date() ##la fecha de ayer##fecha de hoy


tmp.env <- new.env()
tmp.env$tweets.nm1 <- searchTwitter("#CoronavirusArgentina", n=40000, 
                                    since = paste0(yesterday), until = paste0(today) )
tweetsdf_a <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "#CoronavirusArgentina")
rm(tmp.env) 
save.image(file = paste0('D:/Guada/Ad Hoc/Difusion redes/Coronavirus/abril_2020/tweets/Tweets_', 
                         yesterday, '.RData'))


tmp.env <- new.env()
tmp.env$tweets.nm1 <- searchTwitter("#COVID19Argentina", n=40000, 
                                    since = paste0(yesterday), until = paste0(today) )
tweetsdf_b <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "#COVID19Argentina")
rm(tmp.env) 
save.image(file = paste0('D:/Guada/Ad Hoc/Difusion redes/Coronavirus/abril_2020/tweets/Tweets_', 
                         yesterday, '.RData'))

tmp.env <- new.env()
tmp.env$tweets.nm1 <- searchTwitter("#Quedateencasa", n=40000, 
                                    since = paste0(yesterday), until = paste0(today) )
tweetsdf_c <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "#Quedateencasa")
rm(tmp.env) 
save.image(file = paste0('D:/Guada/Ad Hoc/Difusion redes/Coronavirus/abril_2020/tweets/Tweets_', 
                         yesterday, '.RData'))

tmp.env <- new.env()
tmp.env$tweets.nm1 <- searchTwitter("#Quedateentucasa", n=40000, 
                                    since = paste0(yesterday), until = paste0(today) )
tweetsdf_d <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "#Quedateentucasa")
rm(tmp.env) 
save.image(file = paste0('D:/Guada/Ad Hoc/Difusion redes/Coronavirus/abril_2020/tweets/Tweets_', 
                         yesterday, '.RData'))
tmp.env <- new.env()
tmp.env$tweets.nm1 <- searchTwitter("#CuarentenaObligatoria", n=40000, 
                                    since = paste0(yesterday), until = paste0(today) )
tweetsdf_e <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "#CuarentenaObligatoria")
rm(tmp.env) 
save.image(file = paste0('D:/Guada/Ad Hoc/Difusion redes/Coronavirus/abril_2020/tweets/Tweets_', 
                         yesterday, '.RData'))

tmp.env <- new.env()
tmp.env$tweets.nm1 <- searchTwitter("#AislamientoObligatorio", n=40000, 
                                    since = paste0(yesterday), until = paste0(today) )
tweetsdf_f <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "#CuarentenaObligatoria")
rm(tmp.env) 
save.image(file = paste0('D:/Guada/Ad Hoc/Difusion redes/Coronavirus/abril_2020/tweets/Tweets_', 
                         yesterday, '.RData'))

tmp.env <- new.env()
tmp.env$tweets.nm1 <- searchTwitter("ginesggarcia", n=40000, 
                                    since = paste0(yesterday), until = paste0(today) )
tweetsdf_g <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "ginesggarcia")
rm(tmp.env) 
save.image(file = paste0('D:/Guada/Ad Hoc/Difusion redes/Coronavirus/abril_2020/tweets/Tweets_', 
                         yesterday, '.RData'))

tmp.env <- new.env()
tmp.env$tweets.nm1 <- searchTwitter("msalnacion", n=40000, 
                                    since = paste0(yesterday), until = paste0(today) )
tweetsdf_h <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "msalnacion")
rm(tmp.env) 
save.image(file = paste0('D:/Guada/Ad Hoc/Difusion redes/Coronavirus/abril_2020/tweets/Tweets_', 
                         yesterday, '.RData'))

tmp.env <- new.env()
tmp.env$tweets.nm1 <- searchTwitter("alferdez", n=40000, 
                                    since = paste0(yesterday), until = paste0(today) )
tweetsdf_i <- twListToDF(tmp.env$tweets.nm1) %>% mutate(hashtag = "alferdez")
rm(tmp.env) 
save.image(file = paste0('D:/Guada/Ad Hoc/Difusion redes/Coronavirus/abril_2020/tweets/Tweets_', 
                         yesterday, '.RData'))

tweetsdf <- rbind(tweetsdf_a, tweetsdf_b, tweetsdf_c, tweetsdf_d,
                  tweetsdf_e, tweetsdf_f, tweetsdf_g, tweetsdf_h,
                  tweetsdf_i)

ficha_tec <- sqldf("SELECT hashtag, COUNT(hashtag) as cantidad_hashtag, 
                   COUNT(DISTINCT(screenName)) as cantidad_usuarios 
                   FROM tweetsdf 
                   GROUP BY hashtag 
                   HAVING COUNT(hashtag) and COUNT(screenName)")



#Si queremos agregarle el % de cuentas y guardar el archivo

ficha_tec <- ficha_tec %>% 
  mutate(porcentaje_usuarios_unicos = paste0(round(100*cantidad_usuarios/cantidad_hashtag, 2), '%'),
         fecha = yesterday) 

write.csv(ficha_tec, file = paste0('D:/Guada/Ad Hoc/Difusion redes/Coronavirus/abril_2020/ficha_tecnica/', yesterday, '.csv'))


#descarga rtweet
appname <- "Guadag"
token <- create_token(app =  appname, consumer_key = consumerKey , 
                      consumer_secret = consumerSecret,
                      access_token = access_token,
                      access_secret = access_secret
)

##a
rtweets_a <- search_tweets("#CoronavirusArgentina", n = 40000, include_rts = TRUE , token = token, retryonratelimit = T,  
                           since = paste0(yesterday), until = paste0(today))
rtweets_a <- rtweets_a %>% mutate(hashtag = "CoronavirusArgentina" )
save.image(file = paste0('D:/Guada/Ad Hoc/Difusion redes/Coronavirus/abril_2020/rtweets/data/RT_', 
                         yesterday, '.RData'))

##b
rtweets_b <- search_tweets( "#COVID19Argentina", n = 40000, include_rts = TRUE , token = token, retryonratelimit = T,  
                            since = paste0(yesterday), until = paste0(today))
rtweets_b <- rtweets_b %>% mutate(hashtag = "#COVID19Argentina")
save.image(file = paste0('D:/Guada/Ad Hoc/Difusion redes/Coronavirus/abril_2020/rtweets/data/RT_', 
                         yesterday, '.RData'))

##c
rtweets_c <- search_tweets( "#Quedateencasa", n = 40000, include_rts = TRUE, token = token, retryonratelimit = T,  
                            since = paste0(yesterday), until = paste0(today))
rtweets_c <- rtweets_c %>% mutate(hashtag = "#Quedateencasa")
save.image(file = paste0('D:/Guada/Ad Hoc/Difusion redes/Coronavirus/abril_2020/rtweets/data/RT_', 
                         yesterday, '.RData'))

##d
rtweets_d <- search_tweets("#Quedateentucasa", n = 40000, include_rts = TRUE, token = token, retryonratelimit = T,  
                           since = paste0(yesterday), until = paste0(today))
rtweets_d <- rtweets_d %>% mutate(hashtag = "#Quedateentucasa")
save.image(file = paste0('D:/Guada/Ad Hoc/Difusion redes/Coronavirus/abril_2020/rtweets/data/RT_', 
                         yesterday, '.RData'))

##e
rtweets_e <- search_tweets("#CuarentenaObligatoria", n = 40000, include_rts = TRUE,  token = token, retryonratelimit = T,  
                           since = paste0(yesterday), until = paste0(today))
rtweets_e <- rtweets_e %>% mutate(hashtag = "#CuarentenaObligatoria")
save.image(file = paste0('D:/Guada/Ad Hoc/Difusion redes/Coronavirus/abril_2020/rtweets/data/RT_', 
                         yesterday, '.RData'))

##f
rtweets_f <- search_tweets("#AislamientoObligatorio", n = 40000, include_rts = TRUE,  token = token, retryonratelimit = T,  
                           since = paste0(yesterday), until = paste0(today))
rtweets_f <- rtweets_f %>% mutate(hashtag = "#AislamientoObligatorio")
save.image(file = paste0('D:/Guada/Ad Hoc/Difusion redes/Coronavirus/abril_2020/rtweets/data/RT_', 
                         yesterday, '.RData'))

#h
rtweets_g <- search_tweets( "alferdez", n = 40000, include_rts = TRUE,  token = token, retryonratelimit = T,  
                            since = paste0(yesterday), until = paste0(today))
rtweets_g <- rtweets_g %>% mutate(hashtag = "alferdez")
save.image(file = paste0('D:/Guada/Ad Hoc/Difusion redes/Coronavirus/abril_2020/rtweets/data/RT_', 
                         yesterday, '.RData'))
#j
rtweets_h <- search_tweets( "ginesggarcia", n = 40000, include_rts = TRUE,  token = token, retryonratelimit = T,  
                            since = paste0(yesterday), until = paste0(today))
rtweets_h <- rtweets_h %>% mutate(hashtag = "ginesggarcia")
save.image(file = paste0('D:/Guada/Ad Hoc/Difusion redes/Coronavirus/abril_2020/rtweets/data/RT_', 
                         yesterday, '.RData'))

#k 
rtweets_i <- search_tweets("msalnacion", n = 40000, include_rts = TRUE,  token = token, retryonratelimit = T,  
                           since = paste0(yesterday), until = paste0(today))
rtweets_i <- rtweets_i %>% mutate(hashtag = "msalnacion")
save.image(file = paste0('D:/Guada/Ad Hoc/Difusion redes/Coronavirus/abril_2020/rtweets/data/RT_', 
                         yesterday, '.RData'))

rtweets <- rbind(rtweets_a, rtweets_b, rtweets_c, rtweets_d,
                 rtweets_e, rtweets_f, rtweets_g, rtweets_h,
                 rtweets_i)

write.csv(rtweets, paste0('D:/Guada/Ad Hoc/Difusion redes/Coronavirus/abril_2020/rtweets/data/csv/rtweets_', yesterday, '.csv'))


#Si queremos agregarle el % de cuentas y guardar el archivo
#acomodar los datos para el count
rtweets <- cSplit(indt = rtweets, splitCols = "created_at", sep = " ")
names(rtweets)[92] <- "fecha"

ficha_tec_rt <- rtweets %>% select(screen_name, is_retweet, hashtag, fecha, postura) %>%
  filter(fecha == paste0(yesterday)) 

ficha_tec_rt_1 <-  sqldf("SELECT hashtag, COUNT(hashtag) as cantidad_hashtag, 
                   COUNT(DISTINCT(screen_name)) as cantidad_usuarios, fecha, postura 
                   FROM ficha_tec_rt 
                   GROUP BY hashtag
                   HAVING COUNT(hashtag) and COUNT(screen_name)")
#para rt
isrt_rt <- ficha_tec_rt %>% group_by(hashtag, is_retweet) %>%
  summarize(cantidad_hashtag = sum(table(hashtag)),
            cantidad_is_rt = table(is_retweet),
            porcentaje_is_rt = paste0(round(100*cantidad_is_rt/cantidad_hashtag, 2), '%'))
#para postura
postura_rt <- ficha_tec_rt %>% group_by(postura) %>%
  summarize(cantidad_postura = table(postura),
            porcentaje_postura = paste0(round(100*cantidad_postura/cantidad_hashtag, 2), '%'))

ficha_tec <- ficha_tec %>% 
  mutate(porcentaje_usuarios_unicos = paste0(round(100*cantidad_usuarios/cantidad_hashtag, 2), '%')) 

write.csv(ficha_tec, file = paste0('D:/Guada/Ad Hoc/Difusion redes/Coronavirus/abril_2020/ficha_tecnica/RT', yesterday, '.csv'))

