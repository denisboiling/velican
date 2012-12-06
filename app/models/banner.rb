class Banner < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "799x234>", thumb: "125x125" },
                            path: ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
                            url: "/system/:class/:attachment/:id/:style/:filename",
                            default_style: :thumb

  attr_accessible :text, :image
end
