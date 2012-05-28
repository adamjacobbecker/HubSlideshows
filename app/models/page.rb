# == Schema Information
#
# Table name: pages
#
#  id         :integer         not null, primary key
#  page_type  :string(255)
#  content    :text
#  project_id :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Page < ActiveRecord::Base
  attr_accessible :page_type, :content
  
  serialize :content
  
  belongs_to :project
  
  validates :page_type, presence: true
  validates :content, presence: true
  validates :project_id, presence: true
end
