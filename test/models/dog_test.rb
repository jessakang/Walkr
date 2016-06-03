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

require 'test_helper'

class DogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
