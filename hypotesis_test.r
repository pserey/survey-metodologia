library(readr)
library(ggplot2)

data <- read.csv("./pp_survey_v2.csv")

ies_cont_table <- table(data$IES, data$EC)
ica_cont_table <- table(data$ICA, data$EC)

ies_chisq <- chisq.test(ies_cont_table)
ica_chisq <- chisq.test(ica_cont_table)

print("Qui-quadrado para importancia de ES (IES) e expectativa de carreira")
print(ies_chisq)
print("Qui-quadrado para importancia de conhecimento academico (ICA) e expectativa de carreira")
print(ica_chisq)
