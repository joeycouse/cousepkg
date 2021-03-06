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
#' @param fill default fill color for geom_bar, geom_rect, and geom_col
#' @param ... other args to \code{theme_minimal}
#'
#'
#' @return A ggplot2 theme
#' @export
#'
#' @examples
#'
#' \dontrun{
#'
#' library(tidyverse)
#'
#' theme_set(theme_couse())
#' }
#'
#'
theme_couse <- function(base_size = 12,
                        strip_text_size = 12,
                        strip_text_margin = 5,
                        subtitle_size = 13,
                        subtitle_margin = 10,
                        plot_title_size = 16,
                        plot_title_margin = 10,
                        plot_caption_size = 10,
                        axis_x_margin = 10,
                        axis_y_margin = 5,
                        axis_text_size = 12,
                        legend_title_size = 12,
                        legend_text_size = 10,
                        fill = "steelblue3",
                        ...){

  ret <- ggplot2::theme_minimal(base_family = "IBM Plex Sans",
                                base_size = base_size,
                                ...)

  ret$plot.title <- ggtext::element_markdown(hjust = 0,
                                             size = plot_title_size,
                                             margin = ggplot2::margin(b = plot_title_margin),
                                             family = "IBM Plex Sans SemiBold"
  )

  ret$plot.subtitle <-  ggtext::element_markdown(hjust = 0, size = subtitle_size,
                                                 margin = ggplot2::margin(b = subtitle_margin),
                                                 family = "IBM Plex Sans",
                                                 lineheight = 1.2
  )

  ret$plot.caption <- ggtext::element_markdown(margin = ggplot2::margin(t = 17, b = 5),
                                               hjust = 1,
                                               family = "IBM Plex Sans",
                                               size = plot_caption_size,
                                               lineheight = 1.5
  )

  ret$axis.text.x <- ggtext::element_markdown(family = "IBM Plex Sans", size = axis_text_size)

  ret$axis.text.y <- ggtext::element_markdown(family = "IBM Plex Sans", size = axis_text_size)

  ret$axis.title.x <- ggtext::element_markdown(margin = ggplot2::margin(t = axis_x_margin))

  ret$axis.title.y <- ggtext::element_markdown(margin = ggplot2::margin(r = axis_y_margin),
                                               angle = 90)

  ret$strip.text <- ggtext::element_textbox_simple(family = "IBM Plex Sans",
                                                   size = strip_text_size,
                                                   halign = 0.5,
                                                   margin = ggplot2::margin(b = strip_text_margin, t = strip_text_margin),
                                                   padding = ggplot2::margin(5, 0, 5, 0),
                                                   color = "black",
                                                   fill = "grey88",
                                                   box.colour = "grey88",
                                                   linetype = 1,
                                                   r = unit(6, "pt")
  )

  ret$legend.title = ggtext::element_markdown(family = "IBM Plex Sans", size = legend_title_size)

  ret$legend.spacing.y = ggplot2::unit(1, 'mm')

  ret$legend.background = ggplot2::element_rect(fill = 'transparent', color = 'transparent')

  ret$legend.text = ggtext::element_markdown(family = "IBM Plex Sans", size = legend_text_size)


  ggplot2::update_geom_defaults('label',
                                list(family = "IBM Plex Sans")
  )

  ggplot2::update_geom_defaults('text',
                                list(family = "IBM Plex Sans")
  )

  ggplot2::update_geom_defaults('col', list(fill = fill, alpha = 0.8))

  ggplot2::update_geom_defaults('bar', list(fill = fill, alpha = 0.8))

  ggplot2::update_geom_defaults('rect', list(color = fill, alpha = 0.8))

  ggplot2::theme(plot.caption.position = "plot",
                 panel.spacing = ggplot2::unit(2, "lines")
  )

  options(
    ggplot2.discrete.fill = list(
      c("skyblue", "orange"),
      RColorBrewer::brewer.pal(3, "Accent"),
      RColorBrewer::brewer.pal(8, "Set2")
    ),
    ggplot2.discrete.colour = list(
      c("skyblue", "orange"),
      RColorBrewer::brewer.pal(3, "Accent"),
      RColorBrewer::brewer.pal(8, "Set2")
    )
  )


  ret

}
