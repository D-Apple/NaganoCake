class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!
  def new
    @product = Product.new
    @genres = Genre.all
  end
  
  def create
    product = Product.new(product_params)
    product.save
    redirect_to admins_product_path(product.id)
  end
  
  def index
    @products = Product.all
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def edit
    @product = Product.find(params[:id])
    @genres = Genre.all
  end
  
  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to admins_product_path(product.id)
  end
  
  private
  def product_params
    params.require(:product).permit(:genre_id, :is_status, :name, :introduction, :price, :image)
  end
end

