class ApplicationController < ActionController::API
 before_action :authenticate_request
  attr_reader :current_user

  private
#creates a current_user that can do CRUD methods based on the token as apis are stateless.
  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'You are not Authorized, please check your authorization from admin' }, status: 401 unless @current_user
  end
end
