Rails.application.routes.draw do

  devise_for :users
  root to: 'adverts#index'

  resources :users
  resources :adverts
  
  #stripe
  resources :charges


  get '/admin', to: 'admin#index', as: :admin
  get :me, to: 'admin#login'
  post 'me/session', to: 'admin#open_session'

end
