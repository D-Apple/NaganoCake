class OrdersController < ApplicationController


  def index
    @user = current_end_user
    @orders = @user.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    @selling_price = 0
    @order_details.each do |order_detail|
      subtotal_price = order_detail.amount * order_detail.selling_price
      @selling_price += (subtotal_price * 1.1).floor
    end
  end

  def new
    @order = Order.new
  end

  def confirm
    @total_price = 0
    @end_user = current_end_user
    @new_order = Order.new
    @new_order.order_details.build
    @cart_products = CartProduct.where(end_user_id: current_end_user.id)
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
      @order.shipping_address = current_end_user.address
      @order.shipping_postal_code = current_end_user.postal_code
      @order.shipping_name = current_end_user.last_name + current_end_user.first_name
    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:registard_address])
      @order.shipping_address = @address.address
      @order.shipping_postal_code = @address.postal_code
      @order.shipping_name = @address.name
    elsif params[:order][:address_option] == "2"
    end
  end

  def create
     @end_user = current_end_user
     @cart_products = CartProduct.where(end_user_id: current_end_user.id)
     @order = Order.new(order_params)
     @order.save
     @cart_products.destroy_all
     redirect_to thanks_path
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :total_price, :end_user_id, :shipping_name, :shipping_address, :shipping_postal_code,
                                  order_details_attributes: [:product_id, :amount, :selling_price])
  end

end
