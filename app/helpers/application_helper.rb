module ApplicationHelper

  def active_page(page)
    @active_page ? ('active' if @active_page == page) : ''
  end

  def active_label(label)
    params[:label].present? ? ('active' if params[:label] == label.title) : ''
  end
end
