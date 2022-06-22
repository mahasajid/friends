class ChangeDetailsOfFriends < ActiveRecord::Migration[7.0]
  def change
    change_column :friends, :first_name, :string, null:false
  end
end
