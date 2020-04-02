class AddChefToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :chef, :string
  end
end
