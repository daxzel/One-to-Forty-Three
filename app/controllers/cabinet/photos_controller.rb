class Cabinet::PhotosController < ApplicationController

  def index
    @photos = current_user.photos.paginate(:page => params[:page])
  end

  def show
    @photo = current_user.photos.find(params[:id])
  end

end
