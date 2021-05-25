Rails.application.routes.draw do
  get '/static', to: 'static#index'
  get '/fiche_stages', to: 'fiche_stages#index'
  resources :fiche_stages, except: :destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
