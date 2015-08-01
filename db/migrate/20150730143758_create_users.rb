class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, presence: true, limit: 64
      t.string :email, presence: true, limit: 128
      t.string :bio, limit: 144
      t.string :password_hash, presence: true
      t.string :photo_url

      t.timestamps null: false
    end
  end
end
