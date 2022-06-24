class AddCityToFriends < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :city, :string
    add_column :friends, :string, :string
  end
end
