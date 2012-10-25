# -*- coding: utf-8 -*-
ActiveAdmin.register Banner do
  menu label: 'Банеры'

  config.clear_sidebar_sections!

  index do
    column :image do |banner|
      link_to(image_tag(banner.image.url), admin_banner_path(banner))
    end
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :text, as: :html_editor
      f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url)
    end
    f.buttons
  end
end
