class Project < ActiveRecord::Base
  attr_accessible :name, :email
  
  belongs_to :hub
  
  before_save :create_key
  
  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :hub_id, presence: true
  
  private
    def create_key
      self.key = SecureRandom.urlsafe_base64(6) unless self.key
    end
end
