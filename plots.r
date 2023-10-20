library(readr)
library(dplyr)
library(ggplot2)

data <- read.csv("./survey-v2.csv")

new_header <- c(
                  "timestamp", "termo", "cursacc", "periodo",
                    "CPD", "PPA", "IES", "ICA", "ETA",
                    "IAES", "IACA", "EPP", "CH"
                    
)

# modifica perguntas para nomes de colunas
names(data) <- new_header

# remove timestamp do cabeçalho e últimas 2 colunas (NA)
data <- data[, -1]
data <- data[, -c(ncol(data), ncol(data) - 1)]

# muda tipo de respostas de termo de consentimento (string -> bool)
concorda_termo <- "Li e concordo com o termo de consentimento"
data$termo <- ifelse(data$termo == concorda_termo, TRUE, FALSE)

# muda tipo de respostas de sim-não para boolean
data$cursacc <- ifelse(data$cursacc == "Sim", TRUE, FALSE)
data$PPA <- ifelse(data$PPA == "Sim", TRUE, FALSE)
data$CH <- ifelse(data$CH == "Sim", TRUE, FALSE)

# simplifica resposta de periodos
data$periodo <- gsub("Até o 3o período", "-3", data$periodo)
data$periodo <- gsub("Do 4o ao 6o período", "4-6", data$periodo)
data$periodo <- gsub("Do 7o período para frente", "7-", data$periodo)

# quantifica resposta de definição da expectativa profissional
data$CPD <- gsub("Indefinida", 1, data$CPD)
data$CPD <- gsub("Pouco Definida", 2, data$CPD)
data$CPD <- gsub("Moderadamente Definida", 3, data$CPD)
data$CPD <- gsub("Bastante Definida", 4, data$CPD)
data$CPD <- gsub("Totalmente definida", 5, data$CPD)

# simplifica resposta de expectativa de carreira
data$ETA <- gsub("Carreira acadêmica", "CA", data$ETA)
data$ETA <- gsub("Mercado de trabalho", "MT", data$ETA)
data$ETA <- gsub("Não decidi", "ND", data$ETA)

write.csv(data, "pp_survey_v2.csv", row.names = FALSE)

head(data)

periodo_data <- data %>% select(periodo)
head(periodo_data)

data$periodo <- as.factor(data$periodo)

# histograma de distribuição dos períodos
barplot(table(data$periodo),
        main = "Períodos",
        xlab = "Periodos",
        ylab = "Frequência",
        col = "skyblue",
        border = "black",
        names.arg = levels(data$periodo))

# plot de distribuição dos períodos com ggplot2
ggplot(data, aes(x = periodo, fill = periodo)) +
      geom_bar(width=0.7) +
        labs(title = "Distribuição por períodos",
               x = "Períodos",
               y = "") +
                  scale_fill_brewer(palette = "Set1")

              # alteração na coluna PPA
              new_data <- data %>%
                    mutate(column_mod = ifelse(data$PPA, 'Sim', 'Não'))

                # participou de pesquisa x decisão de carreira
                ggplot(new_data, aes(x = column_mod, fill = ETA)) +
                      geom_bar(position = "dodge") +
                        labs(title = "Mercado ou Academia ?",
                               x = "Participou de pesquisa",
                               y = "",
                               fill = "Escolha") +
                  scale_fill_brewer(palette = "Set1")ncia do desenvolvimento de habilidades de programação
ggplot(data, aes(x = factor(IES), fill = factor(IES))) +
  geom_bar() +
  labs(title = "ncia do desenvolvimento de habilidades de programação",
              x = "",
                     y = "") +
                  scale_fill_brewer(palette = "Set1") +
                    theme(legend.position="none")
                
                ggplot(data, aes(x = factor(ICA), fill = factor(ICA))) +
                      geom_bar() +
                        labs(title = "ncia no desenvolvimento de habilidades de pesquisa",
                                    x = "",
                                           y = "") +
                  scale_fill_brewer(palette = "Set1") +
                    theme(legend.position="none")Import")Import"))

              # import
