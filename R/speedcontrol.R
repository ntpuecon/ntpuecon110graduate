update_speedControl = function(){
  fig=econWeb::Fig()
  fig$export("inst/app/css/speedControl")
}
tag_speedControl <-function(){
  tags$div(class = "speedcontainer",
    tags$div(class = "speedcontainer-speedadjustment",
      tags$div(class = "speedcontainer-speedadjustment-plus",
        tags$i(class="material-icons", "add")),
      tags$div(class = "speedcontainer-speedadjustment-minus",
        tags$i(class="material-icons", "remove"))),
    tags$div(class = "speedcontainer-iconspeed",
      tags$i(class="material-icons", "speed")
      ))
}

speedControl_dependency <- function(){
  htmltools::htmlDependency(
    name="speedcontrol",
    version="1.0.0",
    src=c(file=system.file("/app",  package = "ntpuecon110graduate")),
    style="css/speedControl.css",
    script="js/speedControl.js",
    all_files = F
  )}
ui_speedControl <- function(dependency=NULL){
  tagList(tag_speedControl(),
    jqueryDep(),
    speedControl_dependency(),
    materialiseDep(),
    googleDep(),
    dependency)
}
# ui_speedControl() |> econWeb::browseTag2()
