class Admins::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_detail = order_detail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to request.referer
  end
  
  private
  def order_detail_params
    params.require(:order_detail).params(:production_status)
  end
end
