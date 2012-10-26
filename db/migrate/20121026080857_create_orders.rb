class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :state
      t.string :user_key, null: false
      t.decimal :full_price, :precision => 6, :scale => 4, null: false, default: 0.00
      t.timestamps
    end
  end
end
