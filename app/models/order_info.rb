class OrderInfo < ActiveRecord::Base
  belongs_to :order

  attr_accessible :customer_name, :customer_email, :customer_address, :comment, :order, :customer_phone

  validates :customer_name, :customer_email, :customer_address, :customer_phone, presence: true
  validates_format_of :customer_email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
end
