Label.all.each do |label|
  label.update_attributes(html_title: Faker::Lorem.words.join(' '),
                          html_description: Faker::Lorem.words(10).join(' '),
                          html_keywords: Faker::Lorem.words(10).join(' ')
               )
end
