# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  remember_digest :string
#  gender          :string
#  birth_date      :date
#

require 'spec_helper'

RSpec.describe User, :type => :model do

  before { @user = User.new(first_name: "Ivan", last_name: "Ivanov", email: "ivan.ivanov@example.com",
                     password: "foobar", password_confirmation: "foobar") }

  subject { @user }
  
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_digest) }
  it { should respond_to(:authenticate) }
  
  it { should be_valid }

  context "when first name format is invalid" do
    it "should be invalid" do
      name = %w[foo123 ,foo foo,bar]
      name.each do |invalid_name|
        @user.first_name = invalid_name
        expect(@user).not_to be_valid
      end
    end
  end
  
  context "when first name format is valid" do
    it "should be valid" do
      name = %w[Foo fOO foo Foo-Bar]
      name.each do |valid_name|
        @user.first_name = valid_name
        expect(@user).to be_valid
      end
    end
  end
  
  context "email address with mixed case" do
    let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

    it "should be saved as all lower-case" do
      @user.email = mixed_case_email
      @user.save
      expect(@user.reload.email).to eq mixed_case_email.downcase
    end
  end
  
  context "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  context "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end
  
  context "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  context "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end
  
  context "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  context "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  context "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    context "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    context "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be false }
    end
  end
  
  before { @user.save }
  it "remember digest" do
    subject.remember_digest.should_not be_blank
  end
end
