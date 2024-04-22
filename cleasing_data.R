#' Importar las proyecciones DANE del año 2005 hasta el 2035
#'
#' Función que obtiene las proyecciones poblacionales DANE desde
#' el año 2005 hasta el 2035
#' @return Un `data.frame` con las proyecciones poblacionales
#' @examples
#' import_data_incidencia()
#' @export
import_data_incidencia <- function() {
  proyecciones <- NULL
  ruta_data <- config::get(file = "config.yml", "incidence_data_paths")
  for (ruta_inciden in ruta_data) {
    extdata_path <- system.file("extdata", package = "sivirep")
    ruta_archivo <- file.path(extdata_path, paste0("proyecciones",
                                                   ruta_inciden$year))
    solicitud_archivo <- httr2::request(ruta_inciden$url)
    respuesta_archivo <- httr2::req_perform(solicitud_archivo)
    if (httr2::resp_status(respuesta_archivo) == 200) {
      conten_archivo <- httr2::resp_body_raw(respuesta_archivo)
      con_archivo <- file(ruta_archivo, "wb")
      if (length(conten_archivo) > 0) {
        writeBin(conten_archivo, con_archivo)
      }
      close(con_archivo)
    }
    proyecciones <- readxl::read_excel(ruta_archivo, skip = ruta_inciden$skip)
    if (ruta_inciden$year == 2035) {
      proyecciones <- dplyr::rename(proyecciones, "Total General" = .data$Total)
    }
    proyecciones <- rbind(proyecciones, proyecciones)
  }
  return(proyecciones)
}


#' Limpiar datos o proyecciones DANE
#'
#' Función que limpia y estandariza las proyecciones DANE para realizar
#' el cálculo de incidencia
#' @param proyecciones Un `data.frame` que contiene los datos de
#' las proyecciones DANE
#' @return Un `data.frame` con los datos limpios y estandarizados de las
#' proyecciones DANE
#' @examples
#' proyecciones <- import_data_incidencia()
#' proyecciones_limpias <- limpiar_data_incidencia(
#'     proyecciones = proyecciones)
#' @export
limpiar_data_incidencia <- function(proyecciones) {
  data_incidencia_limpia <- sivirep::limpiar_encabezado(proyecciones)
  data_incidencia_limpia <- data_incidencia_limpia %>%
    tidyr::pivot_longer(
      cols = starts_with("hombres_") |
        starts_with("mujeres_") | starts_with("total_"),
      names_to = c(".value", "grupo_edad"),
      names_pattern = "(.*)_(\\d+_y_mas|\\d+)$"
    ) %>%
    dplyr::select(.data$dp, .data$dpnom, .data$dpmp, .data$mpio, .data$ano,
                  .data$area_geografica, .data$grupo_edad, .data$hombres,
                  .data$mujeres, .data$total) %>%
    dplyr::mutate(grupo_edad = dplyr::recode(.data$grupo_edad,
                                             `85_y_mas` = "85+"))
  data_incidencia_limpia <- data_incidencia_limpia %>%
    dplyr::filter(!is.na(data_incidencia_limpia[["grupo_edad"]]))
  data_incidencia_limpia <- sivirep::limpiar_encabezado(data_incidencia_limpia)
  data_incidencia_limpia <- data_incidencia_limpia[
    duplicated(data_incidencia_limpia), ]
  return(data_incidencia_limpia)
}
