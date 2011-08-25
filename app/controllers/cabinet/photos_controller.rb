class Cabinet::PhotosController < ApplicationController

  def index
    @photos = current_user.photos.paginate(:page => params[:page])
  end

end
