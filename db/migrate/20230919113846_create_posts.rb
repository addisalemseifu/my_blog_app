class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :user_id, index: true
      t.text :title
      t.text :text
      t.string :comments_counter
      t.string :likes_counter
      t.timestamps
    end
  end
end
