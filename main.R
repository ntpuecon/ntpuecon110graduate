devtools::load_all(".")

# app test
apptest:::startAppTest()
page_index() |> app$test()
page_form() |> app$test("form.html")

# pwa create
apptest::pwa()
## use page_index() tag to create a PWA in temp folder
pwa$createPWA(
  page_index(), "temp"
)
## feed in 512x512px icon for icons generation, and update webmanifest accordingly
pwa$generateIconsFrom512pxIcon("/Users/martinl/Github/ntpuecon110graduate/inst/pwa/icons/ntpuecon110graduate512.png")
## check the pwa version of page_index
pwa_index() |> app$test()


## When satisfied with the test, move app to the publishing folder:
app$move("temp", "docs") -> result

# ----- Post Change ----
devtools::load_all(".")
apptest:::startAppTest()
apptest::pwa()
# change PWA manifest
pwa$json |> View()
pwa$json$name="Ntpu Economics wiSH 2022"
pwa$json$short_name="NESH 2022"
pwa$json$description="這是給國立臺北大學經濟學系2022年學士班及進修學士班畢業生互道畢業祝福的App ( Ntpu Economics wiSH, NESH)。"
pwa$json$scope="/"
pwa$json$start_url="index.html"
pwa$json$orientation="portrait"
pwa$updateManifest()
pwa_index_sidenav() |> app$test()
page_form() |> app$test("form.html")


apptest:::startAppTest()
app$move("temp", "docs") -> result




# change UI  --------------------------------------------------------------


