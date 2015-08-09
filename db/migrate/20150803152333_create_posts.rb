class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :vote, default: 0
      t.integer :view, default: 0
      t.integer :location_id
      t.integer :user_id

      t.timestamps
    end
  end
end
