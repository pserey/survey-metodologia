new_data <- data %>%
  mutate(column_mod = ifelse(data$PPA, 'Sim', 'Não'))

custom_colors <- c("#1B9E77", "#D95F02", "#7570B3")

custom_theme <- theme(
  plot.margin = margin(1, 1, 1, 1, "cm")
)

plot <- ggplot(data, aes(x = IES, fill = ETA)) +
  geom_bar(position = "dodge") +
  labs(title = "",
       x = "Importância do desenvolvimento de habilidades de programação",
       y = "Quantidade de respostas",
       fill = "Escolha") +
  scale_fill_manual(values = custom_colors, 
                    breaks = c("CA", "MT", "ND"),
                    labels = c("Academia", "Mercado", "Nenhum")) +
  custom_theme

file_path <- "survey-metodologia/ies_x_decisao.png"
ggsave(file_path, plot, width = 10, height = 6, units = "in")

plot <- ggplot(data, aes(x = ICA, fill = ETA)) +
  geom_bar(position = "dodge") +
  labs(title = "",
       x = "Importância do desenvolvimento de habilidades de pesquisa",
       y = "Quantidade de respostas",
       fill = "Escolha") +
  scale_fill_manual(values = custom_colors, 
                    breaks = c("CA", "MT", "ND"),
                    labels = c("Academia", "Mercado", "Nenhum")) +
  custom_theme  

file_path2 <- "survey-metodologia/ica_x_decisao.png"

ggsave(file_path2, plot, width = 10, height = 6, units = "in")

plot <- ggplot(new_data, aes(x = column_mod, fill = ETA)) +
  geom_bar(position = "dodge") +
  labs(title = "",
       x = "Participou de pesquisa",
       y = "Quantidade de respostas",
       fill = "Escolha") +
  scale_fill_manual(values = custom_colors, 
                    breaks = c("CA", "MT", "ND"),
                    labels = c("Academia", "Mercado", "Nenhum")) +
  custom_theme

file_path3 <- "survey-metodologia/ppa_x_decisao.png"

ggsave(file_path3, plot, width = 10, height = 6, units = "in")
