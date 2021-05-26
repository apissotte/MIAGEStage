Rails.application.routes.draw do
  # Routes pour Devise
  #devise_for :tuteur_universitaires
  devise_for :etudiants, controllers: {
    registrations: "etudiants/registrations"
  }
  devise_scope :etudiant do
    get '4d6a8d14-ef57-4da8-908d-5b3388bfdf48/sign_up', to: 'etudiants/registrations#new'
  end

  devise_for :tuteur_universitaires, controllers: {
    registrations: "tuteur_universitaires/registrations"
  }
  devise_scope :tuteur_universitaire do
    get 'f5506526-0a7d-40af-a39f-e456e5991564/sign_up', to: 'tuteur_universitaires/registrations#new'
  end

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
