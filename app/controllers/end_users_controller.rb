class EndUsersController < ApplicationController


  def show
    @end_user = current_end_user
  end

  def edit
    @end_user = current_end_user
  end

  def update
    @end_user = EndUser.find(params[:id])
    @end_user.update(end_user_params)
    redirect_to end_user_path(current_end_user.id)
  end

  def verification
  end

  private

  def end_user_params
    params.require(:end_user).permit(:first_name, :last_name, :first_name_furigana, :last_name_furigana, :postal_code, :address, :telephone_number, :email)
  end
end
