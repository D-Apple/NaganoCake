class ApplicationController < ActionController::Base

 before_action :configure_permitted_parameters, if: :devise_controller?

 #ログイン後のリダイレクト先を商品一覧ページに
  def after_sign_in_path_for(resource)
    products_path(resource)
  end
  
  def current_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_furigana, :last_name_furigana, :postal_code, :address, :telephone_number])
  end


  def after_admin_sign_in_path_for(resource)
    admins_orders_path
  end

end
