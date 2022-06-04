gsheet = function(){
  require(htmltools)
  tagList(
    htmltools::includeHTML(
      "/Users/martinl/Github/ntpuecon110graduate/inst/ntpuecon110/html/googlesheets.html"
    )) -> gsapp
  gsapp |>
    app$update()

}
makenames=function(){
  c("name", "schoolId", "bday", "words")
}
createGoogleSheets=function(.names=makenames(), sheetname="mysheets"){
  df=vector("list", length(.names)+1)
  purrr::map(df, ~{character(0)})-> df
  names(df)=c("Timestamp", .names)
  list2DF(df) -> df #|> View()
  googlesheets4::gs4_auth()
  ss1 <-googlesheets4::gs4_create(sheetname)

  googlesheets4::write_sheet(
    ss=ss1,
    sheet="Sheet1",
    data=df
  ) -> ss1
  ss1 |> googlesheets4::gs4_browse()
  invisible(ss1)
}
formMeta = function(.names, postUrl){
  list(
    entries = .names,
    postUrl = postUrl
  )
}
createFormData <- function(.names=names(), sheetname="mySheet"){

  steps= new.env()

  steps$s1_create_googleSheet = function(){
    createGoogleSheets(.names, sheetname)
    message("Follow the link to setup the popup sheet\n https://socialmaharaj.com/2021/05/21/how-to-create-custom-google-form/\n then continue to s2_enterGScriptInfo()")

    steps$s2_enterGScriptInfo = function(){
      rstudioapi::showPrompt("","Deployment Id") -> deploymentId
      rstudioapi::showPrompt("","Web app url") -> webAppUrl

      system.file("googlesheets/ajax.js", package="ntpuecon110graduate") -> ajaxFile
      xfun::read_utf8(ajaxFile) -> jslines

      stringr::str_replace(
        jslines[[4]],
        "webAppUrl", webAppUrl) -> jslines[[4]]

      if(!dir.exists("inst/app/js")) dir.create("inst/app/js")
      jslines= c(
        "submitForm = function(){",
        jslines,
        "}"
      )
      xfun::write_utf8(
        jslines, "inst/app/js/formsubmit.js"
      )
      file.edit("inst/app/js/formsubmit.js")

      formDependency =
        htmltools::htmlDependency(
          name="formsubmit",
          version="1.0.0",
          src=c(file=normalizePath("inst/app/js/")),
          script="formsubmit.js"
        )

      usethis::use_data(
        formDependency
      )
    }
  }

  steps

}
