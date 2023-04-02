class ClockInsController < ApplicationController
  before_action :set_user
  # Get all Sleep Records of the User
  def index
    @clock_ins = @user.clock_ins.order(created_at: :desc)
    render json: @clock_ins
  end
  
  # Endpoint where the user will sleep
  def clock_in
    @clock_in = @user.clock_ins.new(clocked_in_at: Time.zone.now)

    if @clock_in.save
      render json: @clock_in, status: :created
    else
      render json: @clock_in.errors, status: :unprocessable_entity
    end
  end

  # Endpoint where the user will wake up
  def clock_out
    @clock_in = @user.clock_ins.find(params[:id])

    clock_out_time = Time.zone.now
    duration = calculate_sleep_duration(clock_in: @clock_in)

    if @clock_in.update(clocked_out_at: clock_out_time, duration: duration)
      render json: @clock_in, status: :ok
    else
      render json: @clock_in.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def calculate_sleep_duration(clock_in:)
    sleep_start = clock_in.clocked_in_at
    sleep_end = Time.zone.now

    (sleep_end - sleep_start).seconds.in_hours.round(2)
  end
end
