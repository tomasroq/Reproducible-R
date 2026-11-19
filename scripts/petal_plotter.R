# Read command-line arguments
args <- commandArgs(trailingOnly = TRUE)
species_a <- args[1] # The first argument is the name of the first species

# EXERCISE: Store the second arguments as species_b.
species_b <- args[2] # The second argument is the name of the second species

# EXERCISE: Convert the third argument to an integer and store it as image_size.
image_size <- as.integer(args[3])

# EXERCISE: Put species_a and species_b into one vector called selected_species.
selected_species <- c(species_a, species_b)

iris_data <- datasets::iris

species_colours <- c(
  setosa = "tomato",
  versicolor = "steelblue",
  virginica = "gold"
)

# Keep only data from the selected species
iris_subset <- iris_data[iris_data$Species %in% selected_species, ]

# EXERCISE: Create an output filename using species_a and species_b.
# Example: "iris_setosa_vs_versicolor.png"
output_file <- paste0("iris_", species_a, "_vs_", species_b, ".png")

# Open plot
png(
  filename = output_file,
  width = image_size,
  height = image_size
)

plot(
  Petal.Length ~ Petal.Width,
  data = iris_subset,
  col = species_colours[as.character(iris_subset$Species)],
  pch = 19,
  xlab = "Petal width",
  ylab = "Petal length",
  main = paste(species_a, "and", species_b)
)

legend(
  "topleft",
  legend = selected_species,
  col = species_colours[selected_species],
  pch = 19,
  bty = "n"
)

dev.off() # Close plot