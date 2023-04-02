class User < ApplicationRecord
  has_many :clock_ins
  has_many :follows, foreign_key: :follower_id
  has_many :followings, through: :follows, source: :followed
  has_many :sleep_records
end
