# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  message    :text
#  created_at :datetime
#  updated_at :datetime
#

class Message < ActiveRecord::Base
  belongs_to :user
end
