class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.integer :community_id

      t.timestamps
    end
  end
end