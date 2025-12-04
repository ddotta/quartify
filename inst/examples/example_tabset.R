# Title : Tabset Example
#
# Author : quartify
#
# Description : Demonstration of tabset functionality in quartify

## Introduction ####

# This example demonstrates how to use tabsets in quartify to create
# tabbed content panels in your Quarto HTML documents.

## Data Analysis with Tabs ####

# We'll explore the iris dataset using different approaches shown in tabs.

# tabset

# tab - Summary Statistics
# Here are the basic summary statistics for the iris dataset:

summary(iris)

# tab - Data Structure
# Let's examine the structure of the data:

str(iris)

# tab - First Rows
# Here are the first few rows of the dataset:

head(iris, 10)

## Visualization Examples ####

# Another tabset example with different plots.

# tabset

# tab - Scatter Plot
# Relationship between Sepal Length and Petal Length:

plot(iris$Sepal.Length, iris$Petal.Length,
     col = iris$Species,
     xlab = "Sepal Length",
     ylab = "Petal Length",
     main = "Sepal vs Petal Length")
legend("topleft", legend = levels(iris$Species), col = 1:3, pch = 1)

# tab - Box Plot
# Distribution of Sepal Length by Species:

boxplot(Sepal.Length ~ Species, data = iris,
        main = "Sepal Length by Species",
        xlab = "Species",
        ylab = "Sepal Length",
        col = c("red", "green", "blue"))

# tab - Histogram
# Distribution of Petal Width:

hist(iris$Petal.Width,
     main = "Distribution of Petal Width",
     xlab = "Petal Width",
     col = "lightblue",
     breaks = 20)

## Conclusion ####

# Tabsets allow you to organize related content in a compact, interactive way.
# They're perfect for comparing different analyses or visualization approaches.
