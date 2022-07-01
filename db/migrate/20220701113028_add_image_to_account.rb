class AddImageToAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :image, :attachment
  end
end
