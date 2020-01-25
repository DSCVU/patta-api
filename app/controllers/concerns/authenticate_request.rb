module AuthenticateRequest
  extend ActiveSupport::Concern
  require "json_web_token"

  def authenticate_user
    unless current_user
      return render status: :unauthorized, json: { errors: [I18n.t("errors.unauthenticated")] }
    end
  end

  def current_user
    @current_user = nil
    if decoded_token
      data = decoded_token
      user = User.find_by_id(data[:user_id])
      if user
        Honeybadger.context(user_id: user.id)
        @current_user ||= user
      end
    end
  end

  def decoded_token
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    if header
      begin
        @decoded_token ||= JsonWebToken.decode(header)
      rescue Error => e
        return render json: { errors: [e.message] }, status: :unauthorized
      end
    end
  end
end
