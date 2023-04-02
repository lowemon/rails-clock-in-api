class User < ApplicationRecord
  has_many :clock_ins, dependent: :destroy
  has_many :follower_relationships, class_name: "Follow",
                                    foreign_key: "followed_id",
                                    dependent: :destroy
  has_many :followed_relationships, class_name: "Follow",
                                    foreign_key: "follower_id",
                                    dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower
  has_many :followed_users, through: :followed_relationships, source: :followed
end
