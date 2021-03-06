# == Schema Information
#
# Table name: hubs
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  remember_token  :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class Hub < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
  
  has_many :projects, dependent: :destroy
  
  before_save { |hub| hub.email = email.downcase }
  before_save :create_remember_token
    
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  default_scope order: 'hubs.name'
  
  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
