Rails.application.routes.draw do

  devise_for :users
  root to: 'advert#index'

  resources :users

  get '/admin', to: 'admin#index', as: :admin
  get :me, to: 'admin#login'
  post 'me/session', to: 'admin#open_session'

  resources :brand
  resources :model

end
