FileUtils.rm_rf Rails.root.join('public/system/banner')
images = Dir.glob(Rails.root.join('db/sample/files/banners', '*'))

Banner.all.each do |banner|
  banner.update_attribute(:image, File.new(images.sample))
end
