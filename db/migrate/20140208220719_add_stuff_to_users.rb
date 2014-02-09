class AddStuffToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :mentor_company_name, :string
  	add_column :users, :mentor_job_title, :string
  	add_column :users, :mentor_sector, :string
  	add_column :users, :mentor_college, :string
  	add_column :users, :mentor_skill_set, :text
  	add_column :users, :mentor_additional_info, :text
  	add_column :users, :mentor_internship_available, :boolean
  	add_column :users, :mentor_internship_job_title, :string
  	add_column :users, :mentor_internship_skill_set, :text
  	add_column :users, :mentor_internship_additional_info, :text
  	add_column :users, :mentee_school_name, :text
  	add_column :users, :mentee_grade, :integer
  	add_column :users, :mentee_career_interests, :text
  	add_column :users, :mentee_bio, :text
  	add_column :users, :mentee_events_attended, :text
  	add_column :users, :mentee_extracurriculars, :text
  	add_column :users, :is_mentor, :boolean, default: false
  end
end
