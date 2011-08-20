class WelcomeController < ApplicationController
  def index
	@count_cars = Settings.count_view_cars
	@count_all_cars = Car.count
	@count_cars = [@count_cars,@count_all_cars].min
	@cars = Car.all(:order => 'RANDOM()',:limit => @count_cars)
  end

  def about
  end

end
