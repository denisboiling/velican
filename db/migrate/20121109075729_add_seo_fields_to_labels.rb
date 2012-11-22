class AddSeoFieldsToLabels < ActiveRecord::Migration
  def change
    change_table :labels do |t|
      t.text :html_keywords, :html_description, :html_title, null: false, default: ''
    end
  end
end
