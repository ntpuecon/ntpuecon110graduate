tag_sizeControl <-function(){
  tags$div(class = "sizecontainer",
    tags$div(class = "sizecontainer-sizeadjustment",
      tags$div(class = "sizecontainer-sizeadjustment-plus",
        tags$i(class="material-icons", "add")),
      tags$div(class = "sizecontainer-sizeadjustment-minus",
        tags$i(class="material-icons", "remove"))),
    tags$div(class = "sizecontainer-iconsize",
      tags$i(class="material-icons", "public")
    ))
}
sizeControl_dependency <- function(){
  htmltools::htmlDependency(
    name="sizecontrol",
    version="1.0.0",
    src=c(file=system.file("/app",  package = "ntpuecon110graduate")),
    style="css/sizeControl.css",
    script="js/sizeControl.js",
    all_files = F
  )}
ui_sizeControl <- function(dependency=NULL){
  tagList(tag_sizeControl(),
    jqueryDep(),
    sizeControl_dependency(),
    materialiseDep(),
    googleDep(),
    dependency)
}
