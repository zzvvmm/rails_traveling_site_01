class ParticipationsController < ApplicationController
  before_action :logged_in_user, :find_user, :find_trip,
    :check_user, only: :create

  def create
    @participations = @trip.participations.new user: @user,
      accepted: "join_in"
    if @participations.save
      flash[:success] = t "success.add_member"
    else
      flash[:danger] = t "danger.add_member"
    end
    redirect_to trip_searchs_path @trip
  end

  private

  def find_user
    @user = User.find_by id: params[:user_id]

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
    return if @trip.owner.is_user? current_user

    flash[:danger] = t "danger.check_user"
    redirect_to root_url
  end
end
