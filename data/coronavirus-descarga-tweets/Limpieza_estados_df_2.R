library(tidyverse)
library(jsonlite)
library(sqldf)
library(data.table)

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/Environment/Tweets_Fakes_2020-04-15.RData")

df <- rbind(alchol_en_gel_casero_geo, alchol_en_gel_casero_sgeo, alchol_en_gel_en_casa_geo, alchol_en_gel_en_casa_sgeo, 
            automedicarse_geo, automedicarse_sgeo, bancos_cerrados_geo, bancos_cerrados_sgeo, bebidas_calientes_geo, 
            bebidas_calientes_sgeo, certificado_circulacion_geo, certificado_circulacion_sgeo, fronteras_geo, fronteras_sgeo,
            ibuprofeno_geo, ibuprofeno_sgeo, limitrofes_geo, limitrofes_sgeo, paracetamol_geo, paracetamol_sgeo,
            permiso_transito_geo, permiso_transito_sgeo, solucion_fisiologica_geo, solucion_fisiologica_sgeo, 
            TAD_geo, TAD_sgeo, vacuna_gripe_geo, vacuna_gripe_sgeo)

rtweets_total <- read_csv("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/Chequeo_bots/29-04-2020/rtweets_total.csv")

df <- rbind(df, rtweets_total)

usuarios <- df %>% select(user_id, screen_name, status_id, is_retweet, lang, retweet_status_id, created_at,
                          name, followers_count, friends_count, statuses_count, favourites_count, account_created_at,
                          verified, profile_url, hashtag, hashtags, urls_expanded_url, retweet_source, location, description, protected, 
                          profile_expanded_url) %>% filter(lang == "es")

which.duplicates<-rownames(usuarios[duplicated(usuarios$status_id),])
usuario_s_dupl <- usuarios[-c(as.integer(which.duplicates)),]

usuario_s_dupl = data.frame(lapply(usuario_s_dupl, as.character), stringsAsFactors=FALSE)

yelp <- usuario_s_dupl

save(yelp, file = "C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")

rm(list = ls())

#14

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")

#28

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/Environment/Tweets_Fakes_2020-04-28.RData")

df <- rbind(alchol_en_gel_casero_geo, alchol_en_gel_casero_sgeo, alchol_en_gel_en_casa_geo, alchol_en_gel_en_casa_sgeo, 
            automedicarse_geo, automedicarse_sgeo, bancos_cerrados_geo, bancos_cerrados_sgeo, bebidas_calientes_geo, 
            bebidas_calientes_sgeo, certificado_circulacion_geo, certificado_circulacion_sgeo, fronteras_geo, fronteras_sgeo,
            ibuprofeno_geo, ibuprofeno_sgeo, limitrofes_geo, limitrofes_sgeo, paracetamol_geo, paracetamol_sgeo,
            permiso_transito_geo, permiso_transito_sgeo, solucion_fisiologica_geo, solucion_fisiologica_sgeo, 
            TAD_geo, TAD_sgeo, vacuna_gripe_geo, vacuna_gripe_sgeo,
            desinfectantes_geo, desinfectantes_sgeo, mascaras_faciales_geo, mascaras_faciales_sgeo)

usuarios <- df %>% select(user_id, screen_name, status_id, is_retweet, lang, retweet_status_id, created_at,
                          name, followers_count, friends_count, statuses_count, favourites_count, account_created_at,
                          verified, profile_url, hashtag, hashtags, urls_expanded_url, retweet_source, location, description, protected, 
                          profile_expanded_url) %>% filter(lang == "es")

which.duplicates<-rownames(usuarios[duplicated(usuarios$status_id),])
usuario_s_dupl <- usuarios[-c(as.integer(which.duplicates)),]

usuario_s_dupl = data.frame(lapply(usuario_s_dupl, as.character), stringsAsFactors=FALSE)

yelp$user_id  <- as.character(as.double(yelp$user_id))
yelp$status_id  <- as.character(as.double(yelp$status_id))
yelp$retweet_status_id  <- as.character(as.double(yelp$retweet_status_id))

yelp <- rbind(yelp, usuario_s_dupl)

save(yelp, file = "C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")

rm(list = ls())

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/Environment/Tweets_Fakes_2020-04-29.RData")


df <- rbind(alchol_en_gel_casero_geo, alchol_en_gel_casero_sgeo, alchol_en_gel_en_casa_geo, alchol_en_gel_en_casa_sgeo, 
            automedicarse_geo, automedicarse_sgeo, bancos_cerrados_geo, bancos_cerrados_sgeo, bebidas_calientes_geo, 
            bebidas_calientes_sgeo, certificado_circulacion_geo, certificado_circulacion_sgeo, fronteras_geo, fronteras_sgeo,
            ibuprofeno_geo, ibuprofeno_sgeo, limitrofes_geo, limitrofes_sgeo, paracetamol_geo, paracetamol_sgeo,
            permiso_transito_geo, permiso_transito_sgeo, solucion_fisiologica_geo, solucion_fisiologica_sgeo, 
            TAD_geo, TAD_sgeo, vacuna_gripe_geo, vacuna_gripe_sgeo,
            desinfectantes_geo, desinfectantes_sgeo, mascaras_faciales_geo, mascaras_faciales_sgeo)

usuarios <- df %>% select(user_id, screen_name, status_id, is_retweet, lang, retweet_status_id, created_at,
                          name, followers_count, friends_count, statuses_count, favourites_count, account_created_at,
                          verified, profile_url, hashtag, hashtags, urls_expanded_url, retweet_source, location, description, protected, 
                          profile_expanded_url) %>% filter(lang == "es")
which.duplicates<-rownames(usuarios[duplicated(usuarios$status_id),])
usuario_s_dupl <- usuarios[-c(as.integer(which.duplicates)),]

usuario_s_dupl = data.frame(lapply(usuario_s_dupl, as.character), stringsAsFactors=FALSE)

yelp$user_id  <- as.character(as.double(yelp$user_id))
yelp$status_id  <- as.character(as.double(yelp$status_id))
yelp$retweet_status_id  <- as.character(as.double(yelp$retweet_status_id))


yelp <- rbind(yelp, usuario_s_dupl)

save(yelp, file = "C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")
rm(list = ls())

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")

#30

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/Environment/Tweets_Fakes_2020-04-30.RData")


df <- rbind(alchol_en_gel_casero_geo, alchol_en_gel_casero_sgeo, alchol_en_gel_en_casa_geo, alchol_en_gel_en_casa_sgeo, 
            automedicarse_geo, automedicarse_sgeo, bancos_cerrados_geo, bancos_cerrados_sgeo, bebidas_calientes_geo, 
            bebidas_calientes_sgeo, certificado_circulacion_geo, certificado_circulacion_sgeo, fronteras_geo, fronteras_sgeo,
            ibuprofeno_geo, ibuprofeno_sgeo, limitrofes_geo, limitrofes_sgeo, paracetamol_geo, paracetamol_sgeo,
            permiso_transito_geo, permiso_transito_sgeo, solucion_fisiologica_geo, solucion_fisiologica_sgeo, 
            TAD_geo, TAD_sgeo, vacuna_gripe_geo, vacuna_gripe_sgeo,
            desinfectantes_geo, desinfectantes_sgeo, mascaras_faciales_geo, mascaras_faciales_sgeo)

usuarios <- df %>% select(user_id, screen_name, status_id, is_retweet, lang, retweet_status_id, created_at,
                          name, followers_count, friends_count, statuses_count, favourites_count, account_created_at,
                          verified, profile_url, hashtag, hashtags, urls_expanded_url, retweet_source, location, description, protected, 
                          profile_expanded_url) %>% filter(lang == "es")

which.duplicates<-rownames(usuarios[duplicated(usuarios$status_id),])
usuario_s_dupl <- usuarios[-c(as.integer(which.duplicates)),]

usuario_s_dupl = data.frame(lapply(usuario_s_dupl, as.character), stringsAsFactors=FALSE)

yelp$user_id  <- as.character(as.double(yelp$user_id))
yelp$status_id  <- as.character(as.double(yelp$status_id))
yelp$retweet_status_id  <- as.character(as.double(yelp$retweet_status_id))

yelp <- rbind(yelp, usuario_s_dupl)


save(yelp, file = "C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")
rm(list = ls())

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")
#1

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/Environment/Tweets_Fakes_2020-05-01.RData")

df <- rbind(alchol_en_gel_casero_geo, alchol_en_gel_casero_sgeo, alchol_en_gel_en_casa_geo, alchol_en_gel_en_casa_sgeo, 
            automedicarse_geo, automedicarse_sgeo, bancos_cerrados_geo, bancos_cerrados_sgeo, bebidas_calientes_geo, 
            bebidas_calientes_sgeo, certificado_circulacion_geo, certificado_circulacion_sgeo, fronteras_geo, fronteras_sgeo,
            ibuprofeno_geo, ibuprofeno_sgeo, limitrofes_geo, limitrofes_sgeo, paracetamol_geo, paracetamol_sgeo,
            permiso_transito_geo, permiso_transito_sgeo, solucion_fisiologica_geo, solucion_fisiologica_sgeo, 
            TAD_geo, TAD_sgeo, vacuna_gripe_geo, vacuna_gripe_sgeo,
            desinfectantes_geo, desinfectantes_sgeo, mascaras_faciales_geo, mascaras_faciales_sgeo)


usuarios <- df %>% select(user_id, screen_name, status_id, is_retweet, lang, retweet_status_id, created_at,
                          name, followers_count, friends_count, statuses_count, favourites_count, account_created_at,
                          verified, profile_url, hashtag, hashtags, urls_expanded_url, retweet_source, location, description, protected, 
                          profile_expanded_url) %>% filter(lang == "es")

which.duplicates<-rownames(usuarios[duplicated(usuarios$status_id),])
usuario_s_dupl <- usuarios[-c(as.integer(which.duplicates)),]

usuario_s_dupl = data.frame(lapply(usuario_s_dupl, as.character), stringsAsFactors=FALSE)
yelp$user_id  <- as.character(as.double(yelp$user_id))
yelp$status_id  <- as.character(as.double(yelp$status_id))
yelp$retweet_status_id  <- as.character(as.double(yelp$retweet_status_id))

yelp <- rbind(yelp, usuario_s_dupl)

save(yelp, file = "C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")
rm(list = ls())


load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")

min(yelp$account_created_at)
#2

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/Environment/Tweets_Fakes_2020-05-02.RData")
df <- rbind(alchol_en_gel_casero_geo, alchol_en_gel_casero_sgeo, alchol_en_gel_en_casa_geo, alchol_en_gel_en_casa_sgeo, 
            automedicarse_geo, automedicarse_sgeo, bancos_cerrados_geo, bancos_cerrados_sgeo, bebidas_calientes_geo, 
            bebidas_calientes_sgeo, certificado_circulacion_geo, certificado_circulacion_sgeo, fronteras_geo, fronteras_sgeo,
            ibuprofeno_geo, ibuprofeno_sgeo, limitrofes_geo, limitrofes_sgeo, paracetamol_geo, paracetamol_sgeo,
            permiso_transito_geo, permiso_transito_sgeo, solucion_fisiologica_geo, solucion_fisiologica_sgeo, 
            TAD_geo, TAD_sgeo, vacuna_gripe_geo, vacuna_gripe_sgeo,
            desinfectantes_geo, desinfectantes_sgeo, mascaras_faciales_geo, mascaras_faciales_sgeo,
            union_europea_geo, union_europea_sgeo)

usuarios <- df %>% select(user_id, screen_name, status_id, is_retweet, lang, retweet_status_id, created_at,
                          name, followers_count, friends_count, statuses_count, favourites_count, account_created_at,
                          verified, profile_url, hashtag, hashtags, urls_expanded_url, retweet_source, location, description, protected, 
                          profile_expanded_url) %>% filter(lang == "es")

which.duplicates<-rownames(usuarios[duplicated(usuarios$status_id),])
usuario_s_dupl <- usuarios[-c(as.integer(which.duplicates)),]

usuario_s_dupl = data.frame(lapply(usuario_s_dupl, as.character), stringsAsFactors=FALSE)

yelp$user_id  <- as.character(as.double(yelp$user_id))
yelp$status_id  <- as.character(as.double(yelp$status_id))
yelp$retweet_status_id  <- as.character(as.double(yelp$retweet_status_id))


yelp <- rbind(yelp, usuario_s_dupl)

save(yelp, file = "C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")
rm(list = ls())

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")
#3

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/Environment/Tweets_Fakes_2020-05-03.RData")



df <- rbind(alchol_en_gel_casero_geo, alchol_en_gel_casero_sgeo, alchol_en_gel_en_casa_geo, alchol_en_gel_en_casa_sgeo, 
            automedicarse_geo, automedicarse_sgeo, bancos_cerrados_geo, bancos_cerrados_sgeo, bebidas_calientes_geo, 
            bebidas_calientes_sgeo, certificado_circulacion_geo, certificado_circulacion_sgeo, fronteras_geo, fronteras_sgeo,
            ibuprofeno_geo, ibuprofeno_sgeo, limitrofes_geo, limitrofes_sgeo, paracetamol_geo, paracetamol_sgeo,
            permiso_transito_geo, permiso_transito_sgeo, solucion_fisiologica_geo, solucion_fisiologica_sgeo, 
            TAD_geo, TAD_sgeo, vacuna_gripe_geo, vacuna_gripe_sgeo,
            desinfectantes_geo, desinfectantes_sgeo, mascaras_faciales_geo, mascaras_faciales_sgeo,
            union_europea_geo, union_europea_sgeo, enacom_geo, enacom_sgeo, checkin_geo, checkin_sgeo            )


usuarios <- df %>% select(user_id, screen_name, status_id, is_retweet, lang, retweet_status_id, created_at,
                          name, followers_count, friends_count, statuses_count, favourites_count, account_created_at,
                          verified, profile_url, hashtag, hashtags, urls_expanded_url, retweet_source, location, description, protected, 
                          profile_expanded_url) %>% filter(lang == "es")

which.duplicates<-rownames(usuarios[duplicated(usuarios$status_id),])
usuario_s_dupl <- usuarios[-c(as.integer(which.duplicates)),]

usuario_s_dupl = data.frame(lapply(usuario_s_dupl, as.character), stringsAsFactors=FALSE)

yelp$user_id  <- as.character(as.double(yelp$user_id))
yelp$status_id  <- as.character(as.double(yelp$status_id))
yelp$retweet_status_id  <- as.character(as.double(yelp$retweet_status_id))

yelp <- rbind(yelp, usuario_s_dupl)


save(yelp, file = "C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")
rm(list = ls())

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")

#4

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/Environment/Tweets_Fakes_2020-05-04.RData")

df <- rbind(alchol_en_gel_casero_geo, alchol_en_gel_casero_sgeo, alchol_en_gel_en_casa_geo, alchol_en_gel_en_casa_sgeo, 
            automedicarse_geo, automedicarse_sgeo, bancos_cerrados_geo, bancos_cerrados_sgeo, bebidas_calientes_geo, 
            bebidas_calientes_sgeo, certificado_circulacion_geo, certificado_circulacion_sgeo, fronteras_geo, fronteras_sgeo,
            ibuprofeno_geo, ibuprofeno_sgeo, limitrofes_geo, limitrofes_sgeo, paracetamol_geo, paracetamol_sgeo,
            permiso_transito_geo, permiso_transito_sgeo, solucion_fisiologica_geo, solucion_fisiologica_sgeo, 
            TAD_geo, TAD_sgeo, vacuna_gripe_geo, vacuna_gripe_sgeo,
            desinfectantes_geo, desinfectantes_sgeo, mascaras_faciales_geo, mascaras_faciales_sgeo,
            union_europea_geo, union_europea_sgeo, enacom_geo, enacom_sgeo, checkin_geo, checkin_sgeo )

usuarios <- df %>% select(user_id, screen_name, status_id, is_retweet, lang, retweet_status_id, created_at,
                          name, followers_count, friends_count, statuses_count, favourites_count, account_created_at,
                          verified, profile_url, hashtag, hashtags, urls_expanded_url, retweet_source, location, description, protected, 
                          profile_expanded_url) %>% filter(lang == "es")

which.duplicates<-rownames(usuarios[duplicated(usuarios$status_id),])
usuario_s_dupl <- usuarios[-c(as.integer(which.duplicates)),]

usuario_s_dupl = data.frame(lapply(usuario_s_dupl, as.character), stringsAsFactors=FALSE)
yelp$user_id  <- as.character(as.double(yelp$user_id))
yelp$status_id  <- as.character(as.double(yelp$status_id))
yelp$retweet_status_id  <- as.character(as.double(yelp$retweet_status_id))

yelp <- rbind(yelp, usuario_s_dupl)

save(yelp, file = "C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")
rm(list = ls())

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")

min(yelp$created_at)
#5

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/Environment/Tweets_Fakes_2020-05-05.RData")

df <- rbind(alchol_en_gel_casero_geo, alchol_en_gel_casero_sgeo, alchol_en_gel_en_casa_geo, alchol_en_gel_en_casa_sgeo, 
            automedicarse_geo, automedicarse_sgeo, bancos_cerrados_geo, bancos_cerrados_sgeo, bebidas_calientes_geo, 
            bebidas_calientes_sgeo, certificado_circulacion_geo, certificado_circulacion_sgeo, fronteras_geo, fronteras_sgeo,
            ibuprofeno_geo, ibuprofeno_sgeo, limitrofes_geo, limitrofes_sgeo, paracetamol_geo, paracetamol_sgeo,
            permiso_transito_geo, permiso_transito_sgeo, solucion_fisiologica_geo, solucion_fisiologica_sgeo, 
            TAD_geo, TAD_sgeo, vacuna_gripe_geo, vacuna_gripe_sgeo,
            desinfectantes_geo, desinfectantes_sgeo, mascaras_faciales_geo, mascaras_faciales_sgeo,
            union_europea_geo, union_europea_sgeo, enacom_geo, enacom_sgeo, checkin_geo, checkin_sgeo            )

usuarios <- df %>% select(user_id, screen_name, status_id, is_retweet, lang, retweet_status_id, created_at,
                          name, followers_count, friends_count, statuses_count, favourites_count, account_created_at,
                          verified, profile_url, hashtag, hashtags, urls_expanded_url, retweet_source, location, description, protected, 
                          profile_expanded_url) %>% filter(lang == "es")

which.duplicates<-rownames(usuarios[duplicated(usuarios$status_id),])
usuario_s_dupl <- usuarios[-c(as.integer(which.duplicates)),]

usuario_s_dupl = data.frame(lapply(usuario_s_dupl, as.character), stringsAsFactors=FALSE)

yelp$user_id  <- as.character(as.double(yelp$user_id))
yelp$status_id  <- as.character(as.double(yelp$status_id))
yelp$retweet_status_id  <- as.character(as.double(yelp$retweet_status_id))

yelp <- rbind(yelp, usuario_s_dupl)

save(yelp, file = "C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")
rm(list = ls())

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")

#6
load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/Environment/Tweets_Fakes_2020-05-06.RData")

df <- rbind(alchol_en_gel_casero_geo, alchol_en_gel_casero_sgeo, alchol_en_gel_en_casa_geo, alchol_en_gel_en_casa_sgeo, 
            automedicarse_geo, automedicarse_sgeo, bancos_cerrados_geo, bancos_cerrados_sgeo, bebidas_calientes_geo, 
            bebidas_calientes_sgeo, certificado_circulacion_geo, certificado_circulacion_sgeo, fronteras_geo, fronteras_sgeo,
            ibuprofeno_geo, ibuprofeno_sgeo, limitrofes_geo, limitrofes_sgeo, paracetamol_geo, paracetamol_sgeo,
            permiso_transito_geo, permiso_transito_sgeo, solucion_fisiologica_geo, solucion_fisiologica_sgeo, 
            TAD_geo, TAD_sgeo, vacuna_gripe_geo, vacuna_gripe_sgeo,
            desinfectantes_geo, desinfectantes_sgeo, mascaras_faciales_geo, mascaras_faciales_sgeo,
            union_europea_geo, union_europea_sgeo, enacom_geo, enacom_sgeo, checkin_geo, checkin_sgeo            )

usuarios <- df %>% select(user_id, screen_name, status_id, is_retweet, lang, retweet_status_id, created_at,
                          name, followers_count, friends_count, statuses_count, favourites_count, account_created_at,
                          verified, profile_url, hashtag, hashtags, urls_expanded_url, retweet_source, location, description, protected, 
                          profile_expanded_url) %>% filter(lang == "es")

which.duplicates<-rownames(usuarios[duplicated(usuarios$status_id),])
usuario_s_dupl <- usuarios[-c(as.integer(which.duplicates)),]

usuario_s_dupl = data.frame(lapply(usuario_s_dupl, as.character), stringsAsFactors=FALSE)
yelp$user_id  <- as.character(as.double(yelp$user_id))
yelp$status_id  <- as.character(as.double(yelp$status_id))
yelp$retweet_status_id  <- as.character(as.double(yelp$retweet_status_id))

yelp <- rbind(yelp, usuario_s_dupl)


save(yelp, file = "C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")
rm(list = ls())

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")
#7
load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/Environment/Tweets_Fakes_2020-05-07.RData")

df <- rbind(alchol_en_gel_casero_geo, alchol_en_gel_casero_sgeo, alchol_en_gel_en_casa_geo, alchol_en_gel_en_casa_sgeo, 
            automedicarse_geo, automedicarse_sgeo, bancos_cerrados_geo, bancos_cerrados_sgeo, bebidas_calientes_geo, 
            bebidas_calientes_sgeo, certificado_circulacion_geo, certificado_circulacion_sgeo, fronteras_geo, fronteras_sgeo,
            ibuprofeno_geo, ibuprofeno_sgeo, limitrofes_geo, limitrofes_sgeo, paracetamol_geo, paracetamol_sgeo,
            permiso_transito_geo, permiso_transito_sgeo, solucion_fisiologica_geo, solucion_fisiologica_sgeo, 
            TAD_geo, TAD_sgeo, vacuna_gripe_geo, vacuna_gripe_sgeo,
            desinfectantes_geo, desinfectantes_sgeo, mascaras_faciales_geo, mascaras_faciales_sgeo,
            union_europea_geo, union_europea_sgeo, enacom_geo, enacom_sgeo, checkin_geo, checkin_sgeo            )

usuarios <- df %>% select(user_id, screen_name, status_id, is_retweet, lang, retweet_status_id, created_at,
                          name, followers_count, friends_count, statuses_count, favourites_count, account_created_at,
                          verified, profile_url, hashtag, hashtags, urls_expanded_url, retweet_source, location, description, protected, 
                          profile_expanded_url) %>% filter(lang == "es")

which.duplicates<-rownames(usuarios[duplicated(usuarios$status_id),])
usuario_s_dupl <- usuarios[-c(as.integer(which.duplicates)),]

usuario_s_dupl = data.frame(lapply(usuario_s_dupl, as.character), stringsAsFactors=FALSE)
yelp$user_id  <- as.character(as.double(yelp$user_id))
yelp$status_id  <- as.character(as.double(yelp$status_id))
yelp$retweet_status_id  <- as.character(as.double(yelp$retweet_status_id))

yelp <- rbind(yelp, usuario_s_dupl)

save(yelp, file = "C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")
rm(list = ls())

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")
#8

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/Environment/Tweets_Fakes_2020-05-08.RData")

df <- rbind(alchol_en_gel_casero_geo, alchol_en_gel_casero_sgeo, alchol_en_gel_en_casa_geo, alchol_en_gel_en_casa_sgeo, 
            automedicarse_geo, automedicarse_sgeo, bancos_cerrados_geo, bancos_cerrados_sgeo, bebidas_calientes_geo, 
            bebidas_calientes_sgeo, certificado_circulacion_geo, certificado_circulacion_sgeo, fronteras_geo, fronteras_sgeo,
            ibuprofeno_geo, ibuprofeno_sgeo, limitrofes_geo, limitrofes_sgeo, paracetamol_geo, paracetamol_sgeo,
            permiso_transito_geo, permiso_transito_sgeo, solucion_fisiologica_geo, solucion_fisiologica_sgeo, 
            TAD_geo, TAD_sgeo, vacuna_gripe_geo, vacuna_gripe_sgeo,
            desinfectantes_geo, desinfectantes_sgeo, mascaras_faciales_geo, mascaras_faciales_sgeo,
            union_europea_geo, union_europea_sgeo, enacom_geo, enacom_sgeo, checkin_geo, checkin_sgeo            )

usuarios <- df %>% select(user_id, screen_name, status_id, is_retweet, lang, retweet_status_id, created_at,
                          name, followers_count, friends_count, statuses_count, favourites_count, account_created_at,
                          verified, profile_url, hashtag, hashtags, urls_expanded_url, retweet_source, location, description, protected, 
                          profile_expanded_url) %>% filter(lang == "es")

which.duplicates<-rownames(usuarios[duplicated(usuarios$status_id),])
usuario_s_dupl <- usuarios[-c(as.integer(which.duplicates)),]

usuario_s_dupl = data.frame(lapply(usuario_s_dupl, as.character), stringsAsFactors=FALSE)
yelp$user_id  <- as.character(as.double(yelp$user_id))
yelp$status_id  <- as.character(as.double(yelp$status_id))
yelp$retweet_status_id  <- as.character(as.double(yelp$retweet_status_id))

yelp <- rbind(yelp, usuario_s_dupl)

save(yelp, file = "C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")
rm(list = ls())


load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")

#9
load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/Environment/Tweets_Fakes_2020-05-09.RData")

df <- rbind(alchol_en_gel_casero_geo, alchol_en_gel_casero_sgeo, alchol_en_gel_en_casa_geo, alchol_en_gel_en_casa_sgeo, 
            automedicarse_geo, automedicarse_sgeo, bancos_cerrados_geo, bancos_cerrados_sgeo, bebidas_calientes_geo, 
            bebidas_calientes_sgeo, certificado_circulacion_geo, certificado_circulacion_sgeo, fronteras_geo, fronteras_sgeo,
            ibuprofeno_geo, ibuprofeno_sgeo, limitrofes_geo, limitrofes_sgeo, paracetamol_geo, paracetamol_sgeo,
            permiso_transito_geo, permiso_transito_sgeo, solucion_fisiologica_geo, solucion_fisiologica_sgeo, 
            TAD_geo, TAD_sgeo, vacuna_gripe_geo, vacuna_gripe_sgeo,
            desinfectantes_geo, desinfectantes_sgeo, mascaras_faciales_geo, mascaras_faciales_sgeo,
            union_europea_geo, union_europea_sgeo, enacom_geo, enacom_sgeo, checkin_geo, checkin_sgeo            )

usuarios <- df %>% select(user_id, screen_name, status_id, is_retweet, lang, retweet_status_id, created_at,
                          name, followers_count, friends_count, statuses_count, favourites_count, account_created_at,
                          verified, profile_url, hashtag, hashtags, urls_expanded_url, retweet_source, location, description, protected, 
                          profile_expanded_url) %>% filter(lang == "es")


which.duplicates<-rownames(usuarios[duplicated(usuarios$status_id),])
usuario_s_dupl <- usuarios[-c(as.integer(which.duplicates)),]

yelp$user_id  <- as.character(as.double(yelp$user_id))
yelp$status_id  <- as.character(as.double(yelp$status_id))
yelp$retweet_status_id  <- as.character(as.double(yelp$retweet_status_id))

usuario_s_dupl = data.frame(lapply(usuario_s_dupl, as.character), stringsAsFactors=FALSE)

yelp <- rbind(yelp, usuario_s_dupl)

save(yelp, file = "C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")
rm(list = ls())

#14

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/Environment/Tweets_Fakes_2020-05-10.RData")

df <- rbind(alchol_en_gel_casero_geo, alchol_en_gel_casero_sgeo, alchol_en_gel_en_casa_geo, alchol_en_gel_en_casa_sgeo, 
            automedicarse_geo, automedicarse_sgeo, bancos_cerrados_geo, bancos_cerrados_sgeo, bebidas_calientes_geo, 
            bebidas_calientes_sgeo, certificado_circulacion_geo, certificado_circulacion_sgeo, fronteras_geo, fronteras_sgeo,
            ibuprofeno_geo, ibuprofeno_sgeo, limitrofes_geo, limitrofes_sgeo, paracetamol_geo, paracetamol_sgeo,
            permiso_transito_geo, permiso_transito_sgeo, solucion_fisiologica_geo, solucion_fisiologica_sgeo, 
            TAD_geo, TAD_sgeo, vacuna_gripe_geo, vacuna_gripe_sgeo,
            desinfectantes_geo, desinfectantes_sgeo, mascaras_faciales_geo, mascaras_faciales_sgeo,
            union_europea_geo, union_europea_sgeo, enacom_geo, enacom_sgeo, checkin_geo, checkin_sgeo            )

usuarios <- df %>% select(user_id, screen_name, status_id, is_retweet, lang, retweet_status_id, created_at,
                          name, followers_count, friends_count, statuses_count, favourites_count, account_created_at,
                          verified, profile_url, hashtag, hashtags, urls_expanded_url, retweet_source, location, description, protected, 
                          profile_expanded_url) %>% filter(lang == "es")


which.duplicates<-rownames(usuarios[duplicated(usuarios$status_id),])
usuario_s_dupl <- usuarios[-c(as.integer(which.duplicates)),]

usuario_s_dupl = data.frame(lapply(usuario_s_dupl, as.character), stringsAsFactors=FALSE)
yelp$user_id  <- as.character(as.double(yelp$user_id))
yelp$status_id  <- as.character(as.double(yelp$status_id))
yelp$retweet_status_id  <- as.character(as.double(yelp$retweet_status_id))
yelp <- rbind(yelp, usuario_s_dupl)

save(yelp, file = "C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")
rm(list = ls())


load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")


#11
load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/Environment/Tweets_Fakes_2020-05-11.RData")

df <- rbind(alchol_en_gel_casero_geo, alchol_en_gel_casero_sgeo, alchol_en_gel_en_casa_geo, alchol_en_gel_en_casa_sgeo, 
            automedicarse_geo, automedicarse_sgeo, bancos_cerrados_geo, bancos_cerrados_sgeo, bebidas_calientes_geo, 
            bebidas_calientes_sgeo, certificado_circulacion_geo, certificado_circulacion_sgeo, fronteras_geo, fronteras_sgeo,
            ibuprofeno_geo, ibuprofeno_sgeo, limitrofes_geo, limitrofes_sgeo, paracetamol_geo, paracetamol_sgeo,
            permiso_transito_geo, permiso_transito_sgeo, solucion_fisiologica_geo, solucion_fisiologica_sgeo, 
            TAD_geo, TAD_sgeo, vacuna_gripe_geo, vacuna_gripe_sgeo,
            desinfectantes_geo, desinfectantes_sgeo, mascaras_faciales_geo, mascaras_faciales_sgeo,
            union_europea_geo, union_europea_sgeo, enacom_geo, enacom_sgeo, checkin_geo, checkin_sgeo)

usuarios <- df %>% select(user_id, screen_name, status_id, is_retweet, lang, retweet_status_id, created_at,
                          name, followers_count, friends_count, statuses_count, favourites_count, account_created_at,
                          verified, profile_url, hashtag, hashtags, urls_expanded_url, retweet_source, location, description, protected, 
                          profile_expanded_url) %>% filter(lang == "es")


which.duplicates<-rownames(usuarios[duplicated(usuarios$status_id),])
usuario_s_dupl <- usuarios[-c(as.integer(which.duplicates)),]

usuario_s_dupl = data.frame(lapply(usuario_s_dupl, as.character), stringsAsFactors=FALSE)
yelp$user_id  <- as.character(as.double(yelp$user_id))
yelp$status_id  <- as.character(as.double(yelp$status_id))
yelp$retweet_status_id  <- as.character(as.double(yelp$retweet_status_id))

yelp <- rbind(yelp, usuario_s_dupl)

save(yelp, file = "C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")
rm(list = ls())

#12

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/Environment/Tweets_Fakes_2020-05-12.RData")

df <- rbind(alchol_en_gel_casero_geo, alchol_en_gel_casero_sgeo, alchol_en_gel_en_casa_geo, alchol_en_gel_en_casa_sgeo, 
            automedicarse_geo, automedicarse_sgeo, bancos_cerrados_geo, bancos_cerrados_sgeo, bebidas_calientes_geo, 
            bebidas_calientes_sgeo, certificado_circulacion_geo, certificado_circulacion_sgeo, fronteras_geo, fronteras_sgeo,
            ibuprofeno_geo, ibuprofeno_sgeo, limitrofes_geo, limitrofes_sgeo, paracetamol_geo, paracetamol_sgeo,
            permiso_transito_geo, permiso_transito_sgeo, solucion_fisiologica_geo, solucion_fisiologica_sgeo, 
            TAD_geo, TAD_sgeo, vacuna_gripe_geo, vacuna_gripe_sgeo,
            desinfectantes_geo, desinfectantes_sgeo, mascaras_faciales_geo, mascaras_faciales_sgeo,
            union_europea_geo, union_europea_sgeo, enacom_geo, enacom_sgeo, checkin_geo, checkin_sgeo)

usuarios <- df %>% select(user_id, screen_name, status_id, is_retweet, lang, retweet_status_id, created_at,
                          name, followers_count, friends_count, statuses_count, favourites_count, account_created_at,
                          verified, profile_url, hashtag, hashtags, urls_expanded_url, retweet_source, location, description, protected, 
                          profile_expanded_url) %>% filter(lang == "es")

which.duplicates<-rownames(usuarios[duplicated(usuarios$status_id),])
usuario_s_dupl <- usuarios[-c(as.integer(which.duplicates)),]

usuario_s_dupl = data.frame(lapply(usuario_s_dupl, as.character), stringsAsFactors=FALSE)

yelp$user_id  <- as.character(as.double(yelp$user_id))
yelp$status_id  <- as.character(as.double(yelp$status_id))
yelp$retweet_status_id  <- as.character(as.double(yelp$retweet_status_id))

yelp <- rbind(yelp, usuario_s_dupl)

save(yelp, file = "C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")
rm(list = ls())

#14

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/Environment/Tweets_Fakes_2020-05-13.RData")

df <- rbind(alchol_en_gel_casero_geo, alchol_en_gel_casero_sgeo, alchol_en_gel_en_casa_geo, alchol_en_gel_en_casa_sgeo, 
            automedicarse_geo, automedicarse_sgeo, bancos_cerrados_geo, bancos_cerrados_sgeo, bebidas_calientes_geo, 
            bebidas_calientes_sgeo, certificado_circulacion_geo, certificado_circulacion_sgeo, fronteras_geo, fronteras_sgeo,
            ibuprofeno_geo, ibuprofeno_sgeo, limitrofes_geo, limitrofes_sgeo, paracetamol_geo, paracetamol_sgeo,
            permiso_transito_geo, permiso_transito_sgeo, solucion_fisiologica_geo, solucion_fisiologica_sgeo, 
            TAD_geo, TAD_sgeo, vacuna_gripe_geo, vacuna_gripe_sgeo,
            desinfectantes_geo, desinfectantes_sgeo, mascaras_faciales_geo, mascaras_faciales_sgeo,
            union_europea_geo, union_europea_sgeo, enacom_geo, enacom_sgeo, checkin_geo, checkin_sgeo)

usuarios <- df %>% select(user_id, screen_name, status_id, is_retweet, lang, retweet_status_id, created_at,
                          name, followers_count, friends_count, statuses_count, favourites_count, account_created_at,
                          verified, profile_url, hashtag, hashtags, urls_expanded_url, retweet_source, location, description, protected, 
                          profile_expanded_url) %>% filter(lang == "es")


which.duplicates<-rownames(usuarios[duplicated(usuarios$status_id),])
usuario_s_dupl <- usuarios[-c(as.integer(which.duplicates)),]

usuario_s_dupl = data.frame(lapply(usuario_s_dupl, as.character), stringsAsFactors=FALSE)

yelp$user_id  <- as.character(as.double(yelp$user_id))
yelp$status_id  <- as.character(as.double(yelp$status_id))
yelp$retweet_status_id  <- as.character(as.double(yelp$retweet_status_id))

yelp <- rbind(yelp, usuario_s_dupl)

save(yelp, file = "C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")
rm(list = ls())

#14

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")

load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/Environment/Tweets_Fakes_2020-05-14.RData")

df <- rbind(alchol_en_gel_casero_geo, alchol_en_gel_casero_sgeo, alchol_en_gel_en_casa_geo, alchol_en_gel_en_casa_sgeo, 
            automedicarse_geo, automedicarse_sgeo, bancos_cerrados_geo, bancos_cerrados_sgeo, bebidas_calientes_geo, 
            bebidas_calientes_sgeo, certificado_circulacion_geo, certificado_circulacion_sgeo, fronteras_geo, fronteras_sgeo,
            ibuprofeno_geo, ibuprofeno_sgeo, limitrofes_geo, limitrofes_sgeo, paracetamol_geo, paracetamol_sgeo,
            permiso_transito_geo, permiso_transito_sgeo, solucion_fisiologica_geo, solucion_fisiologica_sgeo, 
            TAD_geo, TAD_sgeo, vacuna_gripe_geo, vacuna_gripe_sgeo,
            desinfectantes_geo, desinfectantes_sgeo, mascaras_faciales_geo, mascaras_faciales_sgeo,
            union_europea_geo, union_europea_sgeo, enacom_geo, enacom_sgeo, checkin_geo, checkin_sgeo)

usuarios <- df %>% select(user_id, screen_name, status_id, is_retweet, lang, retweet_status_id, created_at,
                          name, followers_count, friends_count, statuses_count, favourites_count, account_created_at,
                          verified, profile_url, hashtag, hashtags, urls_expanded_url, retweet_source, location, description, protected, 
                          profile_expanded_url) %>% filter(lang == "es")

which.duplicates<-rownames(usuarios[duplicated(usuarios$status_id),])
usuario_s_dupl <- usuarios[-c(as.integer(which.duplicates)),]

usuario_s_dupl = data.frame(lapply(usuario_s_dupl, as.character), stringsAsFactors=FALSE)

yelp$user_id  <- as.character(as.double(yelp$user_id))
yelp$status_id  <- as.character(as.double(yelp$status_id))
yelp$retweet_status_id  <- as.character(as.double(yelp$retweet_status_id))


yelp <- rbind(yelp, usuario_s_dupl)

save(yelp, file = "C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")
rm(list = ls())

#15


load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")
load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/Environment/Tweets_Fakes_2020-05-15.RData")

df <- rbind(alchol_en_gel_casero_geo, alchol_en_gel_casero_sgeo, alchol_en_gel_en_casa_geo, alchol_en_gel_en_casa_sgeo, 
            automedicarse_geo, automedicarse_sgeo, bancos_cerrados_geo, bancos_cerrados_sgeo, bebidas_calientes_geo, 
            bebidas_calientes_sgeo, certificado_circulacion_geo, certificado_circulacion_sgeo, fronteras_geo, fronteras_sgeo,
            ibuprofeno_geo, ibuprofeno_sgeo, limitrofes_geo, limitrofes_sgeo, paracetamol_geo, paracetamol_sgeo,
            permiso_transito_geo, permiso_transito_sgeo, solucion_fisiologica_geo, solucion_fisiologica_sgeo, 
            TAD_geo, TAD_sgeo, vacuna_gripe_geo, vacuna_gripe_sgeo,
            desinfectantes_geo, desinfectantes_sgeo, mascaras_faciales_geo, mascaras_faciales_sgeo,
            union_europea_geo, union_europea_sgeo, enacom_geo, enacom_sgeo, checkin_geo, checkin_sgeo)
names(df)
usuarios <- df %>% select(user_id, screen_name, status_id, is_retweet, lang, retweet_status_id, created_at,
                          name, followers_count, friends_count, statuses_count, favourites_count, account_created_at,
                          verified, profile_url, hashtag, hashtags, urls_expanded_url, retweet_source, location, description, protected, 
                          profile_expanded_url) %>% filter(lang == "es")

which.duplicates<-rownames(usuarios[duplicated(usuarios$status_id),])
usuario_s_dupl <- usuarios[-c(as.integer(which.duplicates)),]

usuario_s_dupl = data.frame(lapply(usuario_s_dupl, as.character), stringsAsFactors=FALSE)

yelp$user_id  <- as.character(as.double(yelp$user_id))
yelp$status_id  <- as.character(as.double(yelp$status_id))
yelp$retweet_status_id  <- as.character(as.double(yelp$retweet_status_id))


yelp <- rbind(yelp, usuario_s_dupl)

which.duplicates<-rownames(yelp[duplicated(yelp$status_id),])
yelp2 <- yelp[-c(as.integer(which.duplicates)),]

yelp2 <- yelp %>% group_by(user_id, status_id) %>% distinct()

yelp3 <- sqldf("SELECT *
      FROM yelp
      GROUP BY user_id, status_id")

save(yelp3, file = "C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")
save.image("base_estados_i1.RData")
rm(list = ls())


load("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/base_estados_v2.RData")

save.image("C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/tweets_fake_news/usuarios/estados_unicos_espanol_def_v2.RData")
