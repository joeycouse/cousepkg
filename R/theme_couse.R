#' Set pretty defaults for ggplot2 objects
#'
#' @param base_size base font size
#' @param strip_text_size strip text size
#' @param strip_text_margin bottom margin for strip title
#' @param subtitle_size subtitle size
#' @param subtitle_margin bottom margin for subtitle
#' @param plot_title_size plot title size
#' @param plot_title_margin bottom margin for plot title
#' @param axis_x_margin top margin for x axis title
#' @param axis_y_margin right margin for y axis title
#' @param ... other args to \code{theme_minimal}
#'
#'
#' @return A ggplot2 theme
#' @export
#'
#' @examples
#'
#'
theme_couse <- function(base_size = 12,
                        strip_text_size = 12,
                        strip_text_margin = 5,
                        subtitle_size = 13,
                        subtitle_margin = 10,
                        plot_title_size = 16,
                        plot_title_margin = 10,
                        axis_x_margin = 10,
                        axis_y_margin = 5,
                        ...){

  ret <- ggplot2::theme_minimal(base_family = "IBM Plex Sans",
                                base_size = base_size,
                                plot.caption.position = "plot",
                                panel.spacing = ggplot2::unit(2, "lines"),
                                ...)

  ret$strip.text <- ggtext::element_markdown(size = strip_text_size,
                                             family =  "IBM Plex Sans Medium",
                                             margin = ggplot2::margin(b = strip_text_margin),
                                             hjust = 0
                                             )

  ret$plot.subtitle <-  ggtext::element_markdown(hjust = 0, size = subtitle_size,
                                                 margin = ggplot2::margin(b = subtitle_margin),
                                                 family = "IBM Plex Sans Light"
                                                 )

  ret$plot.title <- ggtext::element_markdown(hjust = 0,
                                             size = plot_title_size,
                                             margin = ggplot2::margin(b = plot_title_margin),
                                             family = "IBM Plex Sans SemiBold"
                                             )

  ret$axis.title.x <- ggtext::element_markdown(margin = ggplot2::margin(t = axis_x_margin))

  ret$axis.title.y <- ggtext::element_markdown(margin = ggplot2::margin(r = axis_y_margin))

  ret$plot.caption <- ggtext::element_markdown(margin = ggplot2::margin(t = 17, b = 5),
                                               family = "IBM Plex Sans"
                                               )

  ggplot2::update_geom_defaults('label',
                                list(family = "IBM Plex Sans")
                                )

  ggplot2::update_geom_defaults('text',
                                list(family = "IBM Plex Sans")
                                )

  ret

}