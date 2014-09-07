class UsersController < ApplicationController


  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to '/', notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { redirect_to '/edit', error: 'User was not updated.' }
        format.json { render json: @network.errors, status: :unprocessable_entity }
      end
    end
  end
  
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

  def edit_profile
    @user = current_user
  end
  def network
    @net = Network.where(from: current_user.id)

  end

  def add_to_network
    user = User.find_by_uid(user_params[:uid].downcase.strip)
    if user and user.id != current_user.id
      puts "validation passed"
    net = Network.create(from: current_user.id, to: user.id)
  else
    puts "asdsadad"
    end
    redirect_to "/network" and return
  end

  def add_to_network2
    user = User.find_by_id(params[:id])
    if user and user.id != current_user.id
    net = Network.create(from: current_user.id, to: user.id)
    end
    redirect_to "/#{user.uid}" and return
  end

  def remove_from_network
    net = Network.where(from: current_user.id, to: params[:id]).first.destroy if Network.where(from: current_user.id, to: params[:id]).first
    redirect_to "/network"
    return
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name,:uid, :email, :password, :password_confirmation, :remember_me, :contact_number, :address, :job_title, :job_company, :education_degree, :education_college,:website,:dob,:bio,:location,:pic,:github,:gplus,:linkedin,:facebook, :twitter)
  end
end
