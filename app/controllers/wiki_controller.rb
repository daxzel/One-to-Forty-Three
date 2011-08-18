class WikiController < ApplicationController
  def index
    cars = Car.where(:title => params[:name])
    if cars.count>0
	@car = cars.first
    else
        render :text => "error"
    end
  end

end
