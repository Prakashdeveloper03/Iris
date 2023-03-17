# Load required packages & data
source("script/base.R")

# Define function to create scatter plot
create_scatter_plot <- function(data, x_var, y_var, color_var, shape_var, title = NULL) {
  p <- ggplot(data) +
    geom_point(aes(x = !!sym(x_var), y = !!sym(y_var), colour = !!sym(color_var), shape = !!sym(shape_var))) +
    labs(
      title = ifelse(is.null(title), paste(x_var, "vs", y_var), title),
      x = paste(x_var, " (Cm)"),
      y = paste(y_var, " (Cm)"),
      colour = "Species"
    ) +
    theme_bw() +
    themeglb
  return(p)
}

# Create scatter plot for each combination of variables
scatter_list <- list(
  create_scatter_plot(df, "SepalLength", "SepalWidth", "Species", "Species"),
  create_scatter_plot(df, "PetalLength", "PetalWidth", "Species", "Species"),
  create_scatter_plot(df, "SepalLength", "PetalWidth", "Species", "Species"),
  create_scatter_plot(df, "PetalLength", "SepalWidth", "Species", "Species")
)

# Combine scatter plots using plot_grid
plot_grid(plotlist = scatter_list, nrow = 2, ncol = 2)

# Save the plot
ggsave("output/scatter.png", width = 12, height = 12, units = "cm")

# Define function to create density plot
create_density_plot <- function(data, x, title) {
  ggplot(data) +
    geom_density(aes(x = .data[[x]], group = Species, fill = Species), adjust = 1.5, alpha = 0.4) +
    labs(
      title = title,
      x = paste0(x, " (Cm)"),
      y = "Density",
      colour = "Species"
    ) +
    theme_bw() +
    theme(plot.title = element_text(hjust = 0.5))
}

# Create density plots using function
density_list <- list(
  create_density_plot(df, "SepalLength", "SepalLength"),
  create_density_plot(df, "PetalLength", "PetalLength"),
  create_density_plot(df, "SepalWidth", "SepalWidth"),
  create_density_plot(df, "PetalWidth", "PetalWidth")
)

# Arrange plots using plot_grid
plot_grid(plotlist = density_list, nrow = 2, ncol = 2)

# Save the plot
ggsave("output/density2.png", width = 12, height = 12, units = "cm")

# Create boxplots using function
create_boxplot <- function(x, y) {
  ggplot(df) +
    geom_boxplot(aes(x = !!sym(x), y = !!sym(y), colour = Species, shape = Species)) +
    labs(
      title = paste(x, "vs", y),
      x = "Length (Cm)",
      y = "Width (Cm)",
      colour = "Species"
    ) +
    theme_bw() +
    themeglb
}

# Create boxplot plots using function
boxplot_list <- list(
  create_boxplot("SepalLength", "SepalWidth"),
  create_boxplot("PetalLength", "PetalWidth"),
  create_boxplot("SepalLength", "PetalWidth"),
  create_boxplot("PetalLength", "SepalWidth")
)

# Arrange plots using plot_grid
plot_grid(plotlist = boxplot_list, nrow = 2, ncol = 2)

# Save the plot
ggsave("output/boxplot2.png", width = 12, height = 12, units = "cm")
