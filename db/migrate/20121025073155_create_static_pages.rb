class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.string :name, :permalink, null: false
      t.text :keywords, :description, :title, null: false, default: ''
      t.text :text
      t.timestamps
    end
  end
end
