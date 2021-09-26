class EndUsersController < ApplicationController

   before_action :authenticate_end_user!

  def show
    @end_user = current_end_user
  end

  def edit
    @end_user = current_end_user
  end

  def update
    end_user = EndUser.find(params[:id])
    end_user.update(end_user_params)
    redirect_to mypage_path(current_end_user.id)
  end

  def withdrawal
    @end_user = current_end_user
    @end_user.is_withdrawal = false
    @end_user.save
    reset_session
    redirect_to root_path
  end

  def verification
  end

  private

  def end_user_params
    params.require(:end_user).permit(:first_name, :last_name, :first_name_furigana, :last_name_furigana, :postal_code, :address, :telephone_number, :email)
  end
end
