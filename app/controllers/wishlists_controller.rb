class WishlistsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @wishlist = current_user.wishlists.build(wishlist_params)
    if @wishlist.save
      flash[:success] = "wishlist created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end


  def update
    @wishlist = Wishlist.find(params[:id])
    if @wishlist.update_attributes(wishlist_params)
      flash[:success] = "wishlist updated"
      redirect_to @wishlist
    else
      render 'edit'
    end
  end

  def destroy
    wishlist.find(params[:id]).destroy
    flash[:success] = "wishlist deleted"
    redirect_to request.referrer || root_url
  end

private

    def wishlist_params
      params.require(:wishlist).permit(:sneaker_type_id,:sneaker_size,:user_id)
    end
    def correct_user
      @wishlist = current_user.wishlists.find_by(id: params[:id])
      redirect_to root_url if @wishlist.nil?
    end
end
