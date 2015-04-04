class User < ActiveRecord::Base
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  VALID_NAME_REGEX = /\A[[:alpha:] -]*\z/i
  
  before_save { email.downcase! }
  before_save :set_name
  before_create :create_remember_token
  
  has_secure_password
  
  validates :first_name, presence: true, length: { maximum: 50 }, format: { with: VALID_NAME_REGEX }
  validates :last_name, presence: true, length: { maximum: 50 }, format: { with: VALID_NAME_REGEX }
  validates :email, presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
  
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