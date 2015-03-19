class PhotosController < ApplicationController
  def create
    @photo = Photo.create(photo_params)
    @photo.users << current_user
  end

  private
    def photo_params
      params.require(:photo).permit(:file)
    end
end
