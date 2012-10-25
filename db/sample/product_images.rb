FileUtils.rm_rf Rails.root.join('public/system/product_image')

images = Dir.glob(Rails.root.join('db/sample/files/dress', '*'))

ProductImage.all.each do |product_image|
  product_image.update_attribute(:image, File.new(images.sample))
end
