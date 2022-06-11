generate_ids= function(){
  c("inputName", "inputId", "inputBday", "inputWords")
}
generate_googleForm = function(.names=makenames()){
  list(
    entries=.names,
    postUrl=ntpuecon110graduate::webAppUrl
  )
}
form <- function(ids=generate_ids(), .names= NULL, postUrl= NULL, href="index.html"){
  require(htmltools)


  input_name = {tags$div(class = "input-field col s12",
    tags$i(class = "material-icons prefix",
      "account_circle"),
    tags$input(id = ids[[1]], name=.names[[1]],
      type = "text",
      class = "form-data validate"),
    tags$label(`for` = ids[[1]],
      "姓名"))}
  input_id = {tags$div(class = "input-field col s12",
    tags$i(class = "material-icons prefix",
      "badge"),
    tags$input(id = ids[[2]], name=.names[[2]],
      type = "tel",
      class = "form-data validate"),
    tags$label(`for` = ids[[2]],
      "學號"))}
  input_bday = pickDate(id=ids[[3]],name=.names[[3]])
  input_words={tags$div(class = "input-field col s12",
    tags$i(class = "material-icons prefix",
      "volunteer_activism"),
    tags$textarea(id = ids[[4]], name=.names[[4]],
      class = "materialize-textarea form-data"),
    tags$label(`for` = ids[[4]],
      "給同學的祝福"))}
  buttons =       {
    tags$div(class = "row center-align",
      {tags$button(class = "activator btn waves-effect waves-light purple lighten-1",
        type = "button",
        name = "action",
        "預覽",
        tags$i(class = "material-icons right",
          "pageview"))},
      {tags$button(class = "btn waves-effect waves-light purple lighten-1", id="submitButton",
        type = "submit",
        name = "action",
        "送出",
        tags$i(class = "material-icons right",
          "send"))})
  }
  outputframe = tags$iframe(
    name="output_frame", src="", id="output_frame", style="display:none;"
  )

  tagForm = {tags$form(class = "col s12",
    method="POST",
    action=postUrl,
    target="output_frame",
    tags$div(class = "row",
      input_name),
    tags$div(class = "row",
      input_id),
    tags$div(class = "row",
      input_bday
    ),
    tags$div(class = "row",
      input_words
    ),
    buttons
  )}
  tagList(
    tags$style("
      button.datepicker-day-button {
color: black;}"),
    tags$div(class = "row",
      id="form",
      tagForm,
      outputframe
      )
  ) -> tagForm
  # tagList(
  #   tagForm,
  #   formDependency
  # )
  tagForm
}
inProgress= function(hide=T){
  .style=""
  if(hide) .style=css("display"="none")
  tagList(
    tags$style('

'),
    tags$div(class = "progress purple lighten-4", id="progress",
      style=.style,
      tags$div(class = "indeterminate purple"))
  ) -> tag_element

  tag_element |> attachAppDependencies()
}
card = function(content, title="Card Title", href="index.html"){
  require(htmltools)
  tagList(
    tags$style("
    i.material-icons.prefix {
     color: purple;
    }
      "),
    tags$div(class = "row",
      tags$div(class = "col s12 m6 offset-m3 l4 offset-l4",
        tags$div(class = "card",
          tags$div(class = "card-content white-text",
            tags$a(
              class="right", href=href,
              tags$i(class="material-icons close", 'close')
            ),
            tags$span(class = "card-title",
              title),
            tagList(content,
              inProgress(),
              tags$h6("上傳成功", style="display:none;color:#212121", id="successtitle")
              )
            ),
          tags$div(class="card-action",
              {tags$a(class = "waves-effect waves-light btn purple",
                id="success",
                style="display:none;",
                href=href,
                tags$i(class = "material-icons right",
                  "public"),
                "返回地球")},
            # tags$a(
            #   id="success",
            #   style="display:none;",
            #   href="#", "返回地球")),
            {tags$div(class = "card-reveal",
              tags$span(class = "card-title grey-text text-darken-4",
                "Card Title",
                tags$i(class = "material-icons right",
                  "close")),
              tags$p("Here is some more information about this product that is only revealed once clicked on."))}
          )
          ))
  ))
}
card2 = function(content, title="Card Title"){
  require(htmltools)
  tagList(
    tags$style("
    i.material-icons.prefix {
     color: purple;
    }
      "),
    tags$div(class = "row",
      tags$div(class = "col s12 m6 offset-m3 l4 offset-l4",
        tags$div(class = "card pushpin",
          tags$div(class = "card-content white-text",
            tags$span(class = "card-title",
              title),
            content,
          )
        ),
        tags$script("$(function(){ $('.pushpin').pushpin();})")))
  )
}
mainUI = function(){
  require(htmltools)
  div(
    class="row center-align",
    div(class="col s12", globe()),
    div(class="col s12 center-align", tree() ))
}
buttons_playStop = function(){
  tags$div(class = "row center-align",
    {tags$button(class = "activator btn waves-effect waves-light purple lighten-1",
      type = "button",
      name = "action", id="stop",
      # "預覽",
      tags$i(class = "material-icons center",
        "stop"))},
    {tags$button(class = "btn waves-effect waves-light purple lighten-1", id="play",
      type = "button",
      name = "action",
      # "送出",
      tags$i(class = "material-icons center",
        "play_arrow"))})
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
