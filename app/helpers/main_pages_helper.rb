module MainPagesHelper
  
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "About bank"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  def header_main_links(name)
    if current_page?(controller: "main_pages", action: name)
      content_tag(:li, class: "active") { link_to(I18n.t("main_pages.#{name}"), "#") }
    else
      content_tag(:li) { link_to(I18n.t("main_pages.#{name}"), { controller: "main_pages", action: name }) }
    end
  end
end
