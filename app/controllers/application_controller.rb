class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from ActiveRecord::RecordNotFound, :with => :rescue_from_not_found

  private

  def rescue_from_not_found(exception)
    @exception = exception
    render :file => "shared/404", :status => 404
  end

end
