class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :product_id, :order_id, :count, null: false
      t.decimal :price, :precision => 6, :scale => 4, null: false, default: 0.00
      t.timestamps
    end
  end
end
