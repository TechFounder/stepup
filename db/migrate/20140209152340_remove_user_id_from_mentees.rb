class RemoveUserIdFromMentees < ActiveRecord::Migration
  def change
  	remove_column :mentees, :user_id
  end
end
