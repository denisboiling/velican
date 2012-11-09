class PagesController < HighVoltage::PagesController
  def show
    @page = StaticPage.find_by_permalink(params[:id])
    set_seo_by_page(@page.seo_stuff)
    @active_page = @page.permalink
    redirect_to root_path unless @page.present?
  end
end
