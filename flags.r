library(tidyverse)
library(ggplot2)
library(ggflags)
library(countrycode)

 topFert <- tibble(country = toupper(c("Нигер", "Сомали", "Конго", "Мали", "Чад", "Ангола", "Бурунди", "Нигерия", "Гамбия", "Буркина-Фасо")),
                   count = c(7.0, 6.17, 6.02, 5.97, 5.85, 5.6, 5.5, 5.46, 5.28, 5.27),
                   label = c(as.character(c(7.0, 6.17, 6.02, 5.97, 5.85, 5.6, 5.5, 5.46, 5.28, 5.27))),
                   code = c("ne", "so", "cd", "ml", "td", "ao", "bi", "ng", "gm", "bf"))
 
topFert %>% mutate(country = reorder(country, -count)) %>%
  ggplot(aes(country, count, label = label)) +
  geom_bar(stat = "identity", fill = "#b45a5d") + 
  geom_text(nudge_y = 0.2, color = "darkred", size = 5) +
  geom_flag(y = -.5, aes(country = code), size = 12) +
  xlab("") + 
  ylab("Среднее количество детей рожденых женщиной в течении жизни") +
  ggtitle("10 стран с наибольшей фертильностью среди женщин") +
  #geom_text(aes(5.5, 3.5, label = "Top 10 countries of female fertility"), size = 7) +
  ggthemes::theme_economist() +
  theme(axis.text.x = element_text(size = 10, vjust = -12, color = "red"),
       axis.ticks.x = element_blank(),
       axis.line.x = element_blank(),
        plot.margin = unit(c(1,1,1,1), "cm")) 
