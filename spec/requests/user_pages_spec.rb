require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "sign up page" do
    before { visit sign_up_path }

    it { should have_content('Регистрация') }
    it { should have_title(full_title('Регистрация')) }
  end
end