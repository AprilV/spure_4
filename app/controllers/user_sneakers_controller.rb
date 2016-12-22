class User_sneakerSneakersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy


  def index
    @user_sneakers = User_sneaker.paginate(page: params[:page])
  end

  def show
    @user_sneaker = User_sneaker.find(params[:id])
  end

  def new
    @user_sneaker = User_sneaker.new
  end

  def create
    @user_sneaker = User_sneaker.new(user_sneaker_params)
    if @user_sneaker.save
      redirect_to @user
      # 这个地方应该不大对 = = 不应该转到这个地方
    else
      render 'new'
    end
  end

  def edit
    @user_sneaker = User_sneaker.find(params[:id])
  end

  def update
    @user_sneaker = User_sneaker.find(params[:id])
    if @user_sneaker.update_attributes(user_sneaker_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User_sneaker.find(params[:id]).destroy
    flash[:success] = "User_sneaker deleted"
    redirect_to user_sneakers_url
  end

  private

    def user_sneaker_params
      params.require(:user).permit(:sneaker_type_id,:bought_time,:bought_price,:size,:user_id)
    end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
