update_joinIcon = function(){
  fig=econWeb::Fig()
  fig$export("inst/app/css/joinIcon")
}
tag_joinIcon <-function(color){
  tags$div(class = "joinIcons",
    tags$div(class = "joinIcons-carousel",
      tags$div(class = "joinIcons-carousel-iconCarousel", style="background: no-repeat center url(lib/appImg-1.0.0/icon-carousel.svg);")),
    tags$div(class = glue::glue("joinIcons-globe {color}"), style="background: no-repeat center url(lib/appImg-1.0.0/icon-globe.svg);"))
}
joinIcon_dependency <- function(){
  htmltools::htmlDependency(
    name="ntpuecon110graduate",
    version="1.0.0",
    src=c(file=system.file("/app/css",  package = "ntpuecon110graduate")),
    style="joinIcon.css",
    all_files = F
  )}
ui_joinIcon <- function(color,dependency=NULL){
  tagList(tag_joinIcon(color), joinIcon_dependency(), appImgDep(), dependency)
}
materialiseDep = function(){
  dep=econWeb::Dependency()
  dep$materialise$onCloud()
}
jqueryDep = function(){
  dep=econWeb::Dependency()
  dep$jquery$onCloud()
}
googleDep = function(){
  dep=econWeb::Dependency()
  dep$googleFont$onCloud()
}
floating_control = function(){
  tagList(
    tags$style('

'),
    tags$div(class = "fixed-action-btn",
      tags$a(class = "btn-floating btn-large red",
        tags$i(class = "large material-icons",
          "settings")),
      tags$ul(
        # 地球前後景切換
        tags$li(btn_globe_carousel_switch()),
        # 填祝福表
        tags$li(btn_fillwishform())
        ))) -> tag_element

  tag_element |> attachDependencies(
    list(jqueryDep(), materialiseDep(), googleDep())
  ) |>
    tagList(
      tags$script("document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.fixed-action-btn');
    var instances = M.FloatingActionButton.init(elems);
  });
")
    )
}
btn_globe_carousel_switch = function(color='red', id="switchGlobe"){
  require(htmltools)
  tags$a(
    id=id,
    class=glue::glue("btn-floating btn-large waves-effect waves-light {color}"),
    ui_joinIcon(color)
    ) |>
    tagList(
      materialiseDep()
    )
}
btn_fillwishform = function(color='red', href="form.html"){

    tags$a(
      href=href,
      class=glue::glue("btn-floating btn-large waves-effect waves-light {color}"),
      tags$i(class="material-icons", "volunteer_activism")
    )   |>
    tagList(
      materialiseDep(), googleDep()
    )
}
