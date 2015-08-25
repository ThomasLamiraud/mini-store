class AdvertsController < ApplicationController

  def index
    @adverts = Advert.order(created_at: :desc)
    @adverts_top4 = Advert.order(created_at: :desc).limit(4)
  end
end
