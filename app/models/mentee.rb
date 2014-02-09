# == Schema Information
#
# Table name: mentees
#
#  id                 :integer          not null, primary key
#  school_name        :string(255)
#  grade              :string(255)
#  career_interests   :string(255)
#  bio                :string(255)
#  events_attended    :string(255)
#  extracurriculars   :string(255)
#  user_id            :integer
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  created_at         :datetime
#  updated_at         :datetime
#

class Mentee < ActiveRecord::Base
  belongs_to :user
end
