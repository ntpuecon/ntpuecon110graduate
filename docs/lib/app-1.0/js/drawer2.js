$(function(){
  topHeight= $(".topdrawer").map((i,e) => {
    let heightx=$(e).height();
    $(e).css("bottom", -heightx+'px');
    return(heightx);
  });

  btmWidth=Array($(".borromdrawer").length).fill();
  btmHeight= $(".bottomdrawer").map((i,e) =>{
    btmWidth[i]=$(e).width();
    $($(".drawer")[i]).width($(e).width());
    return($(e).height())});

  topHeight.map((i, t)=> {
    $($(".drawer")[i]).height(t+btmHeight[i])
  })

  animateSetupsAll = Array($(".drawer").length).fill();
  animateSetupsAll=animateSetupsAll.map((e,i) => {
     return([{bottom: '-'+topHeight[i]+"px"},{bottom: (btmHeight[i])+"px"}])
  });
  tout = Array($(".drawer").length).fill(null);
  toggleDrawer = Array($(".drawer").length).fill().map((e,i) =>{
    return(generate_toggleDrawer(i))
  });
  for(let j=0;j<$(".bottomdrawer").length;j++){
    $($(".bottomdrawer")[j]).click(()=>{
      if(tout[j]){
          clearTimeout(tout[j]);
          tout[j]=null;
        }
        toggleDrawer[j]()
    })
  }
  /*
  toggleDrawer.map((tg, i) =>{
    console.log($(".bottomdrawer")[i]);
    $($(".bottomdrawer")[i]).click(
      ()=>{
        console.log($(".bottomdrawer")[i]);
        console.log(i);
        if(tout[i]){
          clearTimeout(tout[i]);
          tout[i]=null;
        }
        tg()
      }
    )
  })*/
})


generate_toggleDrawer = function(i){
  let animateSetups=animateSetupsAll[i];
  let drawerStatus=1;
  return(function(){
  $($(".topdrawer")[i]).animate(
  animateSetups[drawerStatus],300, ()=>{
    // current open
    if(drawerStatus===1){
     drawerStatus=0;
     tout[i]=setTimeout(function(){
            if(drawerStatus===1){
              closeDrawer[i]();
            }
          }, 3000);
     console.log(drawerStatus);
    } else {
      // current close
      drawerStatus=1;

     console.log(drawerStatus);
    }
    console.log(drawerStatus);
  });
})

}

closeDrawer = Array($(".drawer").length).fill().map((e,i)=>{
  return(
    function(){
  $($(".topdrawer")[i]).animate(
  animateSetupsAll[i][0],300)
}
  )
})

