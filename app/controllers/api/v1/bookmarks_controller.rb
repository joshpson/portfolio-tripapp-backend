class Api::V1::BookmarksController < ApplicationController
  before_action :find_bookmark, only: [:show, :destroy]

  def index
    @bookmarks = Bookmark.all
    render json: @bookmarks
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.valid?
      @bookmark.save
      render json: @bookmark, status: :accepted
    else
      render json: {errors: @bookmark.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def show
    render json: @bookmark
  end

  def destroy
    @bookmark.destroy
  end

  private

  def find_trip
    @bookmark = Bookmark.find_by(id: params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:category, :title, :description, :address, :api_service, :api_id, :trip_id, :image)
  end

end
