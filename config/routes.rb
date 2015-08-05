Rails.application.routes.draw do

  devise_for :users
  root to: 'advert#index'

  resources :users

end
