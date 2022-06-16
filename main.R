devtools::load_all(".")

# app test
apptest:::startAppTest()
page_index() |> app$test()
page_form() |> app$test("form.html")

# pwa create
apptest::pwa()
pwa$createPWA(
  page_index(), "temp"
)
pwa$generateIconsFrom512pxIcon("/Users/martinl/Github/ntpuecon110graduate/inst/pwa/icons/ntpuecon110graduate512.png")
pwa_index() |> app$test()

# app move
app$move("temp", "docs") -> result
debug(app$move)
