class UsersController < ApplicationController

  def index
  end

  def show
    @orders = current_user.orders_as_provider
  end
end
