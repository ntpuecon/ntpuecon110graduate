{world = map_data("world")
ggplot()+
  geom_polygon(
    data = world,
    aes(
      x=lon, y=lat,
      group=region))
# +
  coord_map()

ggplot()+
  geom_map(
    data=world, map=world,
    aes(lon, lat, map_id=region)
  )+coord_map()
world = ggplot2::map_data("world")
world0 <- function(color="black", fill="white", size=0.35)}
{
  ggplot() + geom_polygon(
    data=world,
    aes(
      x=long, y=lat,
      group=group
    ),
    color=color, fill=fill, size=size
  )
}
{# Cartesian crs
world0()
# Cartesian with fixed aspect ratio
world0() + coord_fixed()
# Mercator projection: fixed asp, correct direction
world0() + coord_map( projection = "orthographic")
# Mercator projection: fixed asp, correct direction, expand xlim
world0() + coord_map(xlim = c(-180,180), projection = "orthographic")
}

seq(0,1, length.out=100)-> r
expand.grid(r, r)-> mat

get_z = function(x, y, R=1){
  if(x**2+y**2>R**2) return(2*R)

  # x=0.3;y=0.4

  rhat=sqrt(x**2+y**2)
  coslat=rhat/R
  lat=acos(coslat)
  z=rhat*tan(lat)
  # tan(lat)=z/rhat
  # lat=acos(rhat/R)
  # z=R*cos(lat)
  return(z)
}
get_z = function(x, y, R=1){
   z = sqrt(R**2-(x**2+y**2))
   return(z)
}
get_z(0.3, 0.3)
R=1
length.out=100
map_xyz = function(R=1, length.out=100){
  get_zSafe=purrr::safely(get_z)
  seq(-R,R, length.out=length.out)-> r
  expand.grid(r, r)-> mat
  purrr::map2(
    mat$Var1, mat$Var2, ~get_zSafe(.x, .y, R=R)
  ) -> listxyz
  purrr::map_lgl(
    listxyz, ~{!is.nan(.x[["result"]])}
  ) -> pickValid
  listxyz[pickValid] -> listxyzValid
  purrr::map_dbl(
    listxyzValid, ~{.x[["result"]]}
  ) -> z
  cbind(mat[pickValid],z)
}
map_xyz() -> listxyz
purrr::map_lgl(
  listxyz, ~{!is.nan(.x[["result"]])}
) -> pickValid
listxyz[pickValid] -> listxyzValid
purrr::map_dbl(
  listxyzValid, ~{.x[["result"]]}
) -> z

{
  -> z
  cbind(mat[,1], mat[,2], z) -> mat
  colnames(mat) <- c("x","y","z")
  mat
}
# get map -----------------------------------------------------------------


map_xyz() -> mat
(mat[,3] ==2) -> whichNotGlobe
mat[-whichNotGlobe,]-> matValid
View(matValid)
plot_ly() |>
  add_surface(z=matValid)

data.frame(
  notGlobe=whichNotGlobe
) -> df2
df2 |> cbind(as.data.frame(mat)) -> df_globe
View(mat)
plotly::plot_ly(
  df_globe
) |>
  add_surface(
    z=mat)
