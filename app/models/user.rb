# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  creator               :boolean
#  email                 :string
#  first_name            :string
#  follow_requests_count :integer
#  given_donations_count :integer
#  last_name             :string
#  password_digest       :string
#  profile_image         :string
#  subscribers_count     :integer
#  subscriptions_count   :integer
#  user_contents_count   :integer
#  username              :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
