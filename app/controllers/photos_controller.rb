class PhotosController < ApplicationController
  def create
    @photo = Photo.new(photo_params)
    @photo.users << current_user
    if @photo.save
      flash[:notice] = "Thuccess!"
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Thumbs down for thumb reason"
      render :new
    end
  end
  def new
    @photo = Photo.new
    render :new
  end

  def show
    @photo = Photo.find(params[:id])
    @all_tagged = @photo.users
    @all_users = User.all
  end

  private
    def photo_params
      params.require(:photo).permit(:file)
    end
end
