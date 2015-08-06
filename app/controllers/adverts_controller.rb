class AdvertsController < ApplicationController
  before_action :set_event, only: [:edit, :destroy]

  def index
    @adverts = Advert.all
  end

  def create
    @advert = Advert.new(advert_params)
    if @advert.save
      redirect_to admin_path, alert: 'Annonce créé avec succès'
    else
      return render :new
    end
  end

  def new
    @advert = Advert.new
  end

  def edit
    @model = @advert.model.name
  end

  def destroy
    @advert.destroy
    redirect_to admin_path, alert: "Suppression effectuée avec succès !"
  end

  def update
    respond_to do |format|
      if @advert.update(advert_params)
        format.html { redirect_to admin_path, alert: 'Votre annonce a été mis à jour avec succès !' }
        format.json { render :show, status: :ok, location: @advert }
      else
        format.html { render :edit }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def advert_params
      params.require(:advert).permit(:price, :state, :model_id)
    end

    def set_event
      @advert = Advert.find(params[:id])
    end


end
