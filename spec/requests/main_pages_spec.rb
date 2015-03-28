require 'spec_helper'

describe "Main pages" do

  describe "Home page" do
    
    it "should have the link 'Войти'" do
      visit '/main_pages/home'
      expect(page).to have_link('Войти', href: sign_in_path)
    end
    
    it "should have the link 'Зарегистрироваться'" do
      visit '/main_pages/home'
      expect(page).to have_link('Зарегистрироваться', href: sign_up_path)
    end
  end
end