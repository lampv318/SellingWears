module StaticPagesHelper
  def full_title page_title = ""
    base_title = "SellingWears"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end
end
