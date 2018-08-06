class PlantsController < ApplicationController
  before_action :logged_in_user

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new plant_params
    if @plant.save
      flash[:success] = t "create_success"
      redirect_to trip_path @plant.trip_id, content: "plant"
    else
      flash[:danger] = t "create_fail"
      redirect_to trips_path
    end
  end

  def destroy
    @plant = Plant.find_by id: params[:id]
    trip_id = @plant.trip_id
    if !@plant
      flash[:danger] = t "find_plant_fail"
      redirect_to trips_path
    else
      if @plant.destroy
        flash[:success] = t "delete_success"
        redirect_to trip_path trip_id, content: "plant"
      else
        flash[:danger] = t "delete_fail"
        redirect_to trips_path
      end
    end
  end

  private

  def plant_params
    params.require(:plant).permit :description, :trip_id, :place_id, place_attributes: [:name]
  end
end
