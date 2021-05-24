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
  resources :formations

  # Contrôleur EntreprisesController
  resources :entreprises

  # Contrôleur TuteurUniversitaireController
  resources :tuteur_universitaires

  # Contrôleur StaticController
  get '/static', to: 'static#index'

  get '/evaluation', to: 'evaluations#evaluation'
  post '/evaluation/save', to: 'evaluations#save'
  get '/evaluation/view/(:id)', to: 'evaluations#viewEvaluation'
  get '/tableaudebord', to: 'tableau_de_bord#tableauDeBord'
  get '/menuetudiant', to: 'menu#menuEtudiant'
  get '/menurespstage', to: 'menu#menuRespStage'
  get '/menu', to: 'menu#redirection'
  get '/notation', to: 'notations#notation'
  get '/notation/view', to: 'notations#viewNotation'
  get '/evolution', to: 'evolutions#evolution'
  get '/statistiques', to: 'statistiques#statistiques'
  get '/tableEtudiant', to: 'table_etudiant#tableEtudiant'
  resources :ge_formats
end
