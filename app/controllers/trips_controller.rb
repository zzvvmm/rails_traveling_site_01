class TripsController < ApplicationController
  before_action :logged_in_user
  before_action :find_trip, only: :show

  def new
    @trip = Trip.new
    @places = Place.all
  end

  def create
    @trip = Trip.new trip_params
    if @trip.save
      flash[:success] = t "create_success"
      @trip.members << @trip.owner
      redirect_to @trip
    else
      flash[:danger] = t "create_fail"
      render :new
    end
  end

  def show
    @user = User.find_by id: @trip.user_id

    return if @user
    flash[:danger] = t "danger.find_user"
    redirect_to root_url
  end

  private

  def trip_params
    params.require(:trip).permit :name, :user_id, :begin, :destination_id,
      place_attributes: [:name]
  end

  def find_trip
    @trip = Trip.find_by id: params[:id]

    return if @trip
    flash[:danger] = t "danger.find_trip"
    redirect_to root_url
  end
end
