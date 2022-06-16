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

# ----- Post Change ----
devtools::load_all(".")
apptest:::startAppTest()
apptest::pwa()
# change PWA manifest
pwa$json |> View()
pwa$json$name="NTPU Economics Wish 2022"
pwa$json$short_name="NESH 2022"
pwa$json$description="這是給國立臺北大學經濟學系2022年學士班及進修學士班畢業生互道畢業祝福的App ( N.tpu E.conomics wi.SH，簡稱NESH)。"
pwa$json$scope="/ntpuecon110graduate"
pwa$updateManifest()
debug(pwa$updateManifest)
pwa_index() |> app$test()
page_form() |> app$test("form.html")


apptest:::startAppTest()
app$move("temp", "docs") -> result
servr::httd("docs")
