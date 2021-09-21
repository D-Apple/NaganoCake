# frozen_string_literal: true

class EndUsers::SessionsController < Devise::SessionsController

  before_action :check_login?, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]
  def check_login?
    if current_end_user.is_withdrawal != true
      reset_session
      flash[:error] = "そのアカウントは、登録されていないか退会済みです。"
      redirect_to request.referer
    end
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
