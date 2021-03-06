# -*- coding: utf-8 -*-
class Notifier < ActionMailer::Base
  default from: "info@belvelikan.ru"

  def customer_order_notify(order)
    @order = order
    mail(to: @order.info.customer_email,
         subject: "Заказ ##{@order.id}")
  end

  def admin_order_notify(order)
    @order = order
    mail(to: "svetlana@belvelikan.ru",
         subject: "Новый заказ ##{@order.id}")
  end

  def new_customer_request(user)
    @user = user
    mail(to: "svetlana@belvelikan.ru",
         subject: "Появился новый пользователь #{@user.email}")
  end
end
