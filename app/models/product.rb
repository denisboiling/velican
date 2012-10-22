class Product < ActiveRecord::Base
  belongs_to :label
  belongs_to :category

  attr_accessible :title, :price, :label
end
