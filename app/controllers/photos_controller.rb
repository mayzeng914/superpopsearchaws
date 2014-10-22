class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:photo_finder]

  # GET /photos
  def saver
    photo_url = params['photo_url']
    user_id = params['user_id']

    # Create a photo with a reference to a user and save to database
    Photo.create!(photo_url: photo_url, user_id: user_id)
  end

  # todo: JSON end point
  def photo_finder
    @photos = Photo.where(user_id: @current_user.id)
    render :json => @photos
  end

  # todo: View to consume API
  def photo_wall
    @current_user = current_user    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def set_user
      @current_user = current_user
    end
    # Only allow a trusted parameter "white list" through.
    def photo_params
      params[:photo]
    end
end
