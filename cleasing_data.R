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
  ruta_data <- config::get(file =
                             system.file("extdata",
                                         "config.yml",
                                         package = "sivirep"),
                           "incidence_data_paths")
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
