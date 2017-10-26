class CustomersController < ApplicationController
before_action :look_customers,only:[:show,:update,:destroy]
#get /customers
def index
@customers=Customers.all
  render json: @customers
end
#post /customer
def create
  @customer=Customer.create(customer_params)
      if @customer.save
        render json: @customer,status: :created,location: @customer
      else
        render json: @customer.errors, status: :unprocessable_entity
      end
end
#get /customer/1
def show
  render json: @customer
end
#patch/put /customers/1
def update
  @customer.update(customer_params)
      if @customer.save
          render json: @customer
      else
          render json: @customer.errors, status: :unprocessable_entity
      end
end
#delete /customers/1
def destroy
  @customer.destroy

end
private

def customer_params
  params.require(:customer).permit(:email,:full_name,:date_of_birth,address_attributes:[:street,:city,:state,:zip_code])

end

def look_customers
  #Look for the customers for by the params id
  @customer=Customer.find(params[:id])
end


end
