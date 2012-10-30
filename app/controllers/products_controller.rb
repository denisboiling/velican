class ProductsController < ApplicationController
  def index
    @active_page = 'products'
    @products = Product.order('created_at DESC')
    @products = @products.by_label(Label.find_by_title(params[:label])) if params[:label].present?
    @products = @products.by_category(Category.find_by_title(params[:category])) if params[:category].present?

    if params[:q].present?
      @products = @products.search(title_contains: params[:q]).paginate(:page => params[:page], :per_page => 8)
    else
      @products = @products.paginate(:page => params[:page], :per_page => 8)
    end

    if request.xhr?
      render(@products) and return
    end
  end

  def show
  end
end
