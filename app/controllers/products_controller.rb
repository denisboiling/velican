class ProductsController < ApplicationController
  def index
    @active_page = 'products'
    if params[:label].present?
      @products = Product.by_label(Label.find_by_title(params[:label])).paginate(:page => params[:page], :per_page => 8)
    elsif params[:category].present?
      @products = Product.by_category(Category.find_by_title(params[:category])).paginate(:page => params[:page], :per_page => 8)
    elsif params[:q].present?
      @products = Product.search(title_contains: params[:q]).paginate(:page => params[:page], :per_page => 8)
    else
      @products = Product.order('created_at DESC')
    end

    if request.xhr?
      render(@products) and return
    end
  end

  def show
  end
end
