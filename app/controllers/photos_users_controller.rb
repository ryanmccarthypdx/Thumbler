class PhotosUsersController < ApplicationController
  def new
  end

  def create
    @photo = Photo.find(params[:id])
  end
end
