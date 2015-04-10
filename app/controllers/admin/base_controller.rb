class Admin::BaseController < ApplicationController
	before_action :authenticate_user!
  before_filter :require_admin!

  def customers
  	@customers = Customer.paginate(:page => params[:page], :per_page => 16)
  end

  def movies 
  	@movies = Movie.paginate(:page => params[:page], :per_page => 10)
  	if params[:movie]
  		@movie = Movie.find(params[:movie])
  	else
  		@movie = Movie.new
  	end
  end
end
