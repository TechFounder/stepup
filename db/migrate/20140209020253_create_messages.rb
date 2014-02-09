class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.text :message
      t.references :user, index: true

      t.timestamps
    end
  end
end