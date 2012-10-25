module ApplicationHelper

  def active_page(page)
    @active_page ? (@active_page == page ? 'active' : 'noactive') : 'noactive'
  end
end
