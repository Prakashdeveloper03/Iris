# Load required packages & data
source("script/base.R")

# Calculate correlation matrix and print
cor(df[2:5])

# Calculate covariance matrix and print
cov(df[2:5])

# Plot correlation matrix using corrplot function
corrplot(cor(df[2:5]),
  type = "upper", method = "color",
  tl.col = "black", tl.srt = 45, addCoef.col = "black"
)

# Plot scatter matrix using ggpairs function
ggpairs(df, mapping = aes(color = Species))

# Save the scatter matrix plot
ggsave("output/scatter_matrix.png", width = 20, height = 20, units = "cm")
