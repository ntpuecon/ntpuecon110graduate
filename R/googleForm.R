googleFormCrawling = function(){
  rvest::read_html("https://docs.google.com/forms/d/e/1FAIpQLSeNTrYowvSJBn8iuAt3JjLvrWc-C_20aZGBF2FFW7zRVliFkg/viewform?usp=sf_link") ->
    .html

  .html |> rvest::html_element("form") ->
    form

  form |>
    rvest::html_elements("input") -> inputs
  inputs |>
    rvest::html_attrs()
  session <- econWeb::webdriverChromeSession()
  session$start_session()
  session$go("https://docs.google.com/forms/d/e/1FAIpQLSeNTrYowvSJBn8iuAt3JjLvrWc-C_20aZGBF2FFW7zRVliFkg/viewform")
  form = session$executeScript(
    'html=document.getElementsByTagName("form")[0].outerHTML;
  return html'
  )
  .html = rvest::read_html(form)
  .html |>
    rvest::html_elements("input") -> inputs
  inputs |>
    rvest::html_attr("name") |>
    stringr::str_subset("^entry") -> entries

  .html |>
    rvest::html_elements("form") |>
    rvest::html_attr("action") -> postUrl
  list(
    entries=entries,
    postUrl=postUrl
  ) -> googleForm
  googleForm
}
# econIDV::Object(appmeta)
# appmeta$add(googleForm)
# appmeta$save()
load_appmeta = function(){
  appmeta <<- readRDS("data/appmeta.Rds")
}
