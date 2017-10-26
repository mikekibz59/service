require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
let(:valid_attributes){
  skip("add a hash of attributes valid for your model")

  }
let(:invalid_attributes){
  skip("add s hash of attributes invalid for your model")
}

let(:valid_session){{}}

describe "GET #index"do
  it "returns a success response" do
    customers=Customer.create! valid_attributes
    get :index, params: {}, session: valid_session
    expect(response).to be_success
  end
end
describe "Post #create" do
  context "with valid params" do
    it "creates a new customer" do
      expect{
        post :create, params: {item: valid_attributes},session:valid_session
      }.to change(Customer, :count).by(1)
  end
  it "renders a Json response with new customer"do
    post :create, params: {customer: valid_attributes},session: valid_session
    expect(response).to have_http_status(:created)
    expect(response.content_type).to eq('application/json')
    expect(response.location).to eq(customer_url(Customer.last))
  end
end

        context "with invalid params" do
          it "renders a Json response with errors for the new customer"do
            post :create, params: {customer: invalid_attributes},session: valid_session
            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.content_type).to eq('application/json')
          end
        end
   end
   describe "PUT #update" do
     context "with valid params" do
       let(:new_attributes){
         skip("add a hash of attributes valid for your model")
       }
       it "updates the requested customer" do
          customer= Customer.create! valid_attributes
          put :update, params: {id: customer.to_param, customer: new_attributes},session: valid_session
          customer.reload
          skip("Add assertions for updated state")
       end
       it "renders a json response with customer" do
         customer=Customer.create! valid_attributes
         put :update, params: {id: customer.to_param,customer: valid_attributes},session: valid_session
         expect(response).to have_http_status(:ok)
         expect(response.content_type).to eq('application/json')
       end
     end
     context "with invalid params"do
       it "renders a json response with errors for the customer"do
         customer=Customer.create! valid_attributes
         put :update,params: {id: customer.to_param, customer: invalid_attributes},session: valid_session
         expect(response).to have_http_status(:unprocessable_entity)
         expect(response.content_type).to eq('application/json')
       end
     end
   end

   describe "delete#destroy" do
     it "destroys the customer" do
       customer= Customer.create! valid_attributes
       expect{delete :destroy,params: {id: customer.to_param},session: valid_session}.to change(Customer, :count).by(-1)
     end
   end
 end
