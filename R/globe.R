globeOverlay = function(){
  require(htmltools)
  div(
    class="globe-container",
     div(class="globe", plot_capitalTrees()   |>
         htmlwidgets::onRender("function(e){widget=e;}"))
  )

}
globeCard = function(){
  tags$div(class = "row",
    id="globe",
    tags$div(class = "col s12",
      tags$div(class="row",
        plot_capitalTrees()   |>
          htmlwidgets::onRender("function(e){widget=e;}")
      ),
      buttons_playStop(),
      tags$div(class="plant-tree",
        # modal(content=greetingForm())
        button_toPlantTree()
      )
    )
  ) |>
    card2()  |> attachAppDependencies()
}
globeCard2 = function(){
  tags$div(class = "row",
    id="globe",
    tags$div(class = "col s12",
      tags$div(class="row",
        plot_capitalTrees()   |>
          htmlwidgets::onRender("function(e){widget=e;}")
      )
    )
  ) |>
    card3()  |> attachAppDependencies()
}
globeCard3 = function(){
  tagList(
    tags$div(class = "globe",
      # style="background: #828282;",
      plot_capitalTrees()   |>
        htmlwidgets::onRender("function(e){widget=e;}"),
      tags$div(class="row",
        tags$div(class= "col s6 offset-s1 offset-m4",
          controlpanel()))
    )

  ) |> attachAppDependencies(page="globe")
}
card3 = function(content, title="Card Title"){
  require(htmltools)
  tagList(
    tags$style("
    i.material-icons.prefix {
     color: purple;
    }
      "),
    tags$div(class = "row",
      tags$div(class = "col s12 m6 offset-m3 l4 offset-l4",
        tags$div(class = "card pushpin",
          tags$div(class = "card-content white-text",
            tags$span(class = "card-title",
              title),
            content
          ),
          div(class="control-container",
          control())
        ),
        tags$script("$(function(){ $('.pushpin').pushpin();})")))
  )
}
