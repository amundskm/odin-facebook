class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :commentable, polymorphic: true
    has_many :comments, as: :commentable, class_name: 'Comment'
    has_many :likes, as: :likeable

    validates :content, presence: true, length: {maximum: 500}
    validates :user_id, presence: true
    validates :commentable_id, presence: true
    validates :commentable_type, presence: true
end
