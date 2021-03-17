library(taskscheduleR)
library(shiny)
library(miniUI)

myscript <- "C:/Users/Usuario/OneDrive/FOPEA_COVID/Coronavirus/trendings_topics/TT_descarga_diaria.R"

taskscheduler_create(taskname = "descarga_TT_FOPEA", rscript = myscript, 
                     schedule = "DAILY", starttime = "00:01", startdate = format(Sys.Date()+1, "%d/%m/%Y"))

#para borrar proceso:
#taskscheduler_delete(taskname = "descarga_TT_FOPEA")

