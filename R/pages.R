page_teacherGreeting = function(){
  teacher_greeting_card() |>
#     tagList(
#       tags$style("html,
# body {
#             width: 100%;
#             height: 100%;
#             margin: 0;
#             overflow: hidden;
#             position: absolute;
#             top: 0;
#             left: 0;
# }")
#     ) |>
    htmltools::save_html(
      "docs/teacher_greeting.html"
    )
  teacher_greeting_card() |>
#     tagList(
#     tags$style("html,
# body {
#             width: 100%;
#             height: 100%;
#             margin: 0;
#             overflow: hidden;
#             position: absolute;
#             top: 0;
#             left: 0;
# }")
#   ) |>
    htmltools::save_html(
      "temp/teacher_greeting.html"
    )
}
page_globeCard = function(){
  globeCard() |>
    htmltools::save_html(
      "docs/globe.html"
    )
  globeCard() |>
    htmltools::save_html(
      "temp/globe.html"
    )
}
page_form = function(){
  greetingForm() |>
    htmltools::save_html(
      "docs/form.html"
    )
  greetingForm() |>
    htmltools::save_html(
      "temp/form.html"
    )

}
