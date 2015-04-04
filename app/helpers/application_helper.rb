module ApplicationHelper
  
  LOCALE_LIST = { en: "English", ru: "Русский" }
  
  def current_locale_name
    LOCALE_LIST[I18n.locale]
  end
  
  def locale_list
    LOCALE_LIST
  end
  
  def default_grid_system
    "sm"
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
end
