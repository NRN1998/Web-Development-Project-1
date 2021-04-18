# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  body         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  commenter_id :integer
#  content_id   :integer
#
class Comment < ApplicationRecord
  belongs_to(:commenter, { :required => false, :class_name => "User", :foreign_key => "commenter_id" })

  belongs_to(:content, { :required => false, :class_name => "UserContent", :foreign_key => "content_id", :counter_cache => true })
end
