# Cargar libraries
library(readr)
library(ggplot2)
library(gganimate)

# Cargar dataset
dataset <- read.table(file = "https://github.com/marialasa/policy_tracker/blob/master/dataset/dataset.csv",
                           sep=';',
                           header = TRUE,
                           stringsAsFactors = FALSE)

# Diseño de plot. Ajustar valores en rows 18:28.
# Pueden personalizarse también los códigos de colores en rows 33:41.
p <- ggplot(dataset,
            aes(Dia, No_Politicas, color = factor(Tipo))) +
  theme_classic() +
  geom_line(size = 1) +
  geom_segment(
    aes(xend = 80, yend = No_Politicas, group = Tipo),
    linetype = "dashed",
    size = 0.5,
    colour = "black"
  ) +
  geom_text(size = 5,
            aes(x = 80, label = Tipo, size = 5),
            hjust = 0) +
  guides(color = FALSE) +
  scale_x_continuous(breaks = seq(0, 81, by = 5),
                     limits = c(0, 90)) +
  xlab("") +
  ylab("") +
  scale_color_manual(
    values = c('#E17C05', '#cac9cb', '#edad08', '#cc503e',
               '#94346e', '#1d6996', '#73af48', '#000000', '#00ade6')
  ) +
  coord_cartesian(clip = 'off') +
  ggtitle(
    "Policy Tracker: respuestas a Covid-19 en Argentina",
    "Plot de http://medium.com/@Condolasa"
  ) +
  labs(x = "Días desde primer infectado", y = "Número de políticas implementadas", caption = "Data: https://www.argentina.gob.ar/coronavirus/medidas-gobierno") +
  theme(legend.position = "none") +
  geom_point(size = 2.5) +
  transition_reveal(Dia)

# Guardar plot
animate(p, width = 1280, height = 720, res = 72)
