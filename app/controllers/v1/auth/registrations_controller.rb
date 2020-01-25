class V1::Auth::RegistrationsController < ApplicationController
  include CreateSession

  before_action :authenticate_user, only: :destroy

  def create
    @user = User.new registration_params

    if @user.save
      @token = jwt_session_create @user.id
      if @token
        return success_user_create
      else
        return error_token_save
      end
    else
      return error_user_save
    end
  end

  def destroy
    current_user.destroy!
    return success_user_destroy
  end

  protected

  def success_user_create
    response.headers["Authorization"] = "Bearer #{@token}"
    render status: :created, template: "v1/users/auth.json.jbuilder"
  end

  def success_user_destroy
    render status: :no_content, json: {}
  end

  def error_token_save
    render status: :unprocessable_entity, json: { errors: [I18n.t("errors.token.not_created")] }
  end

  def error_user_save
    render status: :unprocessable_entity, json: { errors: @user.errors.full_messages }
  end

  private

  def registration_params
    params.permit(:email, :password, :name)
  end
end
