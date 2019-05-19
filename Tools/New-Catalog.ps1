# Create a catalog file of source files in subdirectory "functions" to be able to check integrity
# Markus Scholtes, 2019

New-FileCatalog -Path "$PSScriptRoot/VirtualDesktop.ps1" -CatalogVersion 2.0 -CatalogFilePath "$PSScriptRoot/functions.cat"
