#load packages
install.packages(
  c("ggplot2", "dplyr", "tidyr"),
  repos = "https://cloud.r-project.org"
)

library(ggplot2)
library(dplyr)
library(tidyr)

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

species_plot <- iris_data |>
  filter(Species %in% selected_species) |>
  ggplot(aes(x = Petal.Width, y = Petal.Length, color = Species)) +
  geom_point() +
  labs(x = "Petal width", y = "Petal length", title = paste(species_a, "and", species_b))

# EXERCISE: Create an output filename using species_a and species_b.
# Example: "iris_setosa_vs_versicolor.png"
output_file <- paste0("iris_", species_a, "_vs_", species_b, ".png")

ggsave(
  filename = output_file,
  plot = species_plot,
  width = image_size,
  height = image_size,
  units = "px",
  dpi = 150
)