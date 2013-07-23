class UsersController < ApplicationController
   before_filter :signed_in_user, only: [:index, :edit, :update]
   before_filter :correct_user, only: [:edit, :update]
   before_filter :admin_user, only: :destroy

  def index
	  @users = User.paginate(page: params[:page])
  end

  def new
	  if signed_in?
		  redirect_to(root_path)
	  else
		  @user=User.new
	  end
  end

  def show
	  @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
		flash[:success] = "Welcome to the Sample App!"
		sign_in @user
		redirect_to @user
    else
      render 'new'
    end
  end

  def edit
	  @user = User.find(params[:id])
  end

  def update
	  @user = User.find(params[:id])
	  if @user.update_attributes(user_params)
		  flash[:success] = "Profile updated!"
		  sign_in @user
		  redirect_to @user
	  else
		  render 'edit'
	  end
  end

  def destroy
	  user = User.find(params[:id])
	  user.destroy
	  flash[:success] = "User deleted"
	  redirect_to users_path
  end

  private 
  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

  def signed_in_user
	unless signed_in?
		store_location
		redirect_to signin_url, notice: "Please sign in."
	end
  end

  def correct_user
  	@user = User.find(params[:id])
	redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
	  redirect_to(root_path) unless current_user.admin?
  end
   
end
