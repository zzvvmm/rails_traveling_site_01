class TripsController < ApplicationController
  before_action :logged_in_user

  def new
    @trip = Trip.new
    @places = Place.all
  end

  def create
    @trip = Trip.new trip_params
    if @trip.save
      flash[:success] = t "create_success"
      redirect_to root_url
    else
      flash[:danger] = t "create_fail"
      render :new
    end
  end

  private

  def trip_params
    params.require(:trip).permit :name, :user_id, :begin, :destination_id,
      place_attributes: [:name]
  end
end
