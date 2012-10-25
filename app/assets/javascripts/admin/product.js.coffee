product_id =() ->
  regex = /products\/(\d+)/
  regex.exec(window.location.href)[1]

add_images =() ->
  data = new FormData()
  jQuery.each $("#add_image")[0].files, (i, file) ->
    data.append 'images[]', file

  $.ajax "/admin/products/#{product_id()}/add_image",
    type: 'POST'
    data: data
    cache: false
    contentType: false
    processData: false
    complete: (response) ->
      $(".images").append(response.responseText)
      $("#add_image").val('')

$ ->
  return if $("body.admin_products").length == 0

  $("#add_image_button").bind 'click', () ->
    add_images()
    false

