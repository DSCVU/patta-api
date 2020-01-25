class JsonWebToken
  SECRET_KEY = Rails.application.credentials.jwt_secret

  def self.encode(payload, exp = JWT_EXPIRY.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end
