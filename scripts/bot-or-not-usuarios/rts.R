load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_coronavirus_diario/TWEETS_2020-04-15.RData")

rtweets_15 <- rbind(rtweets_a, rtweets_b, rtweets_c, rtweets_d,
                    rtweets_e, rtweets_f, rtweets_g, rtweets_h,
                    rtweets_i)
tweetsdf_15 <- tweetsdf
rm(rtweets_15, tweetsdf_15)

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_coronavirus_diario/TWEETS_2020-04-16.RData")

rtweets_16 <- rbind(rtweets_a, rtweets_b, rtweets_c, rtweets_d,
                    rtweets_e, rtweets_f, rtweets_g, rtweets_h,
                    rtweets_i)
tweetsdf_16 <- tweetsdf
rm(rtweets_a, rtweets_b, rtweets_c, rtweets_d,
   rtweets_e, rtweets_f, rtweets_g, rtweets_h,
   rtweets_i, tweetsdf, tweetsdf_a, tweetsdf_b,
   tweetsdf_c, tweetsdf_d, tweetsdf_e, tweetsdf_f, 
   tweetsdf_g, tweetsdf_h, tweetsdf_i)

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_coronavirus_diario/TWEETS_2020-04-17.RData")

rtweets_17 <- rbind(rtweets_a, rtweets_b, rtweets_c, rtweets_d,
                    rtweets_e, rtweets_f, rtweets_g, rtweets_h,
                    rtweets_i)
tweetsdf_17 <- tweetsdf
rm(rtweets_a, rtweets_b, rtweets_c, rtweets_d,    rtweets_e, rtweets_f, rtweets_g, rtweets_h,    rtweets_i, tweetsdf, tweetsdf_a, tweetsdf_b,    tweetsdf_c, tweetsdf_d, tweetsdf_e, tweetsdf_f,     tweetsdf_g, tweetsdf_h, tweetsdf_i)

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_coronavirus_diario/TWEETS_2020-04-18.RData")

rtweets_18 <- rbind(rtweets_a, rtweets_b, rtweets_c, rtweets_d,
                    rtweets_e, rtweets_f, rtweets_g, rtweets_h,
                    rtweets_i)
tweetsdf_18 <- tweetsdf
rm(rtweets_a, rtweets_b, rtweets_c, rtweets_d,    rtweets_e, rtweets_f, rtweets_g, rtweets_h,    rtweets_i, tweetsdf, tweetsdf_a, tweetsdf_b,    tweetsdf_c, tweetsdf_d, tweetsdf_e, tweetsdf_f,     tweetsdf_g, tweetsdf_h, tweetsdf_i)

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_coronavirus_diario/TWEETS_2020-04-19.RData")

rtweets_19 <- rbind(rtweets_a, rtweets_b, rtweets_c, rtweets_d,
                    rtweets_e, rtweets_f, rtweets_g, rtweets_h,
                    rtweets_i)
tweetsdf_19 <- tweetsdf
rm(rtweets_a, rtweets_b, rtweets_c, rtweets_d,    rtweets_e, rtweets_f, rtweets_g, rtweets_h,    rtweets_i, tweetsdf, tweetsdf_a, tweetsdf_b,    tweetsdf_c, tweetsdf_d, tweetsdf_e, tweetsdf_f,     tweetsdf_g, tweetsdf_h, tweetsdf_i)

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_coronavirus_diario/TWEETS_2020-04-20.RData")

rtweets_20 <- rbind(rtweets_a, rtweets_b, rtweets_c, rtweets_d,
                    rtweets_e, rtweets_f, rtweets_g, rtweets_h,
                    rtweets_i)
tweetsdf_20 <- tweetsdf
rm(rtweets_a, rtweets_b, rtweets_c, rtweets_d,    rtweets_e, rtweets_f, rtweets_g, rtweets_h,    rtweets_i, tweetsdf, tweetsdf_a, tweetsdf_b,    tweetsdf_c, tweetsdf_d, tweetsdf_e, tweetsdf_f,     tweetsdf_g, tweetsdf_h, tweetsdf_i)

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_coronavirus_diario/TWEETS_2020-04-21.RData")

rtweets_21 <- rbind(rtweets_a, rtweets_b, rtweets_c, rtweets_d,
                    rtweets_e, rtweets_f, rtweets_g, rtweets_h,
                    rtweets_i)
tweetsdf_21 <- tweetsdf
rm(rtweets_a, rtweets_b, rtweets_c, rtweets_d,    rtweets_e, rtweets_f, rtweets_g, rtweets_h,    rtweets_i, tweetsdf, tweetsdf_a, tweetsdf_b,    tweetsdf_c, tweetsdf_d, tweetsdf_e, tweetsdf_f,     tweetsdf_g, tweetsdf_h, tweetsdf_i)

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_coronavirus_diario/TWEETS_2020-04-22.RData")

rtweets_22 <- rbind(rtweets_a, rtweets_b, rtweets_c, rtweets_d,
                    rtweets_e, rtweets_f, rtweets_g, rtweets_h,
                    rtweets_i)
tweetsdf_22 <- tweetsdf
rm(rtweets_a, rtweets_b, rtweets_c, rtweets_d,    rtweets_e, rtweets_f, rtweets_g, rtweets_h,    rtweets_i, tweetsdf, tweetsdf_a, tweetsdf_b,    tweetsdf_c, tweetsdf_d, tweetsdf_e, tweetsdf_f,     tweetsdf_g, tweetsdf_h, tweetsdf_i)


rtweetsdf <- rbind(rtweets_16, rtweets_17, rtweets_18,rtweets_19,
                   rtweets_20, rtweets_21, rtweets_22)
tweetsdf_f <- rbind(tweetsdf_16, tweetsdf_17, tweetsdf_18,tweetsdf_19,
                  tweetsdf_20, tweetsdf_21, tweetsdf_22)

library(sqldf)
rtweetsdf <- data.frame(rtweetsdf)

library(splitstackshape)+++++++++++|||  
rtweetsdf2 = data.frame(lapply(rtweetsdf, as.character), stringsAsFactors=FALSE)

rtweetsdf2_f <- sqldf("SELECT * 
      FROM rtweetsdf2
      WHERE text LIKE '%alchol gel casero%' OR text LIKE '%alchol gel casa%' OR text LIKE '%automedicac%' OR text LIKE '%paracetamol%' OR
      text LIKE '%vitamina c%' OR text LIKE '%bancos cerrados%' OR text LIKE '%bebidas calientes%' OR text LIKE '%certificado%' OR
      text LIKE '%tramites distancia%' OR text LIKE '%permiso%' OR text LIKE '%fronteras%' OR text LIKE '%ibuprof%' OR
      text LIKE '%limitrofes%' OR text LIKE '%permiso transito%' OR text LIKE '%solucion fisiologica%' OR text LIKE '%lavandina%' OR
      text LIKE '%desinfectantes%' OR text LIKE '%vacuna%' OR  text LIKE '%mascaras faciales%' OR text LIKE '%circulacion%'
      OR text LIKE '%gripe%'")
load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_coronavirus_diario/TWEETS_2020-04-15.RData")

rtweets_15 <- rbind(alchol_en_gel_casero_geo, alchol_en_gel_casero_sgeo, alchol_en_gel_en_casa_geo, alchol_en_gel_en_casa_sgeo, 
            automedicarse_geo, automedicarse_sgeo, bancos_cerrados_geo, bancos_cerrados_sgeo, bebidas_calientes_geo, 
            bebidas_calientes_sgeo, certificado_circulacion_geo, certificado_circulacion_sgeo, fronteras_geo, fronteras_sgeo,
            ibuprofeno_geo, ibuprofeno_sgeo, limitrofes_geo, limitrofes_sgeo, paracetamol_geo, paracetamol_sgeo,
            permiso_transito_geo, permiso_transito_sgeo, solucion_fisiologica_geo, solucion_fisiologica_sgeo, 
            TAD_geo, TAD_sgeo, vacuna_gripe_geo, vacuna_gripe_sgeo, rtweetsdf2_f)

tweetsdf <- rbind(tweetsdf_f, tweetsdf)
head(rtweetsdf)
#eliminamos los duplicados
which.duplicates<-rownames(rtweetsdf[duplicated(rtweetsdf$status_id),])
rtweets.day_status <- rtweetsdf[-c(as.integer(which.duplicates)),]

#nos quedamos con los usuarios unicos
which.duplicates<-rownames(rtweetsdf[duplicated(rtweetsdf$user_id),])
rtweets.day_users<- rtweetsdf[-c(as.integer(which.duplicates)),]
rm(screen_name_2904)

screen_name_2904<- sample(x = rtweets.day_users$screen_name, 3000) 
screen_name_2904 <- as.data.frame(screen_name_2904)
library(tidyverse)
names(screen_name_2904)[1] <- "screenName"
write.csv(screen_name_2904, "C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/Chequeo_bots/29-04-2020/users_fake_2904.csv", row.names = F)
