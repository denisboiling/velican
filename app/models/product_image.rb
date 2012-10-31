class ProductImage < ActiveRecord::Base
  belongs_to :product

  has_attached_file :image, styles: { thumb: "200x200>",  slider: "215x257!" },
                           path: ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
                           url: "/system/:class/:attachment/:id/:style/:filename",
                           default_style: :thumb, default_url: 'loading.gif'

  attr_accessible :image, :product_id

  validates :image, :product_id, presence: true
end
