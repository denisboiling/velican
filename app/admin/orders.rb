# -*- coding: utf-8 -*-
ActiveAdmin.register Order do
  menu label: 'Заказы'

  scope :all
  scope :complete, default: true
  scope :done

  config.clear_sidebar_sections!

  controller do
    def remove_line_item
      LineItem.where(order_id: params[:id], id: params[:li]).first.destroy
      render text: 'ok'
    end

    def done_order
      Order.find(params[:id]).to_done!
      redirect_to admin_orders_path
    end
  end

  index do
    id_column
    column 'Имя заказчика' do |order|
      order.info.customer_name
    end
    column 'Количества позиций' do |order|
      order.line_items.count
    end
    column 'Количество изделий' do |order|
      order.line_items.sum(:count)
    end
    column :full_price do |order|
      number_to_currency(order.full_price)
    end
    default_actions
  end

  show do
    attributes_table :id, :state, :created_at, :updated_at, :full_price

    panel 'Информация о заказчике' do
      attributes_table_for resource.info do
        row('Имя заказчика') { resource.info.customer_name }
        row('E-mail заказчика') { resource.info.customer_email }
        row('Адресс заказчика') { resource.info.customer_address }
        row('Комментарий') { resource.info.comment }
      end
    end

    panel 'Заказанные изделия' do
      table_for(resource.line_items) do
        column :id
        column 'Изображение' do |li|
          link_to image_tag(li.product.logo.url), admin_product_path(li)
        end
        column 'Цена за одно изделие' do |li|
          number_to_currency li.price
        end
        column 'Количество' do |li|
          li.count
        end
        column 'Действия' do |li|
          link_to 'Удалить позицию', remove_line_item_admin_order_path(resource, li: li),
                                     :method => :delete,
                                     :remote => true,
                                     'data-line-item-id' => li.id,
                                     :class => 'remove_link'
        end
      end
    end

    panel 'Действие' do
      link_to 'Отметить как выполенный', done_order_admin_order_path(resource), method: :put
    end

  end
end
