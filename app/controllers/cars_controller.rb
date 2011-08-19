class CarsController < ApplicationController

  before_filter :find_object, :only => [:edit, :show, :update, :destroy]
  
  # GET /cars
  # GET /cars.xml
  def index
    @cars = Car.all
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

    respond_to do |format|
      if @car.save
        format.html { redirect_to(@car, :notice => 'Car was successfully created.') }
        format.xml  { render :xml => @car, :status => :created, :location => @car }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @car.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cars/1
  # PUT /cars/1.xml
  def update
    respond_to do |format|
      if @car.update_attributes(params[:car])
        format.html { redirect_to(@car, :notice => 'Car was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @car.errors, :status => :unprocessable_entity }
      end
    end
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
