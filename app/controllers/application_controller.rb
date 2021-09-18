class ApplicationController < ActionController::Base
  def after_admin_sign_in_path_for(resource)
    admins_orders_path
  end
end
