var gallery= M.Carousel.getInstance($("#greetingGallery")[0]);
sd=setInterval(
  function(){gallery.next()}, 2000
);
