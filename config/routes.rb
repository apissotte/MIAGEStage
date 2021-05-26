Rails.application.routes.draw do
  # Routes pour Devise
  #devise_for :tuteur_universitaires
  devise_for :etudiants, controllers: {
    registrations: "etudiants/registrations"
  }

  devise_for :tuteur_universitaires, controllers: {
    registrations: "tuteur_universitaires/registrations"
  }


  # Require a root to for devise
  root to: 'static#index'

  get '/static', to: 'static#index'
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

  # Contrôleur TuteurUniversitaireController
  resources :tuteur_universitaires

  # Contrôleur StaticController
  get '/static', to: 'static#index'

end
