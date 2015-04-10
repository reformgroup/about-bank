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
#

class User < ActiveRecord::Base
  
  attr_accessor :remember_token
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  VALID_NAME_REGEX = /\A[[:alpha:] -]*\z/i
  
  has_many :bank_users
  has_many :banks, through: :bank_users
  
  before_save { email.downcase! }
  before_save :set_name
  
  has_secure_password
  
  validates :first_name, presence: true, length: { maximum: 50 }, format: { with: VALID_NAME_REGEX }
  validates :last_name, presence: true, length: { maximum: 50 }, format: { with: VALID_NAME_REGEX }
  validates :email, presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  class << self
    
    # Returns the hash digest of the given string.
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token.
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  private
  
  def set_name
    self.first_name = normalize_name(self.first_name)
    self.last_name = normalize_name(self.last_name)
  end

  def normalize_name(name)
    name.gsub!(/^[ -]*|[ -]*$/, "")
    name.gsub!(/[ ]*[-]{2,}[ ]*/, "-")
    name.gsub!(/[ ]{2,}/, " ")
    name.gsub!(/[[:alpha:]]+/i) { |s| s.capitalize }
  end
end 
