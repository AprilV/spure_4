class SneakersController < ApplicationController
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
end
