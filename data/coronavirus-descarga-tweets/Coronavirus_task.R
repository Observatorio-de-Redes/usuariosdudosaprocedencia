install.packages(c("taskscheduleR", "shiny", "miniUI"))
library(taskscheduleR)
library(shiny)
library(miniUI)
myscript <- "D:/Guada/Ad Hoc/Difusion redes/Coronavirus/Coronavirus_download.R"


taskscheduler_create(taskname = "download_CORONAVIRUS_V2", rscript = myscript, 
                     schedule = "DAILY", starttime = "02:00", 
                     startdate = format(Sys.Date()+1, "%d/%m/%Y"))

#cuando lo quieras elminar: taskscheduler_delete(taskname = "download_daily_abortion_tweets_V1")