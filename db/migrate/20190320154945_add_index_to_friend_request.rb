class AddIndexToFriendRequest < ActiveRecord::Migration[5.2]
  def change
    remove_column :friend_requests, :user_id, :integer
    remove_column :friend_requests, :pending_friend_id, :integer
    add_column :friend_requests, :sender_id, :integer
    add_column :friend_requests, :receiver_id, :integer
    add_index :friend_requests, :sender_id
    add_index :friend_requests, :receiver_id
    add_index :friend_requests, [:sender_id, :receiver_id], unique: true
  end
end
