class PhotosController < ApplicationController
	
	def index
		@photos = Photo.all(:limit => 10)
	end
	
	def show
		@photo = Photo.find(params[:id])
	end
	
	def new
		@photo = Photo.new
	end
	
	def create
		@photo = Photo.new(params[:photo])
		if @photo.save
			flash[:notice] = "Successfully created!"
			redirect_to photos_path
		else
			redirect_to new_photo_path
		end
	end
	
	def edit
		@photo = Photo.find(params[:id])
	end
	
	def update
		
	end

	def destroy
		
	end
end
