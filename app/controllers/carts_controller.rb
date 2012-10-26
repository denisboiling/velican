class CartsController < ApplicationController
  before_filter :get_user_key

  def show
  end

  def remote_cart
    order = (Order.find_by_user_key(@user_key) if @user_key.present?)
    respond_to do |format|
      format.json { render :json => {
	  order: order,
          line_item_ids: order.line_item_ids,
          line_items: order.line_items.map {|li| { product_id: li.product_id, quantity: li.count }}
	}
      }
    end
  end

  def add_to_cart
    order = LineItem.add_product(@user_key, params[:product], params[:count])
    respond_to do |format|
      format.json { render :json => {
	  order: order,
          line_item_ids: order.line_item_ids,
          line_items: order.line_items.map {|li| { product_id: li.product_id, quantity: li.count }}
	}
      }
    end
  end

  def destroy_order
    Order.where('state != ? AND user_key = ?', 'done', @user_key).last.destroy
    redirect_to root_path
  end

  private

  def get_user_key
    @user_key = cookies[:user_key]
  end
end
