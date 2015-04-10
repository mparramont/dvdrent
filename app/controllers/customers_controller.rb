class CustomersController < ApplicationController
  before_action :set_customer, only: [:destroy]

  # POST /customers
  def create
    @movie = Movie.find(params[:movie])
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to movie_path(id: @movie.id, customer: @customer.id), notice: 'Customer was successfully created.' }
      else
        format.html { render "movies/show" }
      end
    end
  end


  # DELETE /customers/1
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to admin_root_path, notice: 'Customer was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :phone_number, :email)
    end
end
