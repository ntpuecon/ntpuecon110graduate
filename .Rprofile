# Setup app publishing folder
appSetting=new.env()
appSetting$pusblishLocalPath = "/Users/martinl/Github/graduation-blessing2022"
attach(appSetting)

library(apptest)
devtools::load_all(".")

Test = function(){
  list(
    index=function() app$test(page_index()),
    form=function() app$test(page_form(),"form.html")
  )
}
Publish = function(){
  list(
    index=function() app$test(page_index(), "docs/index.html"),
    form=function() app$test(page_form(),"docs/form.html")
  )
}
