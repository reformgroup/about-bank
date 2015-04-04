require 'spec_helper'

RSpec.describe "authentication pages", type: :features do
  subject { page }

  context "login page" do
    before { visit login_path }

    it { should have_content('Вход') }
    it { should have_title(full_title('Вход')) }
  end
  
  context "login" do
    
    let(:submit) { "Выйти" }
    
    before { visit login_path }

    context "with invalid information" do
      before { click_button submit }

      it { should have_title(full_title('Вход')) }
      it { should have_css('.text-danger') }
      
      describe "after visiting another page" do
        before { click_link "Частным клиентам" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end
    
    context "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "user_email",    with: user.email.upcase
        fill_in "user_password", with: user.password
        click_button submit
      end

      it { should have_title(user.name) }
      it { should have_link('Профиль',  href: user_path(user)) }
      it { should have_link('Выйти',    href: lognout_path) }
    end
  end
end
