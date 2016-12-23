class SneakersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:index]
  before_action :admin_user,     only: [:destroy,:update,:new,:update]
  def index
  	@sneaker = Sneaker.paginate(page: params[:page])
  end

  def show
  	@sneaker = Sneaker.find(params[:id])
  	redirect_to root_url 
  end

  def new 
  	@sneaker = Sneaker.new
  end

  def create
  	@sneaker = Sneaker.new(sneaker_params)
  	if @sneaker.save
  		flash[:info] = "sneaker save!"
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end

  def edit
  	@sneaker = Sneaker.find(params[:id])
  end

  def update
  	@sneaker = Sneaker.find(params[:id])
  	if @sneaker.update_attributes(sneaker_params)
  		flash[:sucess] = "sneaker update"
  		redirect_to @user
  	else
  		render 'edit'
  	end
  end

  def destroy
  	Sneaker.find(params[:id]).destroy
  	flash[:success] = "sneaker destroy"
  	redirect_to sneakers_url
  end

  private 
    def sneaker_params
    	params.require(:sneaker).permit(:image,:max_size,:min_size,:history_high,
    									:history_low,:sneaker_type_id,:sneaker_type_name)
    end
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
