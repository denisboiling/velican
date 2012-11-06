class Category < ActiveRecord::Base
  has_many :products

  attr_accessible :title, :text

  validates :title, presence: :true
end
