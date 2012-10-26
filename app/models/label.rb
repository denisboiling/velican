class Label < ActiveRecord::Base
  has_many :products

  attr_accessible :title
end
