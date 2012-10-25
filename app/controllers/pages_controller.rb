class PagesController < HighVoltage::PagesController
  def show
    @page = StaticPage.find_by_permalink(params[:id])
    @active_page = @page.permalink
    redirect_to root_path unless @page.present?
  end
end
