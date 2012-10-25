class MainsController < ApplicationController
  def index
    @page = StaticPage.find_by_permalink('main')
    @active_page = @page.permalink
  end

  def show
  end
end
