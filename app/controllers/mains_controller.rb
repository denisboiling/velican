class MainsController < ApplicationController
  def index
    @page = StaticPage.find_by_permalink('main')
    set_seo_by_page(@page.seo_stuff)
    @active_page = @page.permalink
    @products = Product.for_main
  end

  def show
  end
end
