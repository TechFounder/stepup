# == Schema Information
#
# Table name: mentors
#
#  id                         :integer          not null, primary key
#  company_name               :string(255)
#  job_title                  :string(255)
#  sector                     :string(255)
#  college                    :string(255)
#  skill_set                  :string(255)
#  additional_info            :text
#  internship_available       :boolean
#  internship_job_title       :string(255)
#  internship_skill_set       :text
#  internship_additional_info :text
#  user_id                    :integer
#  image_file_name            :string(255)
#  image_content_type         :string(255)
#  image_file_size            :integer
#  image_updated_at           :datetime
#  created_at                 :datetime
#  updated_at                 :datetime
#

class Mentor < ActiveRecord::Base
	has_one :user, as: :profile, dependent: :destroy

  has_attached_file :image, styles: { medium: "320x240>", thumb: "133x100>"}
  validates_attachment :image,
            content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
            size: { less_than: 5.megabytes }
	validates :company_name, presence: true

end
