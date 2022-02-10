class CreateStoryTags < ActiveRecord::Migration[5.2]
  def change
    create_table :story_tags do |t|
      t.integer :story_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
  end
end
