class SearchsController < ApplicationController
  before_action :logged_in_user, :find_trip, only: :index

  def index
    @users = if params[:keyword]
               User.search(params[:keyword]).page(params[:page]).per_page
             else
               User.all.page(params[:page]).per_page
             end
  end

  private

  def find_trip
    @trip = Trip.find_by id: params[:trip_id]

    return if @trip
    flash[:danger] = t "danger.find_trip"
    redirect_to root_url
  end
end
