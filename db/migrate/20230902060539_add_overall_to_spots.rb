class AddOverallToSpots < ActiveRecord::Migration[7.0]
  def change
    add_column :spots, :overall, :integer
  end
end
