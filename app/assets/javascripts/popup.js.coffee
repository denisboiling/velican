$ ->    
  $("#main .item.pr .popup.item .arrow.left").click ->
    inner = $(this).siblings(".popup.item .product")
    first = inner.children(":last")
    first.prependTo(inner).fadeOut "fast"
    inner.children(":last").fadeIn "fast"

  $("#main .item.pr .popup.item .arrow.right").click ->
    inner = $(this).siblings(".popup.item .product")
    last = inner.children(":first")
    first = inner.children(":last")
    first.fadeOut "fast"
    last.appendTo(inner).fadeIn "fast"

  $("#main .product.pr").click ->
    $(".popup_pr").show()
    $(".popup.item").show()

  $(".popup_pr").click ->
    $(".popup_pr").hide()
    $(".popup.item").hide()

  $(".popup.item .cart a").click ->
    $(".popup_pr").hide()
    $(".popup.item").hide()


