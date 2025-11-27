# Test script for the add-in

## Data Analysis ####

# Load necessary libraries
library(dplyr)

### Data Loading ====

# Load the iris dataset
data(iris)

# Display first rows
head(iris)

#### Summary Statistics ----

# Calculate summary statistics
summary(iris)

### Filtering Data ====

# Filter for setosa species
iris_setosa <- iris %>%
  filter(Species == "setosa")

# Show the result
print(iris_setosa)
