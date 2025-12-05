# Advanced Visualizations
# Author: Data Team
# Date: 2024-01-15
# Description: Creating complex visualizations with ggplot2

# Load libraries
library(ggplot2)

# Create faceted plot
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  facet_wrap(~gear) +
  theme_bw() +
  labs(title = "MPG by Weight and Cylinders",
       color = "Cylinders")
