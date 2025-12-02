## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)


## ----eval=FALSE---------------------------------------------------------------
## # install.packages("devtools")
## devtools::install_github("ddotta/quartify")


## ----eval=FALSE---------------------------------------------------------------
## library(quartify)
## 
## # Convertir un script R en document Quarto et générer le HTML
## rtoqmd("mon_script.R", "mon_document.qmd")
## 
## # Convertir seulement, sans générer le HTML
## rtoqmd("mon_script.R", "mon_document.qmd", render = FALSE)


## ----eval=FALSE---------------------------------------------------------------
## # Crée : /chemin/vers/mon_analyse.qmd et /chemin/vers/mon_analyse.html
## rtoqmd("script.R", "/chemin/vers/mon_analyse.qmd")


## ----eval=FALSE---------------------------------------------------------------
## # Si script.R est dans /home/utilisateur/scripts/
## # Crée : /home/utilisateur/scripts/script.qmd et /home/utilisateur/scripts/script.html
## rtoqmd("/home/utilisateur/scripts/script.R")


## ----eval=FALSE---------------------------------------------------------------
## # Crée les fichiers dans votre répertoire de travail actuel
## rtoqmd("script.R", "sortie.qmd")


## ----eval=FALSE---------------------------------------------------------------
#| eval: false
#| echo: true
## iris %>%
##   # Sélectionner une colonne
##   select(Species)


## ----eval=FALSE---------------------------------------------------------------
## rtoqmd(
##   input_file = "mon_script.R",
##   output_file = "mon_document.qmd",
##   title = "Mon rapport d'analyse",
##   author = "Votre nom",
##   format = "html"
## )


## ----eval=FALSE---------------------------------------------------------------
## # Obtenir le chemin du fichier exemple
## example_file <- system.file("examples", "example.R", package = "quartify")
## 
## # Le convertir
## rtoqmd(
##   input_file = example_file,
##   output_file = "analyse_iris.qmd",
##   title = "Analyse du jeu de données Iris",
##   author = "Analyste de données"
## )


## ----eval=FALSE---------------------------------------------------------------
## library(dplyr)


## -----------------------------------------------------------------------------
#| eval: false
#| echo: true
## iris |>
##   count(Species)


## -----------------------------------------------------------------------------
#| eval: false
#| echo: true
## iris |>
##   filter(Species == "setosa")


## -----------------------------------------------------------------------------
#| eval: false
#| echo: true
## iris %>%
##   # Select a column
##   select(Species)


## ----eval=FALSE---------------------------------------------------------------
## # Ceci créera les fichiers .qmd et .html, puis ouvrira le HTML
## rtoqmd(example_file, "analyse_iris.qmd")


## ----eval=FALSE---------------------------------------------------------------
## rtoqmd(example_file, "analyse_iris.qmd", render = FALSE)


## quarto render analyse_iris.qmd

## ----eval=FALSE---------------------------------------------------------------
## quarto::quarto_render("analyse_iris.qmd")


## ----eval=FALSE---------------------------------------------------------------
## # Convertir tous les scripts R d'un répertoire
## rtoqmd_dir("chemin/vers/scripts")
## 
## # Convertir et générer les fichiers HTML
## rtoqmd_dir("chemin/vers/scripts", render = TRUE)
## 
## # Avec auteur personnalisé et préfixe de titre
## rtoqmd_dir("chemin/vers/scripts",
##            title_prefix = "Analyse : ",
##            author = "Équipe Data")
## 
## # Exclure certains fichiers (ex : fichiers de test)
## rtoqmd_dir("chemin/vers/scripts",
##            exclude_pattern = "test_.*\\.R$")
## 
## # Non récursif (seulement le répertoire courant)
## rtoqmd_dir("chemin/vers/scripts", recursive = FALSE)

