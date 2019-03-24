class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, as: :commentable
    has_many :likes, as: :likeable

    validates :content, presence: true, length: {maximum: 500}
    validates :user_id, presence: true
end
