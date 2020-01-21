module CreateSession
  extend ActiveSupport::Concern
  require "json_web_token"

  def jwt_session_create(user_id)
    user = User.find_by_id(user_id)
    if user
      return JsonWebToken.encode({ user_id: user_id })
    else
      return nil
    end
  end
end
