module ApplicationHelper
  
  def page_title 
    @page_title or t("default_page_title")
  end

end
