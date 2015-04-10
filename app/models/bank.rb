# == Schema Information
#
# Table name: banks
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Bank < ActiveRecord::Base
  
  has_many :bank_users
  has_many :users, through: :bank_users
  accepts_nested_attributes_for :bank_users
  
  validates :name, presence: true
  validates_associated :users
end
