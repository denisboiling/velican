class AddTextToLabels < ActiveRecord::Migration
  def change
    add_column :labels, :text, :text
  end
end
