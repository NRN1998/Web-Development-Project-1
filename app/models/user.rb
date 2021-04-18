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

  has_many(:follow_requests, { :class_name => "FollowRequest", :foreign_key => "sender_id", :dependent => :destroy })

  has_many(:user_contents, { :class_name => "UserContent", :foreign_key => "owner_id", :dependent => :destroy })

  has_many(:likes, { :class_name => "Like", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:comments, { :class_name => "Comment", :foreign_key => "commenter_id", :dependent => :destroy })

  has_many(:subscriptions, { :class_name => "Subscription", :foreign_key => "subscriber_id", :dependent => :destroy })

  has_many(:subscribers, { :class_name => "Subscription", :foreign_key => "creator_id", :dependent => :destroy })

  has_many(:donations, { :class_name => "Donation", :foreign_key => "donator_id", :dependent => :destroy })

  has_many(:given_donations, { :class_name => "Donation", :foreign_key => "creator_id", :dependent => :destroy })

end
