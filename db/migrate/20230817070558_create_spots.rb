class CreateSpots < ActiveRecord::Migration[7.0]
  def change
    create_table :spots do |t|
      t.string :adress
      t.string :time
      t.string :access
      t.string :parking
      t.text :about

      t.timestamps
    end
  end
end
