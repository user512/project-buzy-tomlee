class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string  :body, presence: true, limit: 144
      t.integer :user_id, presence: true

      t.timestamps
    end
  end
end
