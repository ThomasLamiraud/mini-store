class AdminController < ApplicationController
  before_action :fetch_user, only: [:open_session]
  def index
    @brands = Brand.all
    @models = Model.all
    @adverts = Advert.all
  end

  def login
    return redirect_to admin_path(current_user), alert: t('devise.failure.already_authenticated') if current_user && current_user.role == 'admin'
  end


  def open_session
    unless @user.nil?
      if @user.valid_password?(secure_params['password'])
        sign_in(@user)
        return redirect_to admin_path, notice: "connecté"
      end

    end
    return redirect_to me_path, alert: "champs invalide"
  end

  private

    def fetch_user
      if params[:user].present?
        @user = User.where(email: params[:user][:email]).take
      else
        @user = current_user
      end
    end

    def secure_params
      params.require(:user).permit(:password, :email)
    end


end
