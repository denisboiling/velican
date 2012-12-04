# -*- coding: utf-8 -*-
ActiveAdmin.register User do
  menu label: 'Пользователи'

  actions :index, :destroy, :edit, :update

  filter :email
  filter :name

  scope :all, default: true
  scope :availables
  scope :unavailables

  index do
    id_column
    column :email
    column :name
    column :phone
    column :available do |user|
      user.available ? 'Одобрен' : 'Не одобрен'
    end
    column 'Подтвердил email' do |user|
      user.available ? (user.confirmed? ? 'Да' : 'Нет') : ''
    end
    default_actions
  end

  form do |f|
    f.inputs do
      if f.object.confirmed?
        f.input :email
      else
        f.input :unconfirmed_email
      end
      f.input :name
      f.input :phone
      f.input :address
      f.input :comment
      f.input :available, as: :select,
                          collection: [['Одобрена', true],['Еще нет', false]],
                          include_blank: false,
                          input_html: { disabled: f.object.confirmed? ? true : false }
    end
    f.actions
  end
end
