appDep = function(){
  list(
    {
      htmltools::htmlDependency(name = "app", version = "1.0",
        src = c(file = normalizePath("./inst/app")), script = c("js/script.js", "js/picker.js", "js/picker.date.js", "js/globe.js", "js/appScript.js", "js/control.js", "js/form.js", "js/formProcessing.js"),
        stylesheet =c("css/style.css", "css/card.css", "css/control.css")
      )
    }
  )
}
appDepOnCloud = function(){
  htmltools::htmlDependency(
    name="app",
    version = "1.0",
    src=c(href="https://ntpuecon.github.io/ntpuecon110graduate/lib/app-1.0/"),
    script = c("js/script.js", "js/picker.js", "js/picker.date.js", "formsubmit.js"),
    stylesheet = "css/style.css",
    head = '<base target="_top">'
  )
}
attachAppDependencies = function(p){
  dep = econWeb::Dependency()

  p |>
    # materialiseDash::attachMaterialiseDep() |>
  htmltools::tagList(
    dep$all(),
    appDep()
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
