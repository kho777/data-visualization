# Create preload function
# Check if a package is installed.
# If yes, load the library
# If no, install package and load the library

preload<-function(x)
{
  x <- as.character(x)
  if (!require(x,character.only=TRUE))
  {
    install.packages(pkgs=x,  repos="http://cran.r-project.org")
    require(x,character.only=TRUE)
  }
}