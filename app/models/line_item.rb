class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  attr_accessible :product_id, :order_id, :count, :price

  validates :count, :numericality => true, :length => { :minimum => 0 }

  before_save :update_price

  def update_price
    self.price = self.count * self.product.price
  end

  class << self
    def add_product(user_key, product_id, count)
      order = Order.find_or_create_by_user_key(user_key)

      # Add update count of product
      if order.line_items.where(product_id: product_id).present?
        order.line_items.where(product_id: product_id).last.update_attribute(:count, count)
        order.update_price!
      else
        order.line_items.create(product_id: product_id, count: count)
      end

      Order.find(order)
    end
  end


end
