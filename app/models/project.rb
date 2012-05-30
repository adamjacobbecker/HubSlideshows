# == Schema Information
#
# Table name: projects
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  key        :string(255)
#  hub_id     :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  logo       :string(255)
#  misc_image :string(255)
#

class Project < ActiveRecord::Base
  attr_accessible :name, :email, :logo, :misc_image, :hub_id
  
  belongs_to :hub
  has_many :pages, dependent: :destroy
  
  before_save :create_key
  
  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :hub_id, presence: true
  
  default_scope order: 'name asc'
  
  
  private
    def create_key
      self.key = SecureRandom.urlsafe_base64(6) unless self.key
    end
end
