class User < ApplicationRecord

  validates :name,  presence: true, length: { minimum: 4, maximum: 30 }, uniqueness: { case_sensitive: false }
  
  validates :email, presence: true, length: { maximum: 100 }, uniqueness: true, 
	           format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    
  has_secure_password
  
  validates :password, confirmation: true, length: { minimum: 4, maximum: 30 }
  validates :password_confirmation, presence: true


  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

end
