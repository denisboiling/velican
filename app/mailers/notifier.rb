# -*- coding: utf-8 -*-
class Notifier < ActionMailer::Base
  default from: "info@belvelican.ru"

  def customer_order_notify(order)
    @order = order
    mail(to: @order.info.customer_email,
         subject: "Заказ ##{@order.id}")
  end

  def admin_order_notify(order)
    @order = order
    mail(to: "admin@example.com",
         subject: "Новый заказ ##{@order.id}")
  end
end
