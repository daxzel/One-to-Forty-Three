class PhotosController < ApplicationController
	
	before_filter :find_car, :only => [:index, :new, :edit, :create, :show, :update, :destroy]

	def index
                @photos = @car.photos
	end
	
	def show
		@photo = @car.photos.find(params[:id])
	end

	
	def new
                @photo = @car.photos.new
	end
	
	def create
                @photo = @car.photos.create(params[:photo])
		if @photo.save
			flash[:notice] = I18n.t("Successfully created!")
                        redirect_to car_photos_path(params[:car_id])

		else
			flash[:notice] = "failed"
                        redirect_to new_car_photo_path(params[:car_id])
		end
	end
	
	def edit
		@photo = @car.photos.find(params[:id])	
	end
	
	def update
		
	end

	
	def destroy
		
	end

        private

  	def find_car
    		@car = Car.find_by_title(params[:car_id])
    		raise ActiveRecord::RecordNotFound, "Could not find the car '#{params[:id]}'" unless @car
 	end
end
