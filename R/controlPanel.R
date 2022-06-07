controlpanel <- function(dependency=NULL){
  tagList(tag_controlpanel(), controlpanel_dependency(), dependency)
}
tag_controlpanel <-function(){
  tags$div(class = "controlPanel",
    # tags$div(class = "controlPanel-motionControl",
    control(),#),
    tags$div(class = "controlPanel-zoomControl",
      tags$div(class = "controlPanel-zoomControl-in", zoomIn()),
      tags$div(class = "controlPanel-zoomControl-out", zoomOut())))
}
update_controlPanel = function(){
  fig = econWeb::Fig()
  fig$export("inst/app/js/controlpanel")
}
zoomIn = function(){
  div(tags$i(class="material-icons","zoom_in", id="zoom-in"))
}
zoomOut = function(){
  div(tags$i(class="material-icons", "zoom_out", id="zoom-out"))
}

controlpanel_dependency <- function(){
  htmltools::htmlDependency(
    name="ntpuecon110graduate",
    version="1.0.0",
    src=c(file=system.file("/app/css",  package = "ntpuecon110graduate")),
    style="controlpanel.css",
    all_files = F
  )}

# controlpanel() |> econWeb::browseTag2()
