createCountryTable = function(){
  # web scraped from https://www.ifreesite.com/postal/
  clipr::read_clip() -> .table
  toString(.table) |> rvest::read_html() -> .html
  .html |> rvest::html_table() -> countryTable
  countryTable[[1]] -> countryTable

  countryTable[1,] |> as.character() ->
    names(countryTable)
  View(countryTable)
  countryTable |>
    dplyr::slice(-1) -> countryTable

  usethis::use_data(countryTable)


}

mergeCountryTable = function(){
  googlesheets4::read_sheet(
    ss="https://docs.google.com/spreadsheets/d/1AE7_zIHORciJF3QmFaQrWeq4c9gmhzyycOYO1FblRbk/edit#gid=1529622625",
    sheet="Capitals"
  ) -> capitals
  capitals$CountryCode  |> as.character() -> capitals$CountryCode
  capitals |>
    dplyr::left_join(
      countryTable, by = c("CountryCode"="二字母碼")
    ) -> capitals2
  View(capitals2)
  capitals2 |>
    dplyr::filter(!is.na(中文)) -> capitals3 #|> View()

  usethis::use_data(capitals3)

  capitals |> View()
  capitals3 |> View()
}
