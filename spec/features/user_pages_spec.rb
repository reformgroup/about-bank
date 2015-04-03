require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content("#{user.first_name} #{user.last_name}") }
    it { should have_title(full_title("#{user.first_name} #{user.last_name}")) }
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Регистрация') }
    it { should have_title(full_title('Регистрация')) }
  end
end