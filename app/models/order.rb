class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy, after_add: :update_price
  has_one :info, class_name: 'OrderInfo', dependent: :destroy

  attr_accessible :state, :user, :full_price

  state_machine :state, :initial => :new do

    after_transition any => :complete, :do => :email_notify

    event :to_complete do
      transition :new => :complete
    end

    event :to_done do
      transition :complete => :done
    end
  end

  scope :complete, where(state: 'complete')
  scope :done, where(state: 'done')

  after_create :assign_info

  def assign_info
    order_info = OrderInfo.new(order: self)
    order_info.save!(validate: false)
  end

  def email_notify
    Notifier.customer_order_notify(self).deliver
    Notifier.admin_order_notify(self).deliver
  end

  def update_price(thing)
    self.update_attribute(:full_price, self.line_items.sum(:price))
  end

  def update_price!
    update_attribute(:full_price, self.line_items.sum(:price))
  end

  def uncomplete?
    state != 'done'
  end
end
