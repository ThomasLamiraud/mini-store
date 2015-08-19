module Admin
  class BrandsController < AdminController
    before_action :set_brand, only: [:edit, :destroy, :update]
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

    def edit

    end

    def update
      respond_to do |format|
        if @brand.update(brand_params)
          format.html { redirect_to admin_brands_path, alert: 'Votre marque a été mis à jour avec succès !' }
          format.json { render :show, status: :ok, location: @brand }
        else
          format.html { render :edit }
          format.json { render json: @brand.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @brand.destroy
      redirect_to admin_brands_path, alert: "Suppression effectuée avec succès !"
    end

    private

    def brand_params
      params.require(:brand).permit(:name)
    end

    def set_brand
      @brand = Brand.find(params[:id])
    end
  end
end
