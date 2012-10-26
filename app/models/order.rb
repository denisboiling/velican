class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy, after_add: :update_price

  attr_accessible :state, :user, :full_price

  state_machine :state, :initial => :new do
    event :to_complete do
      transition :new => :complete
    end

    event :to_done do
      transition :complete => :done
    end
  end

  def update_price(thing)
    self.update_attribute(:full_price, self.line_items.sum(:price))
  end

  def update_price!
    update_attribute(:full_price, self.line_items.sum(:price))
  end
end
