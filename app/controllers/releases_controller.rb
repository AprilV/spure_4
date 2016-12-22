class ReleasesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]
  before_action :correct_user,   only: [:index]
  before_action :admin_user,     only: [:destroy,:update]

  def create
    @release = current_user.releases.build(release_params)
    if @release.save
      flash[:success] = "release created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @release.destroy
    flash[:success] = "release deleted"
    redirect_to request.referrer || root_url
  end

  private

    def release_params
      params.require(:release).permit(:time,:province,:city,:shop_name,:concrete_add,:sneaker_type_id,:original_retail)
    end

end
