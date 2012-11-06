Category.all.each do |category|
  category.update_attribute(:text, Faker::HTMLIpsum.fancy_string(10, true))
end
