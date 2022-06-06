greetingForm = function(){
  wishCard(
    ids = generate_ids(),
    .names=c("name","schoolId", "bday", "words"),
    postUrl=NULL)
}
wishCard = function(ids, .names, postUrl=NULL){

  form(ids, .names, postUrl) |> card() |>
    attachAppDependencies()
  # googleFormEmbed())
}
