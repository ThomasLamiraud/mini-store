class AdvertsController < ApplicationController
  before_action :set_advert, only: [:show]

  def index
    # @adverts = Advert.order(created_at: :desc)
    @adverts_top4 = Advert.order(created_at: :desc).limit(4)

    @q = Advert.ransack(params[:q])
    @adverts = @q.result.includes(:model)

    respond_to do |format|
      format.html { render action: "index" }
      format.json { render json: @adverts }
      format.js
    end

  end

  def show
    @adverts_top4 = Advert.order(created_at: :desc).limit(4)
  end

  private

  def set_advert
    @advert = Advert.find(params[:id])
  end

end
