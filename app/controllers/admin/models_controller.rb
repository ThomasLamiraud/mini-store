module Admin
  class ModelsController < AdminController
    before_action :set_model, only: [:edit, :destroy, :update]
    before_action :authenticate_user!
    before_action :admin_only

    def index
      @models = Model.all
    end

    def create
      @model = Model.new(model_params)
      if @model.save
        redirect_to admin_models_path, alert: 'Model créé avec succès'
      else
        return render :new
      end
    end

    def new
      @model = Model.new
    end

    def edit

    end

    def update
      respond_to do |format|
        if @model.update(model_params)
          format.html { redirect_to admin_models_path, alert: 'Votre annonce a été mis à jour avec succès !' }
          format.json { render :show, status: :ok, location: @model }
        else
          format.html { render :edit }
          format.json { render json: @model.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @model.destroy
      redirect_to admin_models_path, alert: "Suppression effectuée avec succès !"
    end

    private

    def model_params
      params.require(:model).permit(:name, :year, :brand_id)
    end

    def set_model
      @model = Model.find(params[:id])
    end
  end
end
