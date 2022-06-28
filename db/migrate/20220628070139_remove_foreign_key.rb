class RemoveForeignKey < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key "friends", "friends", column: "friend_with_id"
  end
end
