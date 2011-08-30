class Cabinet::CarsController < ApplicationController
  before_filter :find_object, :only => [:edit, :show, :update, :destroy]
  
  def index
    @cars = current_user.cars.paginate(:page => params[:page], :per_page =>Settings.count_cars_in_page)
  end

  def show
  end

  def new
    @car = current_user.cars.new
  end

  def edit
  end

  def create
    @car = current_user.new(params[:car])
    if @car.save
      flash[:notice] = "Successfully created!"
      redirect_to cabinet_cars_path(@car)
    end
  end
  
  def update
  end

  def destroy
    current_user.cars.remove(@car)
  end
  private

  def find_object
    @car = current_user.cars.find_by_title(params[:id])
    raise ActiveRecord::RecordNotFound, "Could not find the car '#{params[:id]}'" unless @car
  end

end
