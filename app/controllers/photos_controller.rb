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
    all_users = User.all
    @select_options = []
    all_users.each() do |user|
      @select_options << [user.name, user.id]
    end
  end

  def update
    @photo = Photo.find(params[:id])
    @new_taggee = User.find(params[:photo][:users])
    binding.pry
    if @photo.users.push(@new_taggee)
      flash[:notice] = "Shared with #{@new_taggee.name}"
    else
      flash[:alert] = "Sharing unthuccessful!"
    end
    @all_tagged = @photo.users
    render :show
  end

  private
    def photo_params
      params.require(:photo).permit(:file)
    end
end
