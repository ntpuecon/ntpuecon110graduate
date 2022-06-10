library(shiny)

ui <- carouselPage() |> add_pwa_deps()

server <- function(input, output, session){

}

shinyApp(ui, server)
