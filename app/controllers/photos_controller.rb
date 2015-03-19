class PhotosController < ApplicationController
  def create
    @photo = Photo.new(photo_params)
    @photo.users << current_user
    if @photo.save
      flash[:notice] = "Thuccess!"
      redirect users_path(current_user)
    else
      flash[:alert] = "Thumbs down for thumb reason"
      render :new
    end
  end

  def new
    @photo = Photo.new
    render :new
  end

  private
    def photo_params
      params.require(:photo).permit(:file)
    end
end
