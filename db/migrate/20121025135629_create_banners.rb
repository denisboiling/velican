class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.text :text
      t.attachment :image
      t.timestamps
    end
  end
end
