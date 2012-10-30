class Category < ActiveRecord::Base
  has_many :products

  attr_accessible :title

  # scope :available, joins(:pro)

  # class << self
  #   def availables
  #     self.all.map {|c| c if c.products.present?}
  #   end
  # end
end
