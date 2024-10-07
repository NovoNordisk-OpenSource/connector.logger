# Building a new connector package.
#
# README: each step of the dev files is optional, and you don't have to
# fill every dev scripts before getting started.
# 01_start.R should be filled at start.
# 02_dev.R should be used to keep track of your development during the project.
# 03_deploy.R should be used once you need to publish your package.
#
#
########################################
#### CURRENT FILE: ON START SCRIPT #####
########################################

## Fill the DESCRIPTION ----
## Add meta data about your package and set some default {connector} options
##

# First commit and requires restart
usethis::use_git(message = "First commit")

# Sets up github, for our use case it needs  to be private and org based
# automatically makes commit with a message. Asks to commit DESCRIPTION
usethis::use_github(organisation = "NN-OpenSource", private = TRUE)

# Set up github repo
conan::use_connector_github()
usethis::use_tidy_github_actions()
usethis::use_tidy_github_labels()
usethis::use_pkgdown_github_pages()

# Asks for setting up package-level documentation
conan::use_connector_dependencies()

# Implement tidy style
usethis::use_tidy_style()

# Build README.md in order for it to look nicer and more user-friendly
devtools::build_readme()

# Create connector type vignette
conan::use_connector_vignette()

# Commit all changes and push to github
conan::finish_setup("Setup completed!")

# You're now set! ----
# go to dev/02_dev.R
rstudioapi::navigateToFile("dev/02_dev.R")
