pickDate = function(id, name){
  require(htmltools)
  tagList(
  tags$style("
      button.datepicker-day-button {
color: black;}"),
  {
    tags$div(class = "input-field col s12",
      tags$i(class = "material-icons prefix",
        "cake"),
      tags$input(
        id=id, name=name,
        type = "text",
        class = "datepicker"),
      tags$label(`for`=id,
        "生日")
    )
  }
    )-> tagPickDate

  file.edit("inst/ntpuecon110/js/pickdate.js")
  function(){
    tagList(
      tagPickDate,
      htmltools::includeScript(
        "inst/ntpuecon110/js/pickdate.js"
      )
    )
  }
}

# pd=pickDate()
#
# pd() |> attachAppDependencies() |> econWeb::browseTag2()
