class AdminController < ApplicationController

  def index

  end

  def login
    return redirect_to admin_path(current_user), alert: t('devise.failure.already_authenticated') if current_user && current_user.role == 'admin'
  end


  def open_session
    if @user.valid_password?(secure_params['password'])
      sign_in(@user)
      return redirect_to admin_path, notice: "connecté"
    end
    return redirect_to :back, alert: "champs invalide"
  end

  private
    def fetch_user
      if params[:user].present?
        @user = User.where(email: params[:user][:email]).take
      else
        @user = current_user
      end
    end


end
