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
    @bank = create(:bank_with_users, users_count: 5)
  end

  subject { @bank }
   
  it { should respond_to(:name) }
  it { should respond_to(:short_name) }
  it { should respond_to(:website) }
  
  it "should has one user" do
    expect(@bank.users.first.email).to eq(1)
  end
  
  it { should be_valid }
end
