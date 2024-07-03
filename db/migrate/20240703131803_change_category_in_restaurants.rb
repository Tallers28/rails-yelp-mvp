class ChangeCategoryInRestaurants < ActiveRecord::Migration[7.1]
  def change
    change_column :restaurants, :category, :string
  end
end
