carousel = function(...){
  require(htmltools)
  arglist = list(...)
  arglist |> purrr::map(carouselItem) -> carouselItems
  tags$div(class = "carousel",
    carouselItems) |>
    tagList(
  #     tags$script("document.addEventListener('DOMContentLoaded', function() {
  #   var elemsCarousel = document.querySelectorAll('.carousel');
  #   var instCarousel = M.Carousel.init(elemsCarousel, {
  #     // specify options here
  #   });
  # });")
    ) |> attachAppDependencies()
}
carouselItem = function(..., href="#"){
  tags$a(class = "carousel-item",
    href = href,
    ...)
}
carouselExample = function(){
  carousel(
    greeting_card2(),
    tags$img(src="https://materializecss.github.io/materialize/images/placeholder/250x250_a.png"),
    tags$img(src="https://materializecss.github.io/materialize/images/placeholder/250x250_b.png"),
    tags$img(src="https://materializecss.github.io/materialize/images/placeholder/250x250_c.png"),
    tags$img(src="https://materializecss.github.io/materialize/images/placeholder/250x250_d.png"),
    tags$img(src="https://materializecss.github.io/materialize/images/placeholder/250x250_e.png")
  )
}
