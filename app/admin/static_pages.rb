# -*- coding: utf-8 -*-
ActiveAdmin.register StaticPage do
  menu label: 'Страницы'

  filter :permalink
  filter :name

  index do
    column :name
    column :permalink
    default_actions
  end

  form do |f|
    f.inputs "Основное" do
      f.input :name
      f.input :permalink
      f.input :text, as: :html_editor
    end

    f.inputs "SEO штучки" do
      f.input :title
      f.input :keywords
      f.input :description
    end
    f.buttons
  end
end
