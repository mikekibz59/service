class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request
#this is used to authenicate the user and assign the token 
  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
