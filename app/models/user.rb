class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :clock_ins
  has_many :follows

  has_many :received_follows, foreign_key: :followed_user_id, class_name: 'Follow'
  has_many :followers, through: :received_follows, source: :follower

  has_many :given_follows, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followings, through: :given_follows, source: :followed_user

  # Task
  # Seed Users
  # Allow Users to log sleep time and wake-up time
  # Allow a User to follow/unfollow another User
  #   - Create api for user lists
  # Allow to see sleep record over past week, ordered by length of sleep
  #

  # Fetch in-progress log
  #
  # @return [SleepLog]
  def open_log
    clock_ins.where(clocked_out_at: nil).last
  end

  # Initialize / End Sleep Session
  #
  # @return [Void]
  def log_sleep!
    return open_log.end_session! if open_log

    clock_ins.new_session!
  end

  # Check if user is already followed
  #
  # @return [Boolean]
  def followed?(user)
    followings.where(id: user.id).present?
  end

  # Follow a User
  def follow!(followee)
    given_follows.create!(follower_id: id, followed_user_id: followee.id)
  end

  # Unfollow a User
  def unfollow!(followee)
    given_follows.find_by(followed_user_id: followee.id)&.destroy!
  end
end
