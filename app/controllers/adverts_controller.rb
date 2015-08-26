class AdvertsController < ApplicationController
  before_action :set_advert, only: [:show]

  def index
    @adverts = Advert.order(created_at: :desc)
    @adverts_top4 = Advert.order(created_at: :desc).limit(4)
  end

  def show

  end

  private

  def set_advert
    @advert = Advert.find(params[:id])
  end

end
