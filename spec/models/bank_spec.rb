# == Schema Information
#
# Table name: banks
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  website    :string
#  short_name :string
#

require 'spec_helper'

RSpec.describe BankUser, type: :model do
  
  before do 
    @bank = create(:bank_with_users)
  end

  subject { @bank }
   
  it { should respond_to(:name) }
  it { should respond_to(:short_name) }
  it { should respond_to(:website) }
  
  it { should be_valid }
  
  it "should have a one user" do
    expect(@bank.users.size).to eq(1)
  end
  
  context "when name is invalid" do
    it "should be invalid" do
      name = ['a', '123', '<as?', 'a.a', 'a,a', 'a_a']
      name.each do |i|
        @bank.name = i
        expect(@bank).not_to be_valid
      end
    end
  end
  
  context "when name is valid" do
    it "should be valid" do
      name = ['MB', 'My-Bank', 'Bank', 'My Bank']
      name.each do |i|
        @bank.name = i
        expect(@bank).to be_valid
      end
    end
  end

  context "when short name is invalid" do
    it "should be invalid" do
      name = ['a', '123', '<as?', 'a.a', 'a,a', 'a_a']
      name.each do |i|
        @bank.short_name = i
        expect(@bank).not_to be_valid
      end
    end
  end
  
  context "when short name is valid" do
    it "should be valid" do
      name = ['MB', 'My-Bank', 'Bank', 'My Bank']
      name.each do |i|
        @bank.short_name = i
        expect(@bank).to be_valid
      end
    end
  end

  context "when website is invalid" do
    it "should be invalid" do
      name = ['a', '123', '<as?', 'a.a', 'a,a', 'a_a']
      name.each do |i|
        @bank.website = i
        expect(@bank).not_to be_valid
      end
    end
  end
  
  context "when website is valid" do
    it "should be valid" do
      name = ['http://www.foobar.ru/', 'My-Bank', 'Bank', 'My Bank']
      name.each do |i|
        @bank.website = i
        expect(@bank).to be_valid
      end
    end
  end
end
