class Api::V1::TripsController < ApplicationController
  before_action :authenticate_user
  before_action :find_trip, only: [:update, :show, :destroy]

  def index
    @trips = current_user.trips
    render json: @trips
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.valid?
      @trip.save
      render json: @trip, status: :accepted
    else
      render json: {errors: @trip.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def update
    @trip.update(trip_params)
    if @trip.save
      render json: @trip, status: :accepted
    else
      render json: {errors: @trip.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def show
    render json: @trip
  end

  def search
    @results = Yelp.getData(params[:query], params[:address_latitude], params[:address_longitude])
    render json: @results
  end

  def categories
    @results = Yelp.getCategories()
    render json: @results
  end

  def photos
    @results = Yelp.getPhotos(params[:business])
    render json: @results
  end

  def directions
    @results = Mapbox.getDirections(params[:directionsType], params[:userLong], params[:userLat], params[:destLong], params[:destLat])
    render json: @results
  end

  def mapbox
    @results = Mapbox.search(params[:query])
    render json: @results
  end

  def destroy
    @trip.destroy
  end

  private

  def find_trip
    @trip = Trip.find_by(id: params[:id])
  end

  def trip_params
    params.permit(:city, :start_date, :end_date, :address, :image, :address_latitude, :address_longitude, :status, :user_id, :query)
  end

end
