class UsersController < ApplicationController

  
  def profile
    @user = current_user
    redirect_to "/"+current_user.uid
  end

  def view
    @user ||= User.find_by_uid(params[:id])
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :uid)
  end
end
