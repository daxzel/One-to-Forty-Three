class CarsController < ApplicationController

  before_filter :find_object, :only => [:edit, :show, :update, :destroy]
  
  # GET /cars
  # GET /cars.xml
  def index
    @cars = Car.paginate(:page => params[:page], :per_page =>10)
  end

  # GET /cars/1
  # GET /cars/1.xml
  def show
  end

  # GET /cars/new
  # GET /cars/new.xml
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  # POST /cars.xml
  def create
    @car = Car.new(params[:car])
  end

  # PUT /cars/1
  # PUT /cars/1.xml
  def update
  end

  # DELETE /cars/1
  # DELETE /cars/1.xml
  def destroy
    @car.destroy
  end
  private

  def find_object
    @car = Car.find_by_title(params[:id])
    raise ActiveRecord::RecordNotFound, "Could not find the car '#{params[:id]}'" unless @car
  end


end
