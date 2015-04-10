require 'spec_helper'

RSpec.describe "user pages", :type => :features do

  subject { page }

  context "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content("#{user.first_name} #{user.last_name}") }
    it { should have_title(full_title("#{user.first_name} #{user.last_name}")) }
  end

  context "signup page" do
    before { visit signup_path }
    
    let(:submit) { "Зарегистрироваться" }

    it { should have_content('Регистрация') }
    it { should have_title(full_title('Регистрация')) }
    
    context "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      context "after submission" do
        before { click_button submit }

        it { should have_title('Регистрация') }
        it { should have_css('div.field_with_errors') }
        it { should have_css('li.text-danger') }
      end
    end
    
    context "with valid information" do
      before do
        fill_in "user_first_name",            with: "Ivan"
        fill_in "user_last_name",             with: "Ivanov"
        fill_in "user_email",                 with: "ivan.ivanov@example.com"
        fill_in "user_password",              with: "foobar"
        fill_in "user_password_confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      
      context "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'ivan.ivanov@example.com') }

        it { should have_title(full_title("#{user.first_name} #{user.last_name}")) }
      end
      
      context "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'ivan.ivanov@example.com') }

        it { should have_link('Выйти') }
        it { should have_title(full_title("#{user.first_name} #{user.last_name}")) }
      end
    end
  end
end