class CreateRegions < ActiveRecord::Migration
  def change
    create_table :region do |t|
      t.string :name

      t.timestamps
    end
  end
end
