module Admin
  class BrandsController < AdminController
    before_action :authenticate_user!
    before_action :admin_only

    def index
      @brands = Brand.all
    end

    def create
      @brand = Brand.new(brand_params)
      if @brand.save
        redirect_to admin_brands_path, alert: 'Nouvelle marque ajoutée'
      else
        return render :new
      end
    end

    def new
      @brand = Brand.new
    end

    private

    def brand_params
      params.require(:brand).permit(:name)
    end
  end
end
