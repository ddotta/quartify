# Statistical Models
# Author: Data Team
# Date: 2024-01-15
# Description: Building and evaluating statistical models

# Load data
data(mtcars)

# Fit linear model
model <- lm(mpg ~ wt + hp, data = mtcars)

# Model summary
summary(model)

# Diagnostic plots
plot(model)
