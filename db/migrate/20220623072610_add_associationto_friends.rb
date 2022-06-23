class AddAssociationtoFriends < ActiveRecord::Migration[7.0]
  def change
    change_table :friends do |t|
      t.references :friend_with, foreign_key: {to_table: :friends}
  
    end
  end
end
