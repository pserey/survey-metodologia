library(readr)

survey <- read.csv("./pp_survey_v2.csv")

data <- subset(survey, EC != "ND")
data$EC <- ifelse(data$EC == "MT", 1, 0)

model <- lm(EC ~ IAES + IACA, data = data)
ies_chi <- chisq.test(data$IACA, data$EC)
ica_chi <- chisq.test(data$IAES, data$EC)

print(summary(model))
print(ies_chi)
print(ica_chi)
