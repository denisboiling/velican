class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confiramble
      t.string :confirmation_token
      t.string :unconfirmed_email
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at

      ## My own
      t.string :name, :phone, :address
      t.text :comment
      t.boolean :available, null: false, default: false

      t.timestamps
    end

    add_index :users, :email,               :unique => true
    add_index :users, :confirmation_token,  :unique => true
  end
end
