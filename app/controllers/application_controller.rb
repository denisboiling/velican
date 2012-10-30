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

  # Return refer url
  def back_url(default=root_path)
    request.referer || default
  end

  # Redirect to last page
  def redirect_back_or_default(default=root_path)
    redirect_to back_url(default)
  end
end
