require 'spec_helper'

describe "Main pages" do

  describe "Root page" do
    
    it "should have the link 'Частным клиентам'" do
      visit root_path
      expect(page).to have_link('Частным клиентам', href: "#")
    end
    
    it "should have the link 'Для бизнеса'" do
      visit root_path
      expect(page).to have_link('Для бизнеса', href: main_pages_companies_path)
    end
    
    it "should have the link 'Банкам'" do
      visit root_path
      expect(page).to have_link('Банкам', href: main_pages_banks_path)
    end
    
    it "should have the link 'Регистрация'" do
      visit root_path
      expect(page).to have_link('Регистрация', href: sign_up_path)
    end
    
    it "should have the link 'Войти'" do
      visit root_path
      expect(page).to have_link('Войти', href: log_in_path)
    end
  end
  
  describe "Companies page" do
    
    it "should have the link 'Частным клиентам'" do
      visit main_pages_companies_path
      expect(page).to have_link('Частным клиентам', href: root_path)
    end
    
    it "should have the link 'Для бизнеса'" do
      visit main_pages_companies_path
      expect(page).to have_link('Для бизнеса', href: "#")
    end
    
    it "should have the link 'Банкам'" do
      visit main_pages_companies_path
      expect(page).to have_link('Банкам', href: main_pages_banks_path)
    end
    
    it "should have the link 'Регистрация'" do
      visit main_pages_companies_path
      expect(page).to have_link('Регистрация', href: sign_up_path)
    end
    
    it "should have the link 'Войти'" do
      visit main_pages_companies_path
      expect(page).to have_link('Войти', href: log_in_path)
    end
  end

  describe "Banks page" do
    
    it "should have the link 'Частным клиентам'" do
      visit main_pages_companies_path
      expect(page).to have_link('Частным клиентам', href: root_path)
    end
    
    it "should have the link 'Для бизнеса'" do
      visit main_pages_companies_path
      expect(page).to have_link('Для бизнеса', href: main_pages_companies_path)
    end
    
    it "should have the link 'Банкам'" do
      visit main_pages_companies_path
      expect(page).to have_link('Банкам', href: "#")
    end
    
    it "should have the link 'Регистрация'" do
      visit main_pages_companies_path
      expect(page).to have_link('Регистрация', href: sign_up_path)
    end
    
    it "should have the link 'Войти'" do
      visit main_pages_companies_path
      expect(page).to have_link('Войти', href: log_in_path)
    end
  end
end