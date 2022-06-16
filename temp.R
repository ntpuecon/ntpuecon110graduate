
server = function(input, output, session){}

shiny::shinyApp(ui = htmlTemplate("temp/index.html"), server) -> .shiny
.shiny
