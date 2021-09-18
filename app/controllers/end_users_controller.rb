class EndUsersController < ApplicationController
  
  
  def show
    @end_user = current_end_user
  end

  def edit
  end

  def verification
  end
end
