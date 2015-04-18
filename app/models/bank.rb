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

class Bank < ActiveRecord::Base
  
  VALID_WEBSITE_REGEX = /\A[a-z0-9][a-z0-9-]*[a-z0-9]\.[a-z]+\z/i
  
  has_many :bank_users
  has_many :users, through: :bank_users
  accepts_nested_attributes_for :bank_users
  
  before_save { website.downcase! }
  
  validates :name, presence: true
  validates :website, presence: true, length: { maximum: 50 }, format: { with: VALID_WEBSITE_REGEX }
  validates_associated :users
end
