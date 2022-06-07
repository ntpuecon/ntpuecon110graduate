sidenav = function(...){
  tagList(
    tags$style('

'),
    tags$ul(id = "slide-out",
      class = "sidenav",...),
    # sidenav button
    tags$a(href = "#",
      `data-target` = "slide-out",
      class = "sidenav-trigger",
      tags$i(class = "material-icons",
        "menu"))
  ) -> tag_element

  tag_element |> attachAppDependencies() |> tagList(
    carouselPageDep()
  )

}
switchControl = function(id="globeSwitch"){
  tagList(
    tags$style('

'),
    tags$div(class = "switch", id=id,
      tags$label("Off",
        tags$input(type = "checkbox"),
        tags$span(class = "lever"),
        "On"))
  ) -> tag_element

  tag_element |> attachAppDependencies()
}
carouselPage = function(){
  tagList(
    tags$main(
    carouselExample()),

      div(
        class="globe-container2",
        plot_capitalTrees() |>
          plotly::layout(
            margin=list(t=0, r=0, b=0, l=0)
          )
        # plotly::layout(
        #   geo=list(projection=list(scale=0.4222))
        # )
      ),
    sidenav(
      tags$li(
        tags$form(switchControl()

          ))
    ),
    tags$style(
      "
      form {
        padding: 30px 20px;
      }
      .globe-container2 div {

        /* Inside auto layout */

          flex: none;
        order: 0;
        align-self: stretch;
        flex-grow: 1;
      }
      .globe-container2 {


    position: absolute;
    bottom: 30%;
    left: 10%;
    z-index: -1;

        /* Auto layout */

display: flex;
flex-direction: column;
align-items: center;
padding: 18px 0px;
gap: 10px;

/* position: relative; */
width: 262px;
height: 260px;

      }

      ")
  )
}
