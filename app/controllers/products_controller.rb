class ProductsController < ApplicationController
  # TODO: it's hell
  def index
    @active_page = 'products'
    @page = StaticPage.find_by_permalink('catalog')
    set_seo_by_page(@page.seo_stuff)

    if params[:label].present?
      label = Label.find_by_title(params[:label])
      set_seo_by_page(label.seo_stuff)
      @products = Product.by_label(label).paginate(:page => params[:page], :per_page => 8)
    elsif params[:category].present?
      @category = Category.find_by_title(params[:category])
      set_seo_by_page(@category.seo_stuff)
      @products = Product.by_category(@category).paginate(:page => params[:page], :per_page => 8)
    elsif params[:q].present?
      @products = Product.search(title_contains: params[:q]).paginate(:page => params[:page], :per_page => 8)
    else
      @products = Product.paginate(:page => params[:page], :per_page => 8)
    end

    if request.xhr?
      render(@products) and return
    end
  end

  def show
  end
end
