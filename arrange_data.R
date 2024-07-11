## Poblacion a riesgo
for (year in seq(2020,2022)) {
  name_file <- paste0("pob_riesgo", "_210_dengue_", year)
  pop_year <- paste0("pob_riesgo", "_210_dengue_", year)
  population <- paste0("poblacion_riesgo_", year)
  eval(parse(text = 'pop_year <- pob_riesgo_210_dengue[c("cod_dpto","nombre_departamento","cod_mpio","nombre_municipio",population)]'))
  eval(parse(text = 'pop_year[[population]] <- as.numeric(pop_year[[population]])'))
  save(pop_year, file = paste0("./data/poblacion_riesgo/210_dengue/", name_file, ".rda"), compress = "xz")
}

for (year in seq(2023,2023)) {
  name_file <- paste0("pob_riesgo", "_420_leishmaniasis_cutanea_", year)
  pop_year <- paste0("pob_riesgo", "_420_leishmaniasis_cutanea_", year)
  population <- paste0("poblacion_riesgo_", year)
  eval(parse(text = 'pop_year <- pob_riesgo_420_leishmaniasis_cutanea[c("cod_dpto","nombre_departamento","cod_mpio","nombre_municipio",population)]'))
  eval(parse(text = 'pop_year[[population]] <- as.numeric(pop_year[[population]])'))
  save(pop_year, file = paste0("./data/poblacion_riesgo/420_leishmaniasis_cutanea/", name_file, ".rda"), compress = "xz")
}

for (year in seq(2023,2023)) {
  name_file <- paste0("pob_riesgo", "_430_leishmaniasis_mucosa_", year)
  pop_year <- paste0("pob_riesgo", "_430_leishmaniasis_mucosa_", year)
  population <- paste0("poblacion_riesgo_", year)
  eval(parse(text = 'pop_year <- pob_riesgo_430_leishmaniasis_mucosa[c("cod_dpto","nombre_departamento","cod_mpio","nombre_municipio",population)]'))
  eval(parse(text = 'pop_year[[population]] <- as.numeric(pop_year[[population]])'))
  save(pop_year, file = paste0("./data/poblacion_riesgo/430_leishmaniasis_mucosa/", name_file, ".rda"), compress = "xz")
}

for (year in seq(2022,2023)) {
  name_file <- paste0("pob_riesgo", "_440_leishmaniasis_visceral_", year)
  pop_year <- paste0("pob_riesgo", "_440_leishmaniasis_visceral_", year)
  population <- paste0("poblacion_riesgo_", year)
  eval(parse(text = 'pop_year <- pob_riesgo_440_leishmaniasis_visceral[c("cod_dpto","nombre_departamento","cod_mpio","nombre_municipio",population)]'))
  eval(parse(text = 'pop_year[[population]] <- as.numeric(pop_year[[population]])'))
  save(pop_year, file = paste0("./data/poblacion_riesgo/440_leishmaniasis_visceral/", name_file, ".rda"), compress = "xz")
}

for (year in seq(2021,2023)) {
  name_file <- paste0("pob_riesgo", "_465_malaria_", year)
  pop_year <- paste0("pob_riesgo", "_465_malaria_", year)
  population <- paste0("poblacion_riesgo_", year)
  eval(parse(text = 'pop_year <- pob_riesgo_465_malaria[c("cod_dpto","nombre_departamento","cod_mpio","nombre_municipio",population)]'))
  eval(parse(text = 'pop_year[[population]] <- as.numeric(pop_year[[population]])'))
  save(pop_year, file = paste0("./data/poblacion_riesgo/465_malaria/", name_file, ".rda"), compress = "xz")
}

## Proyeciones poblacionales DANE
proyecs_2005_2035_order <-
  proyecs_2005_2035[order(proyecs_2005_2035$ano), ]
start_index <- 1
for (year in seq(2005, 2035)) {
  last_index <- 
    which(proyecs_2005_2035_order[["ano"]] == year)[length(which(proyecs_2005_2035_order[["ano"]] == year))]
  pop_year <- paste0("proyecciones_", year)
  name_file <- paste0("proyecciones_", year)
  eval(parse(text = 'pop_year <- proyecs_2005_2035_order[start_index:last_index, ]'))
  save(pop_year, file = paste0("./data/proyecciones/", name_file, ".rda"), compress = "xz")
  start_index <- last_index + 1
}
