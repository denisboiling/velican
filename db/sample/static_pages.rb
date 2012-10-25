StaticPage.all.each do |page|
  page.update_attribute(:text, Faker::HTMLIpsum.fancy_string(10, true))
end
