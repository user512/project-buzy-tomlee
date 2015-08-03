class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      # t.array :coordinates
      t.integer :city_id

      t.timestamps
    end
  end
end
