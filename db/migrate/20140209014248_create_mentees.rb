class CreateMentees < ActiveRecord::Migration
  def change
    create_table :mentees do |t|
      t.string :school_name
      t.string :grade
      t.string :career_interests
      t.string :bio
      t.string :events_attended
      t.string :extracurriculars
      t.integer :user_id
      t.attachment :image
      t.references :user, index: true

      t.timestamps
    end
  end
end
