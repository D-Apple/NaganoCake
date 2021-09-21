class ApplicationController < ActionController::Base

 before_action :configure_permitted_parameters, if: :devise_controller?

 #ログイン後のリダイレクト先を商品一覧ページに
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_products_path
    when EndUser  
      products_path(resource)
    end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_furigana, :last_name_furigana, :postal_code, :address, :telephone_number])
  end

end
