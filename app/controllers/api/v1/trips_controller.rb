class Api::V1::TripsController < ApplicationController

  before_action :find_trip, only: [:update, :show, :destroy]

  def index
    @trips = Trip.all
    render json: @trips
  end

  def create
    @trip = Trip.create(trip_params)
    render json: @trip, status: :accepted
  end

  def update
    @trip.update(trip_params)
    render json: @trip, status: :accepted
  end

  def show
    render json: @trip
  end

  def destroy
    @trip.destroy
  end

  private

  def find_trip
    @trip = Trip.find_by(id: params[:id])
  end

  def trip_params
    params.require(:trip).permit(:city, :start_date, :end_date, :address)
  end

end
