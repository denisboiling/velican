class Category < ActiveRecord::Base
  has_many :products

  attr_accessible :title, :text, :html_title, :html_keywords, :html_description

  validates :title, presence: :true

  def seo_stuff
    return_hs = {}
    %w(html_title html_description html_keywords).each do |f|
      return_hs.merge!(f.to_sym => self.send(f))
    end
    return_hs
  end
end
