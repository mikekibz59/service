class AuthenticateUser
  prepend SimpleCommand
#this is  used to take care of authenticating the user
  def initialize(email, password)
    @email = email
    @password = password
  end
#this is the call that ensures that the token is made only after the user has been authenticated.
  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :email, :password

  def user
    user = User.find_by_email(email)
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end
