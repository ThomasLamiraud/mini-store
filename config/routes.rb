Rails.application.routes.draw do

  devise_for :users
  root to: 'advert#index'

  resources :users
  resources :adverts

  get '/admin', to: 'admin#index', as: :admin
  get :me, to: 'admin#login'
  post 'me/session', to: 'admin#open_session'

end
