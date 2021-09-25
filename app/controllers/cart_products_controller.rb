class CartProductsController < ApplicationController
  
  before_action :authenticate_end_user!
  
  def index
    @cart_products = CartProduct.where(end_user_id: current_end_user.id)
    @total_price = 0
  end

  def create
    cart_product = CartProduct.new(cart_product_params)
    cart_product.save
    redirect_to cart_products_path
  end

  def update
    cart_product = CartProduct.find(params[:id])
    cart_product.update(cart_product_params)
    redirect_to request.referer
  end

  def destroy
    cart_product = CartProduct.find(params[:id])
    cart_product.destroy
    redirect_to request.referer
  end
  
  def destroy_all
    CartProduct.where(end_user_id: current_end_user.id).destroy_all
    redirect_to request.referer
  end
  
  private

  def cart_product_params
    params.require(:cart_product).permit(:amount, :end_user_id, :product_id)
  end
end
