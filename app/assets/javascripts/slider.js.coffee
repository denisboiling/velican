$ ->    
  $("#slides .left").click ->
    inner = $(this).siblings("#slides .slide_container")
    first = inner.children(":last")
    first.prependTo(inner).fadeOut "fast"
    inner.children(":last").fadeIn "fast"

  $("#slides .right").click ->
    inner = $(this).siblings("#slides .slide_container")
    last = inner.children(":first")
    first = inner.children(":last")
    first.fadeOut "fast"
    last.appendTo(inner).fadeIn "fast"

  $(".popup.item .arrow.left").click ->
    inner = $(this).siblings(".popup.item .product")
    first = inner.children(":last")
    first.prependTo(inner).fadeOut "fast"
    inner.children(":last").fadeIn "fast"

  $(".popup.item .arrow.right").click ->
    inner = $(this).siblings(".popup.item .product")
    last = inner.children(":first")
    first = inner.children(":last")
    first.fadeOut "fast"
    last.appendTo(inner).fadeIn "fast"