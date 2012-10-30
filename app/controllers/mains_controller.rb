class MainsController < ApplicationController
  def index
    @page = StaticPage.find_by_permalink('main')
    @active_page = @page.permalink
    @products = Label.all.map {|label| label.products.present? ? label.products.sample : Product.without_label.sample}
  end

  def show
  end
end
