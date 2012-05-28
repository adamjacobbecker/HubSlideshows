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

require 'spec_helper'

describe Page do
  pending "add some examples to (or delete) #{__FILE__}"
end
