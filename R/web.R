dependency = function(){
  htmltools::htmlDependency(
    name="ntpuecon110",
    version="1.0.0",
    src=c(file=system.file(
      "ntpuecon110", package="ntpuecon110graduate"
    )),
    script="js/script.js"
  )
}
attachAppDependencies = function(p){
  htmltools::tagList(
    p, dependency()
  )
}
create_widget= function(){
  globe() |>
    htmlwidgets::onRender("function(e){widget=e;}") |>
    attachAppDependencies()
}
print.shiny.tag.list = function(x){
  econIDV::showWidget(x)
}
