class WelcomeController < ApplicationController
  def index
	@count_cars = 3
	@count_all_cars = Car.count
	if @count_cars>@count_all_cars
	  @count_cars = @count_all_cars
        end  
	@cars = Car.all(:limit => @count_cars,:conditions => [ "id >= ?", rand(@count_all_cars-1)])
  end

  def about
  end

end
