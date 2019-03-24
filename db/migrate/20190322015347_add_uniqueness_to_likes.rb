class AddUniquenessToLikes < ActiveRecord::Migration[5.2]
  def change
    add_index :likes, [:likeable_id, :likeable_type, :user_id], unique: true
  end
  
end
