appDep = function(page=c("form", "globe", "greeting")){
  page=match.arg(page);

  formjs=c("js/script.js", "js/picker.date.js", "js/picker.js", "js/form.js", "js/formProcessing.js")
  globejs=c("js/globe.js", "js/control.js")
  switch(
    page,
    "form"=formjs,
    "globe"=globejs,
    "greeting"=c()
  ) -> pagejs
  list(
    {
      htmltools::htmlDependency(name = "app", version = "1.0",
        src = c(file = normalizePath("./inst/app")), script = c("js/appScript.js", "js/materialiseinit.js", pagejs ),
        stylesheet =c("css/style.css", "css/card.css", "css/control.css", "css/controlpanel.css")
      )
    }
  )
}
touchSwipeDep = function(){
  htmltools::htmlDependency(name = "app", version = "1.0",
    src = c(file = normalizePath("./inst/app")), script = c("js/jquery.touchSwipe.min.js"))
}
globeDep = function(){
  htmltools::htmlDependency(name = "globe", version = "1.0",
    src = c(file = normalizePath("./inst/app")), script = c("js/globe.js"))
}
carouselPageDep = function(){
  htmltools::htmlDependency(
    name="carousel",
    version="1.0.0",
    src = c(file = normalizePath("./inst/app")),
    script="js/carouselglobe.js"
  )
}
appImgDep = function(){
  htmltools::htmlDependency(
    name="appImg",
    version="1.0.0",
    src=c(file=system.file("app-img", package="ntpuecon110graduate")),
    stylesheet = "img.css",
    all_files = T
  )
}
appDepOnCloud = function(){
  htmltools::htmlDependency(
    name="app",
    version = "1.0",
    src=c(href="https://ntpuecon.github.io/ntpuecon110graduate/lib/app-1.0/"),
    script = c("js/script.js", "js/picker.js", "js/picker.date.js"),
    stylesheet = "css/style.css",
    head = '<base target="_top">'
  )
}
attachAppDependencies = function(p, page=c("form","globe","greeting")){
  page=match.arg(page);

  dep = econWeb::Dependency()

  p |>
    # materialiseDash::attachMaterialiseDep() |>
  htmltools::tagList(
    dep$all(),
    appDep(page=page)
    # appDepOnCloud() #appDep()
  )
}

demo= function(){
  require(htmltools)
  econWeb::Dependency() -> dep

  HTML('<div class="container">
  <input type="date" class="datepicker">
</div>
') |>
    tagList(    tags$script("$(function(){
	$('.datepicker').pickadate({
  	min: new Date(2016, 5, 20),
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  });
});") )|>
    tagList(
      dep$jquery$onCloud(),
      appDep()
    )
}
