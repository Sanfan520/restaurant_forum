class Friendship < ApplicationRecord
  belongs_to :user
  #省略belongs_to :user, class_name: "User", foreign_key: "user_id", primary_key: "id"
  belongs_to :friend, class_name: "User", foreign_key: "friend_id", primary_key: "id"
end