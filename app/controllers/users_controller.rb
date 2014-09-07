class UsersController < ApplicationController

  
  def profile
    @user = current_user
    redirect_to "/"+current_user.uid
  end

  def view
    @user ||= User.find_by_uid(params[:id])
    if @user.nil?
      redirect_to "/"
      flash[:error] = "Invalid URL"
      return
    end
  end

  def network
    @net = Network.where(from: current_user.id)

  end

  def add_to_network
    user = User.find_by_uid(user_params[:uid])
    net = Network.create(from: current_user.id, to: user.id)
    redirect_to "/network" and return
  end

  def remove_from_network
    net = Network.where(from: current_user.id, to: params[:id]).first.destroy
    redirect_to "/network"
    return
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :uid)
  end
end
