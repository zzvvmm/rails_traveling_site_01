class ParticipationsController < ApplicationController
  before_action :logged_in_user
  before_action :find_user, :find_trip, :check_user,
    only: :create

  def create
    @participation = @trip.participations.new user: @user,
      accepted: params[:accepted]
    if @participation.save
      flash[:success] = t "success.add_member"
    else
      flash[:danger] = t "danger.add_member"
    end
    redirect_to request.referrer
  end

  private

  def check_accepted?
    params[:accepted] == "join_in"
  end

  def find_user
    @user = if check_accepted?
              User.find_by id: params[:user_id]
            else
              current_user
            end
    return if @user
    flash[:danger] = t "danger.find_user"
    redirect_to root_url
  end

  def find_trip
    @trip = Trip.find_by id: params[:trip_id]

    return if @trip
    flash[:danger] = t "danger.find_trip"
    redirect_to root_url
  end

  def check_user
    if check_accepted?

      return if current_user.is_user? @trip.owner
    else

      return unless @trip.members.include? @user
    end
    flash[:danger] = t "danger.check_user"
    redirect_to root_url
  end
end
