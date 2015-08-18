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
  namespace :admin do
    resources :adverts, except: [:show]
    resources :models, except: [:show]
    resources :brands, except: [:show]
    resources :users, except: [:show]
  end
end
