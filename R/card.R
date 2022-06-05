updateCard = function(){
  fig=econWeb::Fig()


  fig$export("inst/app/css/card")
}

tag_card <-function(content, name){
  tagList(
    tags$div(class = "greeting",
      tags$div(class = "card-greeting",
        tag_divisionTop(),
        tag_cardContent(content),
        tag_divisionBtm(),
        tag_signature(name),
        ),
      button_forward()))
  }
button_forward = function(){
  tagList(
    tags$style('

'),
    tags$a(class = "btn-floating pulse purple",
      id="nextpage",
      href="globe.html",
      tags$i(class = "material-icons",
        "arrow_forward_ios"))
  )
}
tag_divisionTop = function(){
    tags$div(class = "divisionTop",
      tags$div(class = "divisionTop-line"))}

tag_cardContent = function(text){
    tags$div(class = "container-greeting",
      tags$div(class = "greeting-text",
        text))}
tag_divisionBtm = function(){
     tags$div(class = "divisionBtm",
      tags$div(class = "divisionBtm-line"))}
tag_signature = function(name){
  tags$div(class = "signature",
      tags$div(class = "signature-img"),
      tags$div(class = "signature-name",
        name))}
# card_dependency <- function(){
#   htmltools::htmlDependency(
#     name="ntpuecon110graduate",
#     version="1.0.0",
#     src=c(file=system.file("/app/css", package = "ntpuecon110graduate")),
#     style="card.css",
#     all_files = F
#   )}
greeting_card <- function(content, name, dependency=NULL){
  require(htmltools)
  content |> stringr::str_split("\n") -> split_content
  split_content[[1]] |> stringr::str_subset("") -> content2
  p_flowtext= function(x) tags$p(class="flow-text", x)
  content2 |> purrr::map(p_flowtext) -> tag_content

  tagList(tag_card(tag_content, name), dependency) |>
    attachAppDependencies() |>
    card4()
}
teacher_greeting_card = function(){
  require(htmltools)
  content ="首先恭喜同學們順利畢業, 老師這時能給你們的又少了一些，就利用課堂知識組裝出這張電子卡片做為賀禮。每位同學可以透過這個App送出一則給彼此的祝福，每一則祝福會在地球上種一顆樹，同學們可以轉動地球點擊每一棵樹去看彼此的祝福。

這張卡片主要是R語言所寫成，所用的知識其實講白了大家都會懂，很單純的資料視覺化應用。老師想表達的是，知識的學習只是開始，它的力量取決於你的想像，想像有多大你的世界就有多大。期許你我都能保有一顆想像力豐富的心，也期許你我都有駕馭想像的能力。

想像有多大，世界就有多大

送給110屆畢業生。"

  greeting_card(
    content = content,
    name = "茂廷老師"
  )
}
card4 = function(content){
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
          tags$div(class = "card-content white-text content-greeting",
            content,
          )
        )))
  )
}

