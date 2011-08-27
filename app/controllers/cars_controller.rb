class CarsController < ApplicationController

  before_filter :find_object, :only => [:edit, :show, :update, :destroy]
  
  def index
    @cars = Car.paginate(:page => params[:page], :per_page =>Settings.count_cars_in_page)
  end

  def show
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def create
    @car = Car.new(params[:car])
    if @car.save
      flash[:notice] = "Successfully created!"
      redirect_to car_path(@car)
    else
      redirect_to new_car_path
    end
  end
  
  def update
  end

  def destroy
    @car.destroy
  end
  private

  def find_object
    @car = Car.find_by_title(params[:id])
    raise ActiveRecord::RecordNotFound, "Could not find the car '#{params[:id]}'" unless @car
  end


end
