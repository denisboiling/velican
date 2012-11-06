class CreateOrderInfos < ActiveRecord::Migration
  def change
    create_table :order_infos do |t|
      t.integer :order_id, null: false
      t.string :customer_name, :customer_email, :customer_address, :customer_phone
      t.text :comment
      t.timestamps
    end
  end
end
