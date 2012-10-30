update_cart =(quantity, price) ->
  $("#cart_quantity").text(quantity)
  $("#cart_price").text(parseInt(price) + ' руб.') 
  $("#order").show()


update_products_quantity =(data) ->
  for product in data
    if field = $("input.count_field[data-product-id='#{product.product_id}']:first")
      field.val(product.quantity)
      link = field.parent().find("a.add_to_cart")
      if link.hasClass != 'active'
        link.addClass('active')

get_cart_data =() ->
  $.getJSON '/cart/remote_cart.json', (data) ->
    return if data.order == null
    price = parseFloat(data.order.full_price).toFixed(2)
    quantity = data.line_items.length
    update_products_quantity(data.line_items)
    update_cart(quantity, price)

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

show_cart =() ->
  $("div#order").show()

hide_cart =() ->
  $("div#order").hide()

$ ->
  get_cart_data()

  $("input.count_field").live 'click', () ->
    if $(this).val() <= 0
      $(this).val('')

  $("a.add_to_cart").live 'click', () ->
    text_field = $(this).parent().find("input.count_field:first")
    if text_field.val() == '' || text_field.val() <= 0
      false
    else
      product = text_field.attr('data-product-id')
      count = text_field.val()
      add_to_cart(product, count)
      if $(this).hasClass != 'active'
        $(this).addClass('active')
      false