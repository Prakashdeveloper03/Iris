# Define a list of required packages
required_packages <- c(
  "ggplot2", "mice", "rlang", "scales", "cowplot", "viridis",
  "tidyverse", "corrplot", "GGally", "gridExtra", "ggthemes"
)

# Function to check if packages are already installed
check_packages <- function(packages) {
  installed_packages <- installed.packages()[, 1]
  packages_to_install <- packages[!(packages %in% installed_packages)]
  if (length(packages_to_install) > 0) {
    install.packages(packages_to_install)
  }
}

# Call check_packages function to install missing packages
check_packages(required_packages)
