Rails.application.routes.draw do
  resources :tuteur_universitaires
  get '/static', to: 'static#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
