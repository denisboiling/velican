# -*- coding: utf-8 -*-
ActiveAdmin.register Category do
  menu label: 'Категории продуктов'

  config.clear_sidebar_sections!

  index do
    id_column
    column :title
    column "Количество продуктов с данной категории" do |category|
      category.products.count
    end
    default_actions
  end
end
