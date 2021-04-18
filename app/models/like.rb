# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  content_id :integer
#  user_id    :integer
#
class Like < ApplicationRecord
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:content, { :required => false, :class_name => "UserContent", :foreign_key => "content_id", :counter_cache => true })

  validates(:user_id, { :presence => true })

  validates(:content_id, { :presence => true })
end
