FileUtils.rm_rf Rails.root.join('public/system/product')

images = Dir.glob(Rails.root.join('db/sample/files/dress', '*'))

Product.all.each do |product|
  product.update_attribute(:logo, File.new(images.sample))
end
