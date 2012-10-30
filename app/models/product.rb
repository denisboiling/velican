class Product < ActiveRecord::Base
  belongs_to :label
  belongs_to :category

  has_many :images, dependent: :destroy, class_name: 'ProductImage'
  has_many :line_items

  has_attached_file :logo, styles: { thumb: '79x79', big: '310x368!', medium: '215x257' },
                            path: ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
                            url: "/system/:class/:attachment/:id/:style/:filename",
                            default_style: :thumb, default_url: 'loading.gif'


  attr_accessible :title, :price, :label, :logo, :size_range, :label_id, :category_id, :images

  validates :title, :price, :logo, :category, :size_range, presence: true

  scope :without_label, where(label_id: nil)
  scope :by_label, lambda{|label| where(label_id: label.id)}
  scope :by_category, lambda{|category| where(category_id: category.id)}
end
