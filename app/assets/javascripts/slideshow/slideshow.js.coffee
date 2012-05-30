if "ontouchstart" in document.documentElement 
  document.querySelector(".hint").innerHTML = "<p>Tap on the left or right to navigate</p>"
  
$ ->
  
  moveCenterToLeft = (el) ->
    el.css 'margin-left', el.width()
      
  $(".project-title").each ->
    moveCenterToLeft($(this))
    
  impress().init()
  $('body').show();
    