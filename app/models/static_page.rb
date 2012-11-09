class StaticPage < ActiveRecord::Base
  attr_accessible :name, :permalink, :html_keywords, :html_description, :html_title, :text

  validates :name, :permalink, presence: true
  validates :permalink, uniqueness: true

  def seo_stuff
    return_hs = {}
    %w(html_title html_description html_keywords).each do |f|
      return_hs.merge!(f.to_sym => self.send(f))
    end
    return_hs
  end
end
