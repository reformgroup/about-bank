require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "sign up page" do
    before { visit signup_path }

    it { should have_content('Регистрация') }
    it { should have_title(full_title('Регистрация')) }
  end
end