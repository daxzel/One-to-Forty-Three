class WelcomeController < ApplicationController
  def index
	@cars = Car.all(:limit => 3)
  end

  def about
  end

end
