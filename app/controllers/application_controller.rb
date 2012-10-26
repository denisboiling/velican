class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :assign_user

  def random_sequence(count=24)
    o = [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
    (count.times).map{ o[rand(o.length)] }.join
  end

  def assign_user
    return if cookies[:user_key].present?
    cookies[:user_key] = random_sequence
  end
end
