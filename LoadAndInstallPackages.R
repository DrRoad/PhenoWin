#-----------------------------------------------------------------------------------------------------
print("Load all required packages and dowload/install non-existent packages")
#-----------------------------------------------------------------------------------------------------
LoadAndInstallPackages <- function(mypkg=c("lubridate",
                                    "leaflet",
                                    "leaflet.extras",
                                    "raster",
                                    "scales",
                                    "sf",
                                    "shiny",
                                    "tidyverse",
                                    "velox")) {
  for(i in seq(along=mypkg)){
    if (!is.element(mypkg[i],installed.packages()[,1])){install.packages(mypkg[i])}
    library(mypkg[i], character.only=TRUE)
  }
}
