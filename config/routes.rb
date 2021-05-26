Rails.application.routes.draw do
  get '/static', to: 'static#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Contrôleur PromotionsController
  resources :promotions do
    member do
      put 'close', to: 'promotions#close'
    end
  end

  # Contrôleur FormationsController
  resources :formations do
    member do
      get 'next', to: 'formations#next'
      post 'transfert', to: 'formations#transfert'
    end
  end

  # Contrôleur EntreprisesController
  resources :entreprises

  # Contrôleur TuteurUniversitaireController
  resources :tuteur_universitaires

  resources :etudiants

  # Contrôleur StaticController
  get '/static', to: 'static#index'

end
