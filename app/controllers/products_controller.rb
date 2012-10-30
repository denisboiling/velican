class ProductsController < ApplicationController
  def index
    @active_page = 'products'
    @products = if params[:label].present? && Label.all.map(&:title).include?(params[:label])
		  Label.find_by_title(params[:label]).products.paginate(:page => params[:page], :per_page => 8)
                elsif params[:q].present?
                  Product.search(title_contains: params[:q]).paginate(:page => params[:page], :per_page => 8)
                elsif params[:category].present?
                  Category.find_by_title(params[:category]).products.paginate(:page => params[:page], :per_page => 8)
		else
		  Product.paginate(:page => params[:page], :per_page => 8)
		end
  end

  def show
  end
end
