class User < ApplicationRecord
  ## ENTITIES
  has_secure_password

  ## VALIDATIONS
  validates :email, presence: true, uniqueness: true, format: { with: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/, message: I18n.t("errors.models.user.format_email") }
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9]).{6,72}\z/, message: I18n.t("errors.models.user.format_password") }, if: :password_required?

  ## CALLBACKS
  before_validation :downcase_email!

  ## QUESTIONS
  def confirmed?
    !email_confirmed_at.nil?
  end

  ## SETTERS
  # Change admin status
  def set_admin!
    if admin?
      update(admin: false)
    else
      update(admin: true)
    end
  end

  # change user email confirm status
  def email_confirm!
    update(email_confirmed_at: Time.zone.now)
  end

  private

  # is password required for user?
  def password_required?
    password_digest.nil? || !password.blank?
  end

  # downcase email
  def downcase_email!
    email&.downcase!
  end
end
