$ ->    
  $("#main .item.pr .popup.item .arrow.left").live "click", ->
    inner = $(this).siblings(".product")
    first = inner.children(":last")
    first.prependTo(inner).fadeOut "fast"
    inner.children(":last").fadeIn "fast"

  $("#main .item.pr .popup.item .arrow.right").live "click", ->
    inner = $(this).siblings(".product")
    last = inner.children(":first")
    first = inner.children(":last")
    first.fadeOut "fast"
    last.appendTo(inner).fadeIn "fast"

  $("#main .product.pr").live "click", -> 
    $("#main .popup_pr").show()
    $(this).closest(".item.pr").find(".popup.item").show()

  $("#main .popup_pr").live "click", ->
    $("#main .popup_pr").hide()
    $("#main .item.pr .popup.item").hide()

  $("#main .product.pr.inactiv").live "click", -> 
    $("#main .popup_pr").hide()
    $(this).closest(".item.pr").find(".popup.item").hide()

