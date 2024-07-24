## Poblacion a riesgo
for (year in seq(2020,2022)) {
  name_file <- paste0("pob_riesgo", "_210_dengue_", year)
  load(paste0("./data/poblacion_riesgo/210_dengue/", name_file, ".rda"))
  saveRDS(eval(parse(text = name_file)),
          paste0("./data/poblacion_riesgo/210_dengue/", name_file, ".rds"))
}

for (year in seq(2023,2023)) {
  name_file <- paste0("pob_riesgo", "_420_leishmaniasis_cutanea_", year)
  load(paste0("./data/poblacion_riesgo/420_leishmaniasis_cutanea/",
              name_file, ".rda"))
  saveRDS(eval(parse(text = name_file)),
          paste0("./data/poblacion_riesgo/420_leishmaniasis_cutanea/",
                 name_file, ".rds"))
}

for (year in seq(2023,2023)) {
  name_file <- paste0("pob_riesgo", "_430_leishmaniasis_mucosa_", year)
  load(paste0("./data/poblacion_riesgo/430_leishmaniasis_mucosa/",
              name_file, ".rda"))
  saveRDS(eval(parse(text = name_file)),
          paste0("./data/poblacion_riesgo/430_leishmaniasis_mucosa/",
                 name_file, ".rds"))
}

for (year in seq(2022,2023)) {
  name_file <- paste0("pob_riesgo", "_440_leishmaniasis_visceral_", year)
  load(paste0("./data/poblacion_riesgo/440_leishmaniasis_visceral/",
              name_file, ".rda"))
  saveRDS(eval(parse(text = name_file)),
          paste0("./data/poblacion_riesgo/440_leishmaniasis_visceral/",
                 name_file, ".rds"))
}

for (year in seq(2021,2023)) {
  name_file <- paste0("pob_riesgo", "_465_malaria_", year)
  load(paste0("./data/poblacion_riesgo/465_malaria/",
              name_file, ".rda"))
  saveRDS(eval(parse(text = name_file)),
          paste0("./data/poblacion_riesgo/465_malaria/",
                 name_file, ".rds"))
}

## Proyeciones poblacionales DANE
for (year in seq(2005, 2035)) {
  name_file <- paste0("proyecciones_", year)
  load(paste0("./data/proyecciones/", name_file, ".rda"))
  saveRDS(eval(parse(text = name_file)),
          paste0("./data/proyecciones/", name_file, ".rds"))
}
