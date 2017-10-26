class AuthorizeApiRequest
  prepend SimpleCommand
  #this is for enabling authentication by authorizing the api request

  def initialize(headers = {})
    #gets the headers and initializes them
    @headers = headers
  end

  def call
    user
  end

  private

  attr_reader :headers

  def user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @user || errors.add(:token, 'Invalid token') && nil
  end

  def decoded_auth_token
    #Decodes the token which we call the method within the LIB directory
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    #Check to see if the auth header Key is present and when present it ruturns it
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      errors.add(:token, 'Missing token')
    end
    nil
  end
end
