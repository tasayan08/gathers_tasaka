class Customers::CustomersController < ApplicationController

  def show
   @customer = Customer.find(params[:customer_id])
  end

  def edit
   @customer = current_customer

  end

  def update
   @customer = Customer.find(params[:id])
   @customer = current_customer
   	if @customer.update(customer_params)
   	  redirect_to customer_my_page_path(@customer.id)
   	else
   	  render "edit"
   	end
  end

  def unsubscribe
   @customer = Customer.find(params[:id])
  end

  def withdraw
   @customer = Customer.find(current_customer.id)
   @customer.update(customer_status: "Invalid")
   reset_session
   redirect_to root_path
  end


  private

  def customer_params
    params.require(:customer).permit(:name, :body, :image)
  end

end
