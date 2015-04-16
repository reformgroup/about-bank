module ApplicationHelper
  
  LOCALE_LIST = { en: "English", ru: "Русский" }
  
  def current_locale_name
    LOCALE_LIST[I18n.locale]
  end
  
  def locale_list
    LOCALE_LIST
  end
  
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "About bank"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  def default_grid_system
    "md"
  end

  def default_col_class
    "col-#{default_grid_system}-12"
  end
  
  def default_left_col_class
    "col-#{default_grid_system}-3"
  end

  def default_right_col_class
    "col-#{default_grid_system}-9"
  end
  
  def default_right_col_offset_class
    "col-#{default_grid_system}-offset-3"
  end

  def error_messages(object, method = nil)
    if method
      each_error object.errors[method]
    else
      each_error object.errors.full_messages
    end
  end
  
  def each_error(error_arr)
    
    if error_arr.any?
      error_content = String.new
      content_tag(:ui) do
        error_arr.each { |msg| error_content << content_tag(:li, msg, class: "text-danger") }
      end
      error_content.html_safe
    end
  end
  
  def nav_link(link_text, link_path)
    classes[:class] = 'active' if current_page?(link_path)

    content_tag(:li, classes) do
      link_to link_text, link_path
    end
  end
  
  def nav_link(link_text, link_path)
    classes = {}
    if current_page?(link_path)
      classes[:class] = 'active'
      link_path = "#"
    end
    content_tag(:li, classes) do
      link_to link_text, link_path
    end
  end
end
