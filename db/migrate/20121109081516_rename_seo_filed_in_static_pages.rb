class RenameSeoFiledInStaticPages < ActiveRecord::Migration
  def up
    rename_column :static_pages, :title, :html_title
    rename_column :static_pages, :keywords, :html_keywords
    rename_column :static_pages, :description, :html_description
  end
end
