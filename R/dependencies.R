appDep = function(){
  list(
    {
      htmltools::htmlDependency(name = "app", version = "1.0",
        src = c(file = normalizePath("./inst/app")), script = c("js/script.js","js/picker.js", "js/picker.date.js"),
        stylesheet = "css/style.css")
    }
  )
}
attachAppDependencies = function(p){
  p |> materialiseDash::attachMaterialiseDep() |>
  htmltools::tagList(
    appDep()
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
