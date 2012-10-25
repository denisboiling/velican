class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, :size_range, null: false
      t.decimal :price, :precision => 6, :scale => 4, null: false
      t.integer :label_id
      t.integer :category_id, null: false
      t.attachment :logo
      t.timestamps
    end
  end
end
