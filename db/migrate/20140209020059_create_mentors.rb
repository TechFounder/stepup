class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
      t.string :company_name
      t.string :job_title
      t.string :sector
      t.string :college
      t.string :skill_set
      t.text :additional_info
      t.boolean :internship_available
      t.string :internship_job_title
      t.text :internship_skill_set
      t.text :internship_additional_info
      t.integer :user_id
      t.attchement :image
      t.references :user, index: true

      t.timestamps
    end
  end
end
