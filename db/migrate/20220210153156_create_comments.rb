class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :story_id, null: false
      t.text :body, null: false
      t.float :rate, null: false

      t.timestamps
    end
  end
end
