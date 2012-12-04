# -*- coding: utf-8 -*-
class CartsController < ApplicationController
  before_filter :get_user_key

  def show
    @order = Order.find_by_user_key(@user_key)
    redirect_to root_path unless @order
    @active_page = 'cart'
  end

  def update
    @order = Order.find_by_user_key(@user_key)
    @order.info.update_attributes(params[:order_info])
    @order.to_complete!

    # TODO: it's shit
    # current_user.update_attributes(phone: @order.info.customer_phone,
    #                                address: @order.info.customer_address
    #                     )

    cookies.delete :user_key
    flash[:success] = 'Заявка отправленна, с вами созвоняться'
    redirect_to root_path
  end

  def remote_cart
    order = (Order.find_by_user_key(@user_key) if @user_key.present?)
    respond_to do |format|
      format.json { render :json => {
	  order: order,
	  line_items: order.present? ? order.line_items.map {|li| { product_id: li.product_id, quantity: li.count }} : []
	}
      }
    end
  end

  def add_to_cart
    order = LineItem.add_product(@user_key, params[:product], params[:count])
    respond_to do |format|
      format.json { render :json => {
	  order: order,
	  line_items: order.line_items.map {|li| { product_id: li.product_id,
	      quantity: li.count
	    }}
	}
      }
    end
  end

  def update_line_item
    line_item = Order.find_by_user_key(@user_key).line_items.find(params[:line_item_id])
    line_item.update_attribute(:count, params[:quantity])
    respond_to do |format|
      format.json { render :json => {
	  line_item: LineItem.find(line_item),
          line_items_count: line_item.order.line_items.count,
          full_price: line_item.order.full_price.to_i,
          products_quantity: line_item.order.line_items.sum(:count)
	}
      }
    end
  end

  def destroy_order
    Order.where('state != ? AND user_key = ?', 'done', @user_key).last.destroy
    if request.xhr?
      render text: 'ok'
    else
      flash[:warning] = 'Корзина успешно очищена.'
      redirect_to root_path
    end
  end

  def remove_line_item
    order = Order.find_by_user_key(@user_key)
    order.line_items.find(params[:id]).destroy
    order = Order.find(order)
    respond_to do |format|
      format.json { render :json => {
          line_items_count: order.line_items.count,
          full_price: order.full_price.to_i,
          products_quantity: order.line_items.sum(:count)
	}
      }
    end
  end

  private

  def get_user_key
    @user_key = cookies[:user_key]
  end
end
