class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.string :entry
      t.integer :user_id
      t.integer :topic_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
