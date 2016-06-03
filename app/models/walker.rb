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

class Walker < ActiveRecord::Base
  has_secure_password
  has_many :comments

  # geocoded_by :address
  # after_validation :geocode, :if => :address_changed?
end
