class V1::Auth::SessionsController < ApplicationController
  include CreateSession

  before_action :authenticate_user, only: [:validate_token]

  def create
    return error_insufficient_params unless params[:email].present? && params[:password].present?
    @user = User.find_by(email: params[:email])
    return error_invalid_credentials if @user.nil?
    if @user.authenticate(params[:password])
      @token = jwt_session_create @user.id
      if @token
        return success_user_created
      else
        return error_token_create
      end
    else
      return error_invalid_credentials
    end
  end

  def validate_token
    @token = request.headers["Authorization"]
    @user = current_user
    success_valid_token
  end

  protected

  def success_user_created
    response.headers["Authorization"] = "Bearer #{@token}"
    render status: :created, template: "v1/users/auth.json.jbuilder"
  end

  def success_valid_token
    response.headers["Authorization"] = "Bearer #{@token}"
    render status: :ok, template: "v1/users/auth.json.jbuilder"
  end

  def error_invalid_credentials
    render status: :unauthorized, json: { errors: [I18n.t("errors.controllers.auth.invalid_credentials")] }
  end

  def error_token_create
    render status: :unprocessable_entity, json: { errors: [I18n.t("errors.token.not_created")] }
  end

  def error_insufficient_params
    render status: :unprocessable_entity, json: { errors: [I18n.t("errors.insufficient_params")] }
  end
end
