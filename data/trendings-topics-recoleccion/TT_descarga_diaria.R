library("ROAuth")
library("httr")
library("foreign")
library("twitteR")
library(tidyverse)
library(splitstackshape)
library("ROAuth")
library("httr")
library("foreign")
library("twitteR")
library(tidyverse)
library(splitstackshape)
library(sqldf)
library("rtweet")
library("rtweet")
library("openxlsx")
library(openxlsx)
#Cambiar el directorio de trabajo#
setwd("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/")

#Conectarse a Twitter - para esto tienen que tener creada la aplicacion en TW#
options(RCurlOptions = list( capath = system.file("CurlSSL", "cacert.pem", package = "RCurl"), ssl.verifypeer = FALSE))
reqURL<-"https://api.twitter.com/oauth/request_token"
accessURL<-"https://api.twitter.com/oauth/access_token"
authURL<-"https://api.twitter.com/oauth/authorize"
consumerKey<-"c1ESC0DmMmBW8Xlh6L5CIRxCf" #clave que se da cuando se genera la app individual en Twitter
consumerSecret<-"Xfd4FaKoAmRXPe1ZdwyaFdFxTfL4dAjQadx15GOQB9L536zpqZ" #Idem
access_token <- "1670401616-8OgN0VexDFRIusAMU6XQn5qheb0ACWKQ1vebsiq"
access_secret <- "3gv1OZJacS0Wb7lK1pSR0NnCMZvjeA2wUoltxSYgND3XS"
setup_twitter_oauth(consumerKey, consumerSecret, access_token, access_secret)
1

appname <- "Guadag"
token <- create_token(app =  appname, consumer_key = consumerKey , 
                      consumer_secret = consumerSecret,
                      access_token = access_token,
                      access_secret = access_secret)

###Definimos funciones y parametros de antemano
gear_code <- Sys.Date() ##la fecha de hoy para el write_csv
sleep_for_an_hour <- function() { Sys.sleep(3600) } ##definimos cada cuanto quiere que corra el codigo
dir.create(paste0("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/", gear_code))
dir.create(paste0("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/Rankings/", gear_code))
#1
TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))


system.time({ sleep_for_an_hour() })

#2
TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))
system.time({ sleep_for_an_hour() })

#3
TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))

system.time({ sleep_for_an_hour() })

#4

TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))
system.time({ sleep_for_an_hour() })

#5
TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))

system.time({ sleep_for_an_hour() })

#6
TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))

system.time({ sleep_for_an_hour() })


#7
TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))

system.time({ sleep_for_an_hour() })


#8
TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))

system.time({ sleep_for_an_hour() })


#9
TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))

system.time({ sleep_for_an_hour() })


#10
TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))

system.time({ sleep_for_an_hour() })

#11
TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))

system.time({ sleep_for_an_hour() })


#12
TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))

system.time({ sleep_for_an_hour() })

#13
TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))

system.time({ sleep_for_an_hour() })

#14
TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))

system.time({ sleep_for_an_hour() })

#15
TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))

#16
TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))

system.time({ sleep_for_an_hour() })


#17
TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))

system.time({ sleep_for_an_hour() })

#18
TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))

system.time({ sleep_for_an_hour() })


#19
TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))

system.time({ sleep_for_an_hour() })

#20
TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))

system.time({ sleep_for_an_hour() })

#21
TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))

system.time({ sleep_for_an_hour() })

#22
TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))

system.time({ sleep_for_an_hour() })

#23
TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>% 
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))
system.time({ sleep_for_an_hour() })


#24 
TrendingsTopicsNuevo_AR <- get_trends(woeid = 23424747, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_AR <- rbind(TrendingsTopicsNuevo_AR)
TrendingsTopics_AR %>% filter(date == Sys.Date()) %>% select(trend, url, promoted_content, query, tweet_volume, place, woeid, as_of, created_at, posicion) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/','TT_ARG_', gear_code, '.csv'))

TrendingsTopicsNuevo_BSAS <- get_trends(woeid = 468739, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_BSAS <- rbind(TrendingsTopicsNuevo_BSAS)
TrendingsTopics_BSAS %>% filter(date == Sys.Date()) %>% select(trend, url, promoted_content, query, tweet_volume, place, woeid, as_of, created_at, posicion) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/', 'TT_BSAS_', gear_code, '.csv'))

TrendingsTopicsNuevo_CDB <- get_trends(woeid = 466861, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_CDB <- rbind(TrendingsTopicsNuevo_CDB)
TrendingsTopics_CDB %>% filter(date == Sys.Date()) %>% select(trend, url, promoted_content, query, tweet_volume, place, woeid, as_of, created_at, posicion) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code,'/TT_CDBA_', gear_code, '.csv'))

TrendingsTopicsNuevo_MDZ <- get_trends(woeid = 332471, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_MDZ <- rbind(TrendingsTopicsNuevo_MDZ)
TrendingsTopics_MDZ %>% filter(date == Sys.Date()) %>% select(trend, url, promoted_content, query, tweet_volume, place, woeid, as_of, created_at, posicion) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_MDZ_', gear_code, '.csv'))

TrendingsTopicsNuevo_ROS <- get_trends(woeid = 466862, token = token) %>% mutate(time = Sys.time(), date = Sys.Date(), posicion = row_number())
TrendingsTopics_ROS <- rbind(TrendingsTopicsNuevo_ROS)
TrendingsTopics_ROS %>% filter(date == Sys.Date()) %>% select(trend, url, promoted_content, query, tweet_volume, place, woeid, as_of, created_at, posicion) %>%
  write.csv(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT/', gear_code, '/TT_ROS_', gear_code, '.csv'))


setwd("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/Environment")
save.image(file =  paste0('TT_general_', gear_code, '.RData'))


###Agrupando y generando Ranking ARGENTINA
names(TrendingsTopics_AR)
cantidad_TT <- sqldf("SELECT trend, count(*) as cantidad from TrendingsTopics_AR  
                      GROUP BY trend, date
                      HAVING COUNT(*)
                      ORDER BY cantidad DESC")
Join_ranking_diario <- inner_join(TrendingsTopics_AR, cantidad_TT)

### GENERAR RANKING
#X1 <- Representa la posicion de un ## en un momento dado
#cantidad <- cantidad d e veces  que un numero aparece

###la posicion que ocupa en cada  una de las del dia
PosicionTT <- TrendingsTopics_AR %>% mutate(TT_position = case_when(
  posicion >= 1 & posicion <= 5 ~ "5",
  posicion >= 6 & posicion <= 10 ~ "4",
  posicion >= 11 & posicion <= 20 ~ "3",
  posicion >= 21 & posicion <= 30 ~ "2",
  posicion >= 31 ~ "1"))

##sacar un promedio entre  las de ese doa + sacar un promedio entre las del total

TT_Promedio <- sqldf("SELECT *, AVG(TT_position) as Promedio 
                              FROM PosicionTT
                             GROUP BY trend, date
                             HAVING AVG(TT_position)")

Join_ranking_diario3 <- inner_join(Join_ranking_diario, TT_Promedio)
###generar ranking
TT_Ranking <- sqldf("SELECT *, (Promedio + cantidad)/2 as posicion_rank
                              FROM Join_ranking_diario3
                              ORDER BY posicion_rank DESC") #%>% na.omit(TT_Promedio$hashtag)

setwd("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/Rankings")
names(TT_Ranking)
TT_Ranking <- TT_Ranking %>% select(trend, tweet_volume, place, created_at, posicion,cantidad, TT_position,  Promedio, posicion_rank)
write.xlsx(TT_Ranking, file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/Rankings/', gear_code, '/Ranking_ARG_', gear_code, '.csv'))

TrendingsTopics_BSAS

############# BS AS
cantidad_TT <- sqldf("SELECT trend, count(*) as cantidad from TrendingsTopics_BSAS  
                      GROUP BY trend, date
                      HAVING COUNT(*)
                      ORDER BY cantidad DESC")
Join_ranking_diario <- inner_join(TrendingsTopics_BSAS, cantidad_TT)

### GENERAR RANKING
#X1 <- Representa la posicion de un ## en un momento dado
#cantidad <- cantidad d e veces  que un numero aparece

###la posicion que ocupa en cada  una de las del dia
PosicionTT <- TrendingsTopics_BSAS %>% mutate(TT_position = case_when(
  posicion >= 1 & posicion <= 5 ~ "5",
  posicion >= 6 & posicion <= 10 ~ "4",
  posicion >= 11 & posicion <= 20 ~ "3",
  posicion >= 21 & posicion <= 30 ~ "2",
  posicion >= 31 ~ "1"))

##sacar un promedio entre  las de ese doa + sacar un promedio entre las del total

TT_Promedio <- sqldf("SELECT *, AVG(TT_position) as Promedio 
                              FROM PosicionTT
                             GROUP BY trend, date
                             HAVING AVG(TT_position)")

Join_ranking_diario3 <- inner_join(Join_ranking_diario, TT_Promedio)
###generar ranking
TT_Ranking <- sqldf("SELECT *, (Promedio + cantidad)/2 as posicion_rank
                              FROM Join_ranking_diario3
                              ORDER BY posicion_rank DESC") #%>% na.omit(TT_Promedio$hashtag)

setwd("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/Rankings")
names(TT_Ranking)
TT_Ranking <- TT_Ranking %>% select(trend, tweet_volume, place, created_at, posicion,cantidad, TT_position,  Promedio, posicion_rank)
write.xlsx(TT_Ranking, file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/Rankings/', gear_code, '/Ranking_BSAS_', gear_code, '.csv'))


############# CDB
cantidad_TT <- sqldf("SELECT trend, count(*) as cantidad from TrendingsTopics_CDB  
                      GROUP BY trend, date
                      HAVING COUNT(*)
                      ORDER BY cantidad DESC")
Join_ranking_diario <- inner_join(TrendingsTopics_CDB, cantidad_TT)

### GENERAR RANKING
#X1 <- Representa la posicion de un ## en un momento dado
#cantidad <- cantidad d e veces  que un numero aparece

###la posicion que ocupa en cada  una de las del dia
PosicionTT <- TrendingsTopics_CDB %>% mutate(TT_position = case_when(
  posicion >= 1 & posicion <= 5 ~ "5",
  posicion >= 6 & posicion <= 10 ~ "4",
  posicion >= 11 & posicion <= 20 ~ "3",
  posicion >= 21 & posicion <= 30 ~ "2",
  posicion >= 31 ~ "1"))

##sacar un promedio entre  las de ese doa + sacar un promedio entre las del total

TT_Promedio <- sqldf("SELECT *, AVG(TT_position) as Promedio 
                              FROM PosicionTT
                             GROUP BY trend, date
                             HAVING AVG(TT_position)")

Join_ranking_diario3 <- inner_join(Join_ranking_diario, TT_Promedio)
###generar ranking
TT_Ranking <- sqldf("SELECT *, (Promedio + cantidad)/2 as posicion_rank
                              FROM Join_ranking_diario3
                              ORDER BY posicion_rank DESC") #%>% na.omit(TT_Promedio$hashtag)

setwd("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/Rankings")
names(TT_Ranking)
TT_Ranking <- TT_Ranking %>% select(trend, tweet_volume, place, created_at, posicion,cantidad, TT_position,  Promedio, posicion_rank)
write.xlsx(TT_Ranking, file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/Rankings/', gear_code, '/Ranking_CDB_', gear_code, '.csv'))


## MENDOZA
cantidad_TT <- sqldf("SELECT trend, count(*) as cantidad from TrendingsTopics_MDZ  
                      GROUP BY trend, date
                      HAVING COUNT(*)
                      ORDER BY cantidad DESC")
Join_ranking_diario <- inner_join(TrendingsTopics_MDZ, cantidad_TT)

### GENERAR RANKING
#X1 <- Representa la posicion de un ## en un momento dado
#cantidad <- cantidad d e veces  que un numero aparece

###la posicion que ocupa en cada  una de las del dia
PosicionTT <- TrendingsTopics_MDZ %>% mutate(TT_position = case_when(
  posicion >= 1 & posicion <= 5 ~ "5",
  posicion >= 6 & posicion <= 10 ~ "4",
  posicion >= 11 & posicion <= 20 ~ "3",
  posicion >= 21 & posicion <= 30 ~ "2",
  posicion >= 31 ~ "1"))

##sacar un promedio entre  las de ese doa + sacar un promedio entre las del total

TT_Promedio <- sqldf("SELECT *, AVG(TT_position) as Promedio 
                              FROM PosicionTT
                             GROUP BY trend, date
                             HAVING AVG(TT_position)")

Join_ranking_diario3 <- inner_join(Join_ranking_diario, TT_Promedio)
###generar ranking
TT_Ranking <- sqldf("SELECT *, (Promedio + cantidad)/2 as posicion_rank
                              FROM Join_ranking_diario3
                              ORDER BY posicion_rank DESC") #%>% na.omit(TT_Promedio$hashtag)

setwd("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/Rankings")
names(TT_Ranking)
TT_Ranking <- TT_Ranking %>% select(trend, tweet_volume, place, created_at, posicion,cantidad, TT_position,  Promedio, posicion_rank)
write.xlsx(TT_Ranking, file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/Rankings/', gear_code, '/Ranking_MDZ_', gear_code, '.csv'))


#### ROSARIO

cantidad_TT <- sqldf("SELECT trend, count(*) as cantidad from TrendingsTopics_ROS  
                      GROUP BY trend, date
                      HAVING COUNT(*)
                      ORDER BY cantidad DESC")
Join_ranking_diario <- inner_join(TrendingsTopics_ROS, cantidad_TT)

### GENERAR RANKING
#X1 <- Representa la posicion de un ## en un momento dado
#cantidad <- cantidad d e veces  que un numero aparece

###la posicion que ocupa en cada  una de las del dia
PosicionTT <- TrendingsTopics_ROS %>% mutate(TT_position = case_when(
  posicion >= 1 & posicion <= 5 ~ "5",
  posicion >= 6 & posicion <= 10 ~ "4",
  posicion >= 11 & posicion <= 20 ~ "3",
  posicion >= 21 & posicion <= 30 ~ "2",
  posicion >= 31 ~ "1"))

##sacar un promedio entre  las de ese doa + sacar un promedio entre las del total

TT_Promedio <- sqldf("SELECT *, AVG(TT_position) as Promedio 
                              FROM PosicionTT
                             GROUP BY trend, date
                             HAVING AVG(TT_position)")

Join_ranking_diario3 <- inner_join(Join_ranking_diario, TT_Promedio)
###generar ranking
TT_Ranking <- sqldf("SELECT *, (Promedio + cantidad)/2 as posicion_rank
                              FROM Join_ranking_diario3
                              ORDER BY posicion_rank DESC") #%>% na.omit(TT_Promedio$hashtag)

setwd("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/Rankings")

names(TT_Ranking)
TT_Ranking <- TT_Ranking %>% select(trend, tweet_volume, place, created_at, posicion,cantidad, TT_position,  Promedio, posicion_rank)
write.xlsx(TT_Ranking, file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/Rankings/', gear_code, '/Ranking_ROS_', gear_code, '.csv'))


#############MENDOZA

cantidad_TT <- sqldf("SELECT name, count(*) as cantidad from TrendingsTopics_MDZ  
GROUP BY name, date
HAVING COUNT(*)
ORDER BY cantidad DESC")
Join_ranking_diario <- inner_join(TrendingsTopics_MDZ, cantidad_TT)

### GENERAR RANKING
#X1 <- Representa la posicion de un ## en un momento dado
#cantidad <- cantidad d e veces  que un numero aparece

###la posicion que ocupa en cada  una de las del dia
PosicionTT <- TrendingsTopics_MDZ %>% mutate(TT_position = case_when(
posicion >= 1 & posicion <= 5 ~ "5",
posicion >= 6 & posicion <= 10 ~ "4",
posicion >= 11 & posicion <= 20 ~ "3",
posicion >= 21 & posicion <= 30 ~ "2",
posicion >= 31 ~ "1"))

##sacar un promedio entre  las de ese doa + sacar un promedio entre las del total

TT_Promedio <- sqldf("SELECT *, AVG(TT_position) as Promedio 
FROM PosicionTT
GROUP BY name, date
HAVING AVG(TT_position)")

Join_ranking_diario3 <- inner_join(Join_ranking_diario, TT_Promedio)
###generar ranking
TT_Ranking <- sqldf("select *, (Promedio + cantidad)/2 as posicion_rank
from Join_ranking_diario3
ORDER BY posicion_rank DESC") %>% na.omit(TT_Promedio$hashtag)

setwd("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/Rankings")
write.xlsx(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/Rankings/', gear_code, '/Ranking_MDZ_', gear_code, '.csv')




####### ROSARIO
cantidad_TT <- sqldf("SELECT name, count(*) as cantidad from TrendingsTopics_ROS  
GROUP BY name, date
HAVING COUNT(*)
ORDER BY cantidad DESC")
Join_ranking_diario <- inner_join(TrendingsTopics_ROS, cantidad_TT)

### GENERAR RANKING
#X1 <- Representa la posicion de un ## en un momento dado
#cantidad <- cantidad d e veces  que un numero aparece

###la posicion que ocupa en cada  una de las del dia
PosicionTT <- TrendingsTopics_ROS %>% mutate(TT_position = case_when(
posicion >= 1 & posicion <= 5 ~ "5",
posicion >= 6 & posicion <= 10 ~ "4",
posicion >= 11 & posicion <= 20 ~ "3",
posicion >= 21 & posicion <= 30 ~ "2",
posicion >= 31 ~ "1"))

##sacar un promedio entre  las de ese doa + sacar un promedio entre las del total

TT_Promedio <- sqldf("SELECT *, AVG(TT_position) as Promedio 
FROM PosicionTT
GROUP BY name, date
HAVING AVG(TT_position)")

Join_ranking_diario3 <- inner_join(Join_ranking_diario, TT_Promedio)
###generar ranking
TT_Ranking <- sqldf("select *, (Promedio + cantidad)/2 as posicion_rank
from Join_ranking_diario3
ORDER BY posicion_rank DESC") %>% na.omit(TT_Promedio$hashtag)

setwd("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/Rankings")
write.xlsx(file = paste0('C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/Rankings/', gear_code, '/Ranking_ROS_', gear_code, '.csv')