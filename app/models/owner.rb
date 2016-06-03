# == Schema Information
#
# Table name: owners
#
#  id              :integer          not null, primary key
#  name            :text
#  image           :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  email           :string
#

class Owner < ActiveRecord::Base
  has_secure_password
  has_many :dogs
end
