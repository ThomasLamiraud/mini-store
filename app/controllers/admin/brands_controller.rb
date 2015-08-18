module Admin
  class BrandsController < AdminController
    before_action :authenticate_user!
    before_action :admin_only

    def index
      @brands = Brand.all
    end
  end
end
