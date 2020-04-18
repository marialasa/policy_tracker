# Instalar libraries
library(ggplot2)
library(gganimate)

# Cargar datasets
tracker <- read.csv("file")
attach(file)

# Crear plot. XX = números de días desde primer contagio
# XXX = escala del eje horizontal que permita
# ver los tags de las curvas correctamente.
p <- ggplot(
    Tracker,
    aes(Dia, No_Politicas, color = factor(Tipo))
) +
    theme_minimal() +
    geom_line(size = 1) +
    geom_segment(aes(xend = XX, yend = No_Politicas, group = Tipo),
                 linetype = 0, colour = 'white') +
    geom_text(aes(x = XX, label = Tipo, size = 5), hjust = 0) +
    guides(color = FALSE) +
    scale_x_continuous(breaks = seq(0, XX, by = 5),
                       limits = c(0, XXX))+
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
