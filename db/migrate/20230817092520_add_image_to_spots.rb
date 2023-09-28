class AddImageToSpots < ActiveRecord::Migration[7.0]
  def change
    add_column :spots, :image, :string
  end
end
