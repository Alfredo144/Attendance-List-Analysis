install.packages("tidyverse")
library(tidyverse)

ASISTENCIA_2_SEP<-(ASISTENCIA_2_SEP$name)
ASISTENCIA_14_OCT<-(ASISTENCIA_14_OCT$name)
ASISTENCIA_28_OCT<-(ASISTENCIA_28_OCT$name)
ASISTENCIA_30_SEP<-(ASISTENCIA_30_SEP$name)
ASISTENCIA_5_AGO<-(ASISTENCIA_5_AGO$name)
asis<-(asis$name)
ASISTENCIA_25_NOV<-(ASISTENCIA_25_NOV$name)
ASISTENCIA_11_NOV<-(ASISTENCIA_11_NOV$name)

conf1_attendees<-unique(ASISTENCIA_5_AGO)
conf2_attendees<-unique(asis)
conf3_attendees<-unique(ASISTENCIA_2_SEP)
conf4_attendees<-unique(ASISTENCIA_30_SEP)
conf5_attendees<-unique(ASISTENCIA_14_OCT)
conf6_attendees<-unique(ASISTENCIA_28_OCT)
conf7_attendees<-unique(ASISTENCIA_11_NOV)
conf8_attendees<-unique(ASISTENCIA_25_NOV)


ALL<-c(conf1_attendees,conf2_attendees,conf3_attendees,conf4_attendees,conf5_attendees,conf6_attendees,conf7_attendees,conf8_attendees)
ALL
unique_attendees<-unique(ALL)
unique_attendees




library(dplyr)



conferences <- list(conf1_attendees, conf2_attendees, conf3_attendees, conf4_attendees, conf5_attendees, conf6_attendees, conf7_attendees, conf8_attendees)

attendance_record <- dplyr::bind_rows(lapply(unique_attendees, function(x){
  cat(c('Working with: ', x, '\n'))
  attendance <- lapply(conferences, function(y){
    attended <- grepl(x, y)
    return(attended)
  })
  number_attended = length(which(unlist(attendance) == TRUE))
  result <- data.frame(person=x, number_attended=number_attended)
}))

result <- attendance_record %>% 
  mutate(attended_at_least_7 = data.table::fifelse(number_attended == 6, TRUE, FALSE))

print(result)


constancia<-filter(result, number_attended>=7)
constancia
install.packages("writexl")
library(writexl)
write_xlsx(constancia, "C:\\Users\\meyam\\Documents\\SEMINARIOS\\FINAL_SEMINARIOS\\CONSTANCIAS.xlsx")
