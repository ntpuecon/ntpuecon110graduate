## code to prepare `formDependency` dataset goes here
formDependency =
  htmltools::htmlDependency(
    name="formsubmit",
    version="1.0.0",
    src=c(file=normalizePath("inst/app/js/")),
    script="formsubmit.js"
  )
usethis::use_data(formDependency, overwrite = TRUE)
