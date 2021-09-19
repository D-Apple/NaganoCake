class CartProductsController < ApplicationController
  def index
    @cart_products = CartProduct.where(end_user_id: current_end_user.id)

  end

  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.save
    redirect_to cart_products_path
  end

  def destroy
    cart_product = CartProduct.find(params[:id])
    cart_product.destroy
    redirect_to request.referer
  end
  private

  def cart_product_params
    params.require(:cart_product).permit(:amount, :end_user_id, :product_id)
  end
end
