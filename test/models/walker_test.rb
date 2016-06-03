# == Schema Information
#
# Table name: walkers
#
#  id              :integer          not null, primary key
#  name            :text
#  experience      :text
#  suburbs         :text
#  car             :boolean
#  wage            :text
#  image           :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  email           :string
#

require 'test_helper'

class WalkerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
