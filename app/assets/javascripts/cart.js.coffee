update_cart =(quantity, price) ->
  $("#cart_quantity").text(quantity)
  $("#cart_price").text(parseInt(price) + ' руб.')
  if ! $("#order").is(":visible")
    $("#order").show()
    $(window).scrollTop(0)


update_products_quantity =(data) ->
  for product in data
    if field = $("input.count_field[data-product-id='#{product.product_id}']:first")
      field.val(product.quantity)
      div = field.parent()
      if div.hasClass != 'active'
        div.addClass('active')

get_cart_data =() ->
  $.getJSON '/cart/remote_cart.json', (data) ->
    return if data.order == null || data.line_items.length == 0
    price = parseFloat(data.order.full_price).toFixed(2)
    quantity = data.line_items.length
    update_products_quantity(data.line_items)
    update_cart(quantity, price)

notify_product =(product_id, quantity) ->
  product_title = $("input.count_field[data-product-id='#{product_id}']:first").
                    parents("div.item:first").find("h2.product_title").text()
  product_quantity = $("input.count_field[data-product-id='#{product_id}']:first").val()
  window.send_notify("Вы добавили продукт \"#{product_title}\" в количестве #{product_quantity} штук", "information")

add_to_cart =(product, count) ->
  $.ajax
    type: 'PUT'
    url: '/cart/add_to_cart'
    data:
      product: product
      count: count
    success: (data) ->
      price = parseFloat(data.order.full_price).toFixed(2)
      quantity = data.line_items.length
      update_cart(quantity, price)
      notify_product(product, count)

show_cart =() ->
  $("div#order").show()

hide_cart =() ->
  $("div#order").hide()

destroy_order =() ->
  $.ajax
    type: 'DELETE'
    url: '/cart/destroy_order'
    complete: (data) ->
      window.send_notify("Корзина успешно очищена.", "warning")
      hide_cart()
      $("input.count_field").each ->
        $(this).val(0)

remove_line_item =(id) ->
  $.ajax
    type: 'DELETE'
    url: '/cart/remove_line_item'
    data:
      id: id
    success: (data) ->
      $("#line_items_count").text(data.line_items_count)
      $("#full_price").text(data.full_price)
      $("#products_quantity").text(data.products_quantity)
      if data.line_items_count <= 0
        $("div.order_form").hide()

show_notifications =() ->
  $("div.hidden.notifications div").each ->
    window.send_notify($(this).text(), $(this).attr('id'))

line_item_update_quantity =(line_item_id, quantity) ->
  return_response = ""
  $.ajax
    type: 'PUT'
    url: '/cart/update_line_item'
    data:
      line_item_id: line_item_id
      quantity: quantity
    success: (data) ->
      $("div.item[data-line-item-id='#{line_item_id}']:first").
        find(".line_item_price").text(parseInt(data.line_item.price))
      $("#line_items_count").text(data.line_items_count)
      $("#full_price").text(data.full_price)
      $("#products_quantity").text(data.products_quantity)

$ ->
  show_notifications()

  get_cart_data()

  $("input.count_field").live 'click', () ->
    if $(this).val() <= 0
      $(this).val('')

  $("input.intem_count").bind 'change', () ->
    line_item_id = $(this).parents("div.item").attr("data-line-item-id")
    quantity = $(this).val()
    line_item_update_quantity(line_item_id, quantity)

  $("input.count_field").blur ->
    if $(this).val() == ''
      $(this).val(0)

  $("a.add_to_cart").live 'click', () ->
    text_field = $(this).parent().find("input.count_field:first")
    if text_field.val() == '' || text_field.val() <= 0
      false
    else
      product = text_field.attr('data-product-id')
      count = text_field.val()
      add_to_cart(product, count)
      if $(this).parent().hasClass != 'active'
        $(this).parent().addClass('active')
      false

  $("a#destroy_order").live 'click', () ->
    destroy_order()
    false

  $("a.remove_line_item").bind 'click', () ->
    console.log "DSADSDA"
    id = $(this).parents('div.item.or:first').attr('data-line-item-id')
    remove_line_item(id)
    $(this).parents('div.item.or:first').remove()
    false