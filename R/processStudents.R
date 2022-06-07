processDayStudents = function(){

library(readxl)
dayStudents <- read_excel("private/畢業生資料(學士&進修).xlsx",
sheet = "學士4年級")
nightStudents <- read_excel("private/畢業生資料(學士&進修).xlsx",
sheet = "進修4年級")

c(
  dayStudents$生日,
  nightStudents$生日 ) |>
  stringr::str_extract("^[^/]+") |> unique() -> .years
as.integer(.years |> stringr::str_remove("^\\s0")) + 1911 -> .wyears
.patterns = stringr::str_glue("^({.years})")
.patterns
.replacement = as.character(.wyears)
names(.replacement)=.patterns
.replacement

data.frame(
  bday=c(
    dayStudents$生日,
    nightStudents$生日 ) |>
    stringr::str_replace_all(.replacement) |>
    lubridate::ymd()
) -> df_validation

df_validation$Id= c(dayStudents$學號, nightStudents$學號)

dateTmp = lubridate::stamp('Feb 01, 2002', order="mdy")
df_validation$bday |> dateTmp() -> df_validation$bdayChr
df_validation$bday |> lubridate::year() |> range()
df_validation$`schoolId-Bday`=paste0(df_validation$Id, df_validation$bdayChr)

df_validation |># View()
  select(Id, bdayChr, `schoolId-Bday`) |>
    rename(
      "schoolId"="Id", "Bday"="bdayChr"
    ) -> df_validationUpload

  googlesheets4::write_sheet(
    ss="https://docs.google.com/spreadsheets/d/1AE7_zIHORciJF3QmFaQrWeq4c9gmhzyycOYO1FblRbk/edit#gid=837043870",
    data=df_validationUpload,
    sheet='ValidInput'
  )

  df_validationUpload$`schoolId-Bday` |>
    jsonlite::toJSON() |> clipr::write_clip()
}
