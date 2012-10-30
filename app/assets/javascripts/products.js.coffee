load_page =() ->
  $("input#page").val(parseInt($("input#page").val()) + 1)
  window.block_load_page = true
  $.ajax
    type: 'GET',
    url: "/products?#{$('form#main_form').serialize()}",
    success: (response) ->
      $("div.item.pr:last").after(response)
      window.block_load_page = false
      
$ ->
  return if typeof(page_name) == "undefined" || page_name != "products"

  $("input.s").bind 'click', () ->
    $("input#q").val($("#q_fake").val())
    $("input#q").change()
    false

  $("a.filters").bind 'click', () ->
    if $(this).hasClass('active')
      $("input#label").val('')
    else
      $("input#label").val($(this).text())
    $("input#label").change()
    false

  $("a.menu").bind 'click', () ->
    if $(this).hasClass('active')
      $("input#category").val('')
    else
      $("input#category").val($(this).text())
    $("input#category").change()
    false

  $("form#main_form input").bind 'change', () ->
    $("input#page").val('1')
    $("form#main_form").submit()

  $(window).scroll ->
    if $(window).scrollTop() + $(window).height() > $(document).height() - 150
      if typeof(window.block_load_page) == "undefined" || window.block_load_page == false
        load_page(window.page)

  