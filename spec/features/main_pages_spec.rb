require 'spec_helper'

RSpec.describe "main pages", :type => :features do
  
  subject { page }
  
  context "root page" do
    
    before { visit root_path }
    
    it "should have the link 'Частным клиентам'" do
      expect(page).to have_link('Частным клиентам', href: '#')
    end
    
    it "should have the link 'Для бизнеса'" do
      expect(page).to have_link('Для бизнеса', href: companies_path(locale: I18n.locale))
    end
    
    it "should have the link 'Банкам'" do
      expect(page).to have_link('Банкам', href: banks_path(locale: I18n.locale))
    end
    
    it "should have the link 'Регистрация'" do
      expect(page).to have_link('Регистрация', href: signup_path(locale: I18n.locale))
    end
    
    it "should have the link 'Войти'" do
      expect(page).to have_link('Войти', href: login_path(locale: I18n.locale))
    end
  end
  
  context "companies page" do
    
    before { visit companies_path }
    
    it "should have the link 'Частным клиентам'" do
      expect(page).to have_link('Частным клиентам', href: root_path(locale: I18n.locale))
    end
    
    it "should have the link 'Для бизнеса'" do
      expect(page).to have_link('Для бизнеса', href: "#")
    end
    
    it "should have the link 'Банкам'" do
      expect(page).to have_link('Банкам', href: banks_path(locale: I18n.locale))
    end
    
    it "should have the link 'Регистрация'" do
      expect(page).to have_link('Регистрация', href: signup_path(locale: I18n.locale))
    end
    
    it "should have the link 'Войти'" do
      expect(page).to have_link('Войти', href: login_path(locale: I18n.locale))
    end
  end

  context "banks page" do
    
    before { visit banks_path }
    
    it "should have the link 'Частным клиентам'" do
      expect(page).to have_link('Частным клиентам', href: root_path(locale: I18n.locale))
    end
    
    it "should have the link 'Для бизнеса'" do
      expect(page).to have_link('Для бизнеса', href: companies_path(locale: I18n.locale))
    end
    
    it "should have the link 'Банкам'" do
      expect(page).to have_link('Банкам', href: "#")
    end
    
    it "should have the link 'Регистрация'" do
      expect(page).to have_link('Регистрация', href: signup_path(locale: I18n.locale))
    end
    
    it "should have the link 'Войти'" do
      expect(page).to have_link('Войти', href: login_path(locale: I18n.locale))
    end
  end
end