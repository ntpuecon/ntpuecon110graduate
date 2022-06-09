carousel = function(...){
  require(htmltools)
  arglist = list(...)
  arglist |> purrr::map(carouselItem) -> carouselItems
  tags$div(class = "carousel", id="greetingGallery",
    carouselItems
    # carouselHiddenItems(10)
    ) |>
  attachAppDependencies() |>
    tagList(
      # tags$style("
      #   .hide {display:none;}"),
      html_dependency_react()
    )
}
carouselItem = function(..., href="#"){
  tags$a(class = "carousel-item",
    href = href,
    ...)
}
carouselHiddenItems = function(n){
  purrr::map(1:n,
    ~{tags$a(class = "carousel-item hide")}
    )
}
carouselExample_deprecated = function(){
  carousel(
    greeting_card2(),
    tags$img(src="https://materializecss.github.io/materialize/images/placeholder/250x250_a.png"),
    tags$img(src="https://materializecss.github.io/materialize/images/placeholder/250x250_b.png"),
    tags$img(src="https://materializecss.github.io/materialize/images/placeholder/250x250_c.png"),
    tags$img(src="https://materializecss.github.io/materialize/images/placeholder/250x250_d.png"),
    tags$img(src="https://materializecss.github.io/materialize/images/placeholder/250x250_e.png")
  )
}
