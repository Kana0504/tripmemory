class AddCategoryToSpots < ActiveRecord::Migration[7.0]
  def change
    add_column :spots, :category, :string
  end
end
