Label.all.each do |label|
  label.update_attributes(text: Faker::HTMLIpsum.fancy_string(10, true),
                          html_title: Faker::Lorem.words.join(' '),
                          html_description: Faker::Lorem.words(10).join(' '),
                          html_keywords: Faker::Lorem.words(10).join(' ')
               )
end
