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
  
  VALID_NAME_REGEX = /\A[[:alpha:]]+[[:alpha:] -]*[[:alpha:]]+\z/i
  VALID_WEBSITE_REGEX = /\A[[:alpha:]0-9][[:alpha:]0-9-]*[[:alpha:]0-9]\.[[:alpha:]]+\z/i
  
  has_many :bank_users
  has_many :users, through: :bank_users
  accepts_nested_attributes_for :bank_users
  
  before_save { website.downcase! }
  
  validates :name, presence: true, length: { maximum: 50 }, format: { with: VALID_NAME_REGEX }
  validates :short_name, presence: true, length: { maximum: 50 }, format: { with: VALID_NAME_REGEX }
  validates :website, presence: true, length: { maximum: 50 }, format: { with: VALID_WEBSITE_REGEX }
  validates_associated :users
end
