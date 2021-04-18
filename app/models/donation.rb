# == Schema Information
#
# Table name: donations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  creator_id :integer
#  donator_id :integer
#
class Donation < ApplicationRecord
  belongs_to(:donator, { :required => false, :class_name => "User", :foreign_key => "donator_id" })

  belongs_to(:creator, { :required => false, :class_name => "User", :foreign_key => "creator_id", :counter_cache => :given_donations_count })
end
