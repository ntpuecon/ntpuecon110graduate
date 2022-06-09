sidenav = function(..., icon="menu"){
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
        icon))
  ) -> tag_element

  tag_element |> attachAppDependencies() |> tagList(
    carouselPageDep(),
    tags$script('$(function(){
      $("#sidenav-play").click(function(){
      tintId=setInterval(function(){greetingGallery.next()},2000);
      $("#sidenav-play").toggle();
      $("#sidenav-stop").toggle();
    });
  $("#sidenav-stop").click(function(){
    clearInterval(tintId);
    tintId=null;
    $("#sidenav-play").toggle();
    $("#sidenav-stop").toggle();
  });
  $(".carousel").click(function(){
  if(tintId!=null){
  clearInterval(tintId);
    tintId=null;
    $("#sidenav-play").toggle();
    $("#sidenav-stop").toggle();
  }
  })
    })')
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
settingBtn = function(){
  tagList(
    tags$style('

'),
    tags$a(class = "btn-floating btn-large waves-effect waves-light red", id="setting",
      tags$i(class = "material-icons",
        "settings"))
  )
}
globeControl = function() {
  div(
    div(
      class="center",
      style="width:159px; margin:20px 0;",switchControl()),
    controlpanel()) |>
    tagList(
      tags$style("
        .switch label input[type=checkbox]:checked+.lever:after {
        background: purple !important;
        }
        .switch label input[type=checkbox]:checked+.lever {
        background: #f3e5f5 !important;
        }

        "),
      htmltools::includeScript("inst/app/js/control.js")

      )|> attachAppDependencies()
}
testGlobeControl = function(){
  globeControl() |> app$update()
}
sidenavCarouselDep = function(){
  htmltools::htmlDependency(
    name="sidenameCarousel",
    version="1.0.0",
    src=c(file=normalizePath("inst/app/")),
    stylesheet = "css/globe.css"
  )
}
