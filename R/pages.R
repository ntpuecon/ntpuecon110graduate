page_teacherGreeting = function(){
  teacher_greeting_card() |>
    htmltools::save_html(
      "docs/teacher_greeting.html"
    )
}
page_globeCard = function(){
  globeCard() |>
    htmltools::save_html(
      "docs/globe.html"
    )
}
