class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, limit:30
      t.string :password_hash
      t.string :email
      t.integer :repetition, default: 0
      t.string :status

      t.timestamps
    end
  end
end
