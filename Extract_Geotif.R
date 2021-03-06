# Used to create the velox objects before launching the application.
# W.DIR: path to the folder of the PhenoWin app
# GEOTIF.DIR: path to the folder containing all the phenological raster
W.DIR = dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(W.DIR)

source("LoadAndInstallPackages.R")
source("Functions_Pheno.R")
# Functions_Pheno.R contain the DATA_FILE function.
# This function is used to create the path in which
# the velox object is stored

LoadAndInstallPackages()
GEOTIF.DIR = paste(W.DIR,"/_Data/",sep="")

tif_info = extract_tif_info(GEOTIF.DIR)
crop_list = unique(tif_info$Crop)
i = 0
# proceed crop by crop
for (crop in crop_list){
  print(paste(i,length(crop_list), sep="/"))
  sel = tif_info %>% filter(Crop==crop)
  a = velox::velox(raster::stack(sel$dir, quick = TRUE))
  print("Save ...")
  # save raster infos and velox object together
  saveRDS(list(sel, a), DATA_FILE(crop))
  i = i + 1
}
