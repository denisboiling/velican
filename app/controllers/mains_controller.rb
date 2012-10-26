class MainsController < ApplicationController
  def index
    @page = StaticPage.find_by_permalink('main')
    @active_page = @page.permalink
    @products = Product.first(3)
  end

  def show
  end
end
