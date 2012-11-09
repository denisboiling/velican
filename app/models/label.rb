class Label < ActiveRecord::Base
  has_many :products

  attr_accessible :title, :html_title, :html_keywords, :html_description

  def seo_stuff
    return_hs = {}
    %w(html_title html_description html_keywords).each do |f|
      return_hs.merge!(f.to_sym => self.send(f))
    end
    return_hs
  end
end
