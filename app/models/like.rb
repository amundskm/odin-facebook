class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :comment
  belongs_to :likeable, polymorphic: true
end
