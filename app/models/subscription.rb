# == Schema Information
#
# Table name: subscriptions
#
#  id            :integer          not null, primary key
#  active        :boolean
#  amount        :integer
#  duration      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  creator_id    :integer
#  subscriber_id :integer
#
class Subscription < ApplicationRecord
  belongs_to(:subscriber, { :required => false, :class_name => "User", :foreign_key => "subscriber_id", :counter_cache => true })

  belongs_to(:creator, { :required => false, :class_name => "User", :foreign_key => "creator_id", :counter_cache => :subscribers_count })

  validates(:active, { :presence => true })
end
