class ClockIn < ApplicationRecord
  TIME_FORMAT = '%Y-%m-%d %I:%M:%S %p'

  validates :created_at, presence: true, uniqueness: { scope: :user_id }

  belongs_to :user

  scope :over_past_week, -> { where(created_at: DateTime.now..(DateTime.now - 7.days)) }
  scope :order_by_sleep, -> { order(duration: :desc) }
  scope :order_by_created_at, -> { order(created_at: :desc) }

  class << self
    # Initialize New Sleep Log Session
    def new_session!
      create!(clocked_in_at: Time.zone.now, created_at: DateTime.now)
    end
  end

  # End current open sleep log session
  #
  # @return [Void]
  def end_session!
    wakeup_time = DateTime.now
    sleep_time_hour = ((clocked_in_at- wakeup_time) / 1.hour).round
    update(clocked_out_at: wakeup_time, duration: sleep_time_hour)
  end

  # Format sleep time
  #
  # @return [String]
  def normalized_sleep_time
    created_at.strftime(TIME_FORMAT)
  end

  # Format wakeup time
  #
  # @return [String]
  def normalized_wakeup_time
    return nil unless clocked_out_at

    clocked_out_at.strftime(TIME_FORMAT)
  end
end
