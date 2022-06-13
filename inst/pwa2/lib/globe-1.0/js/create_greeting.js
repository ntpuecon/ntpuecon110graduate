createGreeting = function(content, signature) {
 var $new=$("#greetingGallery");
 $new.append("<a class='carousel-item'></a>");
ReactDOM.render(
  React.createElement(
    "div",
    { "class": "card-greeting" },
    React.createElement("div", { "class": "divider" }),
    React.createElement(
      "div",
      { "class": "section elegant-scroll" },
      content
    ),
    React.createElement("div", { "class": "divider" }),
    React.createElement(
      "div",
      { "class": "signature" },
      React.createElement("div", { "class": "signature-img" }),
      React.createElement(
        "div",
        { "class": "signature-name" },
        signature
      )
    )
), $("#greetingGallery > a:last-child")[0]);
};
initCarousel = function(){
  var elems = document.querySelectorAll('.carousel');
    var instances = M.Carousel.init(elems);
};
