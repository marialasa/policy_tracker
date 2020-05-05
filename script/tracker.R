# Cargar libraries
library(readr)
library(ggplot2)
library(gganimate)

# Cargar dataset
dataset <- read_delim("dataset.csv", ";", 
                      escape_double = FALSE,
                      trim_ws = TRUE)

# Crear plot. Ajustar valores en rows 19, 21, 23 & 24.
# Pueden personalizarse también los códigos de colores de row 27.
p <- ggplot(
  dataset,
  aes(Dia, No_Politicas, color = factor(Tipo))
) +
  theme_test() +
  geom_line(size = 0.5) +
  geom_segment(aes(xend = 63, yend = No_Politicas, group = Tipo),
               linetype = "dashed", size = 0.3, colour = "black") +
  geom_text(size = 3.5, aes(x = 63, label = Tipo, size = 5), hjust = 0) +
  guides(color = FALSE) +
  scale_x_continuous(breaks = seq(0, 63, by = 5),
                     limits = c(0, 77))+
  xlab("")+
  ylab("")+
  scale_color_manual(values=c('#E17C05', '#cac9cb', '#edad08', '#cc503e', '#94346e', '#1d6996', '#73af48', '#000000', '#00ade6')) +
  coord_cartesian(clip = 'off') +
  ggtitle("Policy Tracker: respuestas a Covid-19 en Argentina", "Plot de http://medium.com/@Condolasa"
) +
  labs(x = "Días desde primer infectado", y = "Número de políticas implementadas", caption = "Data: https://www.argentina.gob.ar/coronavirus/medidas-gobierno") +
  theme(legend.position = "none")

# Run the plot
p

# Crear animación
p + 
    geom_point(size = 2.5) +
    transition_reveal(Dia)
