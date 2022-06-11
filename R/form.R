greetingForm = function(){
  wishCard(
    ids = generate_ids(),
    .names=c("name","schoolId", "bday", "words"),
    postUrl=NULL)
}
wishCard = function(ids, .names, postUrl=NULL, href="index.html"){

  form(ids, .names, postUrl) |> card(href) |>
    attachAppDependencies(page="form")
  # googleFormEmbed())
}
