# == Schema Information
#
# Table name: user_contents
#
#  id             :integer          not null, primary key
#  caption        :string
#  comments_count :integer
#  likes_count    :integer
#  photos         :string
#  videos         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#
class UserContent < ApplicationRecord
  validates(:owner_id, { :presence => true })
  
  belongs_to(:creator, { :required => false, :class_name => "User", :foreign_key => "owner_id", :counter_cache => true })

  has_many(:likes, { :class_name => "Like", :foreign_key => "content_id", :dependent => :destroy })

  has_many(:comments, { :class_name => "Comment", :foreign_key => "content_id", :dependent => :destroy })
end
