class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
           
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :pending_friend_requests, class_name: "FriendRequest",
                                     foreign_key: "sender_id",
                                     dependent: :destroy
  has_many :senders, through: :pending_friend_requests
  has_many :received_friend_requests, class_name: "FriendRequest",
                                      foreign_key: "receiver_id",
                                      dependent: :destroy
  has_many :receivers, through: :received_friend_requests

  def become_friends(other_user)
    self.friends << other_user
    other_user.friends << self
  end

  def send_friend_request(other_user)
    pending_friend_requests.build(receiver_id: other_user.id).save
  end

  def likes?(likeable_id, likeable_type)
    like = Like.find_by(user_id: self.id, likeable_id: likeable_id, likeable_type: likeable_type)
  end

end
