gsheet = function(){
  require(htmltools)
  tagList(
    htmltools::includeHTML(
      "/Users/martinl/Github/ntpuecon110graduate/inst/ntpuecon110/html/googlesheets.html"
    )) -> gsapp
  gsapp |>
    apptest::App() -> app
  app$create()
  app$setup(app_port = 8880)
  app$view()

}
