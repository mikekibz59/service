class JsonWebToken
  class << self
    #used for creating the token using the rails secret_key_base and makes sure it expires after 30 minutes after it has been issued
    def encode(payload, exp = 30.minutes.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end
#this is to ensure that the tokken was decoded to be authenticated using the rails secret_key_base  and the JWT global variable
    def decode(token)
      body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
      HashWithIndifferentAccess.new body
    rescue
      nil
    end
  end
end
