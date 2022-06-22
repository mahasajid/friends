class AddFacebooToFriends < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :facebook, :string
  end
end
