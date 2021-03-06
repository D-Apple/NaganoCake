class Admins::OrderDetailsController < ApplicationController

  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    if @order_detail.production_status == "製作中"
      @order_detail.order.update(status: "製作中")
    end
    @order_details = OrderDetail.where(order_id: @order_detail.order.id)
    if @order_details.count == @order_details.where(production_status: "製作完了").count
      @order_detail.order.update(status: "発送準備中")
    end

    redirect_to request.referer
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
