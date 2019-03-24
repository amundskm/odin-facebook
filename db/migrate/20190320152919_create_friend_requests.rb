class CreateFriendRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests do |t|
      t.integer :pending_friend_id
      t.integer :user_id
      t.timestamps
    end
  end
end
