# -*- coding: utf-8 -*-
ActiveAdmin.register Product do
  menu label: 'Товар'

  config.clear_sidebar_sections!

  form partial: 'form'

  index do
    column :logo do |product|
      link_to(image_tag(product.logo), admin_product_path(product))
    end
    column :title
    column :label
    column :category
    column :price
    default_actions
  end
end
