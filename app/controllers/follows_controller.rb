class FollowsController < ApplicationController
  before_action :set_user

  def followed_records
    ci_table = ClockIn.arel_table
    payload = @user.followed_users.map do |followed_user|
      {
        id: followed_user.id,
        name: followed_user.name,
        sleep_records: followed_user.clock_ins
                                    .where(ci_table[:clocked_out_at].gteq(1.week.ago))
                                    .order(duration: :desc)
      }
    end
    render json: payload
  end

  def follow_user
    @follow = Follow.new(
      follower_id: params[:user_id],
      followed_user_id: params[:followed_user_id]
    )
    if @follow.save
      render json: @follow, status: :created
    else
      render json: @follow.errors, status: :unprocessable_entity
    end
  end

  def unfollow_user
    @follow = Follow.find(params[:id])
    @follow.destroy
    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
