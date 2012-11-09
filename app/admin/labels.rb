# -*- coding: utf-8 -*-
ActiveAdmin.register Label do
  menu label: 'Лайблы продуктов'

  config.clear_sidebar_sections!
  actions :index, :edit, :update, :show

  controller do
    def update
      update! do |format|
        format.html { redirect_to admin_labels_path }
      end
    end
  end

  index do
    id_column
    column :title
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :title, input_html: { readonly: true }
      f.input :text, as: :html_editor
    end

    f.inputs "SEO штучки" do
      f.input :html_title
      f.input :html_keywords
      f.input :html_description
    end

    f.buttons
  end
end
