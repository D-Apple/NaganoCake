class OrdersController < ApplicationController


  def index
    @user = current_end_user
    @orders = @user.orders
  end

  def show
  end

  def new
  end

  def confirm
  end

  def thanks
  end

end
