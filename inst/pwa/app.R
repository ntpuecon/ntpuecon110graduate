ui={page_wish2() |> add_pwa_deps() |> add_pwacompat_deps()}

server=function(input, output,session){}

shiny::shinyApp(ui=ui, server=server)
