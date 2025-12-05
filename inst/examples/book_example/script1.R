# Data Analysis
# Author: Data Team
# Date: 2024-01-15
# Description: Basic data exploration and visualization

# Load necessary libraries
library(ggplot2)

# Create sample data
data <- data.frame(
  x = 1:10,
  y = rnorm(10)
)

# Visualize the data
ggplot(data, aes(x = x, y = y)) +
  geom_point() +
  geom_line() +
  theme_minimal()

# Summary statistics
summary(data)
