# -*- coding: utf-8 -*-
ActiveAdmin.register Product do
  menu label: 'Товар'

  config.clear_sidebar_sections!

  actions :index, :edit, :update, :new, :create, :destroy

  form partial: 'form'

  controller do
    def destroy_image
      ProductImage.find(params[:id]).destroy
      render text: 'ok'
    end

    def add_image
      product = Product.find(params[:id])
      @images = []
      params[:images].each do |image|
        @images << product.images.create(image: image)
      end
      render :layout => false
    end

    def create
      create! { redirect_to(edit_admin_product_path(resource)) and return }
    end

    def update
      update! { redirect_to(edit_admin_product_path(resource)) and return }
    end

  end

  index do
    column :logo do |product|
      link_to(image_tag(product.logo), admin_product_path(product))
    end
    column :title
    column :label
    column :category
    column :price
    column "Количество фотографий" do |product|
      product.images.count
    end
    default_actions
  end
end
