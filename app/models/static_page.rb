class StaticPage < ActiveRecord::Base
  attr_accessible :name, :permalink, :keywords, :description, :title, :text

  validates :name, :permalink, presence: true
  validates :permalink, uniqueness: true
end
