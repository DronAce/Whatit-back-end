class CreateWatchLists < ActiveRecord::Migration[6.1]
  def change
    create_table :watch_lists do |t|
      t.integer :user_id
      t.integer :post_id
      t.string :name

      t.timestamps
    end
  end
end
