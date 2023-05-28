class Follow < ApplicationRecord
  # Follower -> User who follows
  belongs_to :follower, foreign_key: :follower_id, class_name: 'User'
  # Followee -> User who's being followed
  belongs_to :followed_user, foreign_key: :followed_user_id, class_name: 'User'

  validates :followed_user_id, :follower_id, presence: true
  validates :follower_id, uniqueness: { scope: :followed_user_id }

  validate :follower_and_followee

  private

  def follower_and_followee
    errors.add(:followed_user_id, 'cant follow yourself') if follower == followed_user
  end
end
