Page = function(){
  page = list()
  page$index = function(){
    page_wish2() |> app$test("docs/index.html")
  }
  page$form = function(){
    page_form() |> app$test("docs/form.html")
  }
  page$all = function(){
    purrr::walk(
      setdiff(names(page), "all"),
      ~{
        page[[.x]]()
      }
    )
  }
  return(page)
}
