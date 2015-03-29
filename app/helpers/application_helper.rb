module ApplicationHelper
  
  LOCALE_LIST = { ru: "Русский", en: "English" }
  
  def current_locale_name
    LOCALE_LIST[I18n.locale]
  end
  
  def locale_list
    LOCALE_LIST
  end
end
