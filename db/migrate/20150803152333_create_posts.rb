class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :vote
      t.integer :view
      t.integer :location_id
      t.integer :user_id

      t.timestamps
    end
  end
end
