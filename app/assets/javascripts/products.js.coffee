load_page =(_page) ->
  $.ajax
    type: 'GET',
    url: "/products",
    data: { page: _page }
    success: (data) ->
      console.log data

$ ->
  return if typeof(page_name) == "undefined" || page_name != "products"

  # $(window).scroll ->
  #   window.page = window.page + 1
  #   console.log window.page
  #   if $(window).scrollTop() + $(window).height() > $(document).height() - 150
  #     load_page(window.page)

  