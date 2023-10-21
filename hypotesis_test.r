library(readr)

survey <- read.csv("./pp_survey_v2.csv")

data <- subset(survey, EC != "ND")
data$EC <- ifelse(data$EC == "MT", 1, 0)

hist(data$IES)
hist(data$ICA)

model <- glm(EC ~ ICA + IES, data = data, family = "binomial")
ies_chi <- chisq.test(data$ICA, data$EC)
ica_chi <- chisq.test(data$IES, data$EC)

print(summary(model))
print(ies_chi)
print(ica_chi)
