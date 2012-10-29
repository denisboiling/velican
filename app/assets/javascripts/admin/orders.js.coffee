$ ->
  return if $("body.show.admin_orders").length == 0

  $("a.remove_link").bind 'click', () ->
    $(this).parents("tr:first").remove()