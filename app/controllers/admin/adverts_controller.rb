module Admin
  class AdvertsController < AdminController
    before_action :authenticate_user!
    before_action :admin_only

    def index
      @adverts = Advert.all
    end
  end
end
