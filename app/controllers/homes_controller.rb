class HomesController < ApplicationController
  
  def top
    @products = Product.limit(4).order(created_at: :desc)
  end


  def about
  end
  
end
