class AddImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image_file_name, :string
  end
end
