class AddAccountIdToFriends < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :account_id, :integer
    add_index :friends, :account_id
  end
end
