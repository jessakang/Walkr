# == Schema Information
#
# Table name: dogs
#
#  id         :integer          not null, primary key
#  name       :text
#  breed      :text
#  weight     :text
#  suburb     :text
#  concerns   :text
#  image      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#

class Dog < ActiveRecord::Base
  belongs_to :owner
end
