iris <- datasets::iris

species_colours <- c(
  setosa = "tomato",
  versicolor = "steelblue",
  virginica = "gold"
)

png(filename = "iris_plot.png") # Open plot

plot(
  Petal.Length ~ Petal.Width,
  data = iris,
  col = species_colours[as.character(iris$Species)],
  pch = 19,
  xlab = "Petal width",
  ylab = "Petal length"
)

legend(
  "topleft",
  legend = names(species_colours),
  col = species_colours,
  pch = 19,
  bty = "n"
)

dev.off() # Close plot