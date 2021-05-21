Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Contrôleur PromotionsController
  resources :promotions do
    member do
      put 'close', to: 'promotions#close'
    end
  end

  # Contrôleur FormationsController
  resources :formations

  # Contrôleur EntreprisesController
  resources :entreprises

  # Contrôleur StaticController
  get '/static', to: 'static#index'

end
