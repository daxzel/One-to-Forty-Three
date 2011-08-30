class PhotosController < ApplicationController
	
	before_filter :find_car, :only => [:index, :new, :edit, :create, :show, :update, :destroy]

	def index
                @photos = @car.photos.paginate(:page => params[:page], :per_page => 9)
	end
	
	def show
		@photo = @car.photos.find(params[:id])
	end

	
	def update
		
	end

	
	def destroy
	       photo = @car.photos.find(params[:id])
               photo.destroy
	end

        private

  	def find_car
    		@car = Car.find_by_title(params[:car_id])
    		raise ActiveRecord::RecordNotFound, "Could not find the car '#{params[:id]}'" unless @car
 	end
end
