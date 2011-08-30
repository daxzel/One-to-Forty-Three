class Cabinet::PhotosController < ApplicationController

  def index
    @photos = current_user.photos.paginate(:page => params[:page])
  end

  def show
    @photo = current_user.photos.find(params[:id])
  end
  
  def new
    @photo = current_user.photos.new
  end
	
  def create
    @photo = current_user.photos.create(params[:photo])
    if @photo.save
      flash[:notice] = I18n.t("Successfully created!")
      redirect_to cabinet_photos_path(params[:car_id])
    else
      flash[:notice] = "failed"
      redirect_to cabinet_new_photo_path(params[:car_id])
    end
  end
	
  def edit
    @photo = current_user.photos.find(params[:id])	
  end
	
end
