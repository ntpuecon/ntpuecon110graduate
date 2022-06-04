form <- function(){
  require(htmltools)
  tagList(
    tags$style("
      button.datepicker-day-button {
color: black;}"),
    tags$div(class = "row",
      tags$form(class = "col s12",
        tags$div(class = "row",
          {tags$div(class = "input-field col s12",
            tags$i(class = "material-icons prefix",
              "account_circle"),
            tags$input(id = "icon_prefix",
              type = "text",
              class = "validate"),
            tags$label(`for` = "icon_prefix",
              "姓名"))}),
        tags$div(class = "row",
          {tags$div(class = "input-field col s12",
            tags$i(class = "material-icons prefix",
              "badge"),
            tags$input(id = "icon_telephone",
              type = "tel",
              class = "validate"),
            tags$label(`for` = "icon_telephone",
              "學號"))}),
        tags$div(class = "row",
          {
            tags$div(class = "input-field col s12",
              tags$i(class = "material-icons prefix",
                "cake"),
              tags$input(
                id="inputBday",
                type = "text",
                class = "datepicker"),
              tags$label(`for`="inputBday",
                "生日")
            )
          }),
        tagList(
          tags$div(class = "row",
            tags$div(class = "input-field col s12",
              tags$i(class = "material-icons prefix",
                "volunteer_activism"),
              tags$textarea(id = "inputWords",
                class = "materialize-textarea"),
              tags$label(`for` = "inputWords",
                "給同學的祝福")))
        )

        )
      )
  )
}
card = function(content, title="Card Title"){
  require(htmltools)
  tagList(
    tags$style("
    i.material-icons.prefix {
     color: purple;
    }
      "),
    tags$div(class = "row",
      tags$div(class = "col s12 m6",
        tags$div(class = "card",
          tags$div(class = "card-content white-text",
            tags$span(class = "card-title",
              title),
            content,
            {
              tags$div(class = "row center-align",
                {tags$button(class = "activator btn waves-effect waves-light purple lighten-1",
                  type = "submit",
                  name = "action",
                  "預覽",
                  tags$i(class = "material-icons right",
                    "pageview"))},
                {tags$button(class = "btn waves-effect waves-light purple lighten-1",
                  type = "submit",
                  name = "action",
                  "送出",
                  tags$i(class = "material-icons right",
                    "send"))})
            }),
            {tags$div(class = "card-reveal",
              tags$span(class = "card-title grey-text text-darken-4",
                "Card Title",
                tags$i(class = "material-icons right",
                  "close")),
              tags$p("Here is some more information about this product that is only revealed once clicked on."))}
          )))
  )
}
wishCard = function(){
  attachAppDependencies(
    form() |> card()
  )
}
mainUI = function(){
  require(htmltools)
  div(
    class="row center-align",
    div(class="col s12", globe()),
    div(class="col s12 center-align", tree() ))
}
appDemo = function(){
  mainUI() |>
    ntpuecon110graduate::attachAppDependencies() |>
    app$update()
}
tree = function(){
  require(htmltools)
  tags$img(
    class="responsive-img",
    src="lib/ntpuecon110-1/img/tree.svg"
  ) |>
    tagList(
  htmltools::htmlDependency(
    name="ntpuecon110",
    version="1",
    src=c(file=system.file("ntpuecon110", package="ntpuecon110graduate")),
    script="",
    all_files = T
  ))
}
# tree() |> app$update()

globe() |> plotly_build() -> p_globe
View(p_globe)
