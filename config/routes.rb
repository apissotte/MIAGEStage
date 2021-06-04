Rails.application.routes.draw do
  get '/', to: 'pages#home'


  # Ressources Etudiants
  #
  # Contrôleur : EtudiantsController (app/controllers/etudiants_controller)
  #
  # Routes :
  #       etudiants GET    /etudiants(.:format)                                    etudiants#index
  #                 POST   /etudiants(.:format)                                    etudiants#create
  #    new_etudiant GET    /etudiants/new(.:format)                                etudiants#new
  #   edit_etudiant GET    /etudiants/:id/edit(.:format)                           etudiants#edit
  #        etudiant GET    /etudiants/:id(.:format)                                etudiants#show
  #                 PATCH  /etudiants/:id(.:format)                                etudiants#update
  #                 PUT    /etudiants/:id(.:format)                                etudiants#update
  #                 DELETE /etudiants/:id(.:format)                                etudiants#destroy
  #
  resources :etudiants


  # Confiugration des routes pour Devise
  #
  # Documentation : https://github.com/heartcombo/devise#
  #
  # 3 modèles :
  #   - Etudiants                     :etudiants
  #   - Tuteurs universitaires        :tuteur_universitaires
  #   - Responsable des stages        :responsable_stages
  #
  devise_for :etudiants,
             path: '/auth',                                 # Préfixage des routes avec '/auth'
             controllers: {
               # Surcharge du contrôleur de registration de devise par le contrôleur Etudiants::RegistrationsController
               registrations: "etudiants/registrations"
             }

  devise_scope :etudiant do
    # Génération d'une route permettant l'inscription des étudiants
    get '4d6a8d14-ef57-4da8-908d-5b3388bfdf48/sign_up', to: 'etudiants/registrations#new', :as => 'guid_etudiant_sign_up'
  end


  devise_for :tuteur_universitaires, controllers: {
    registrations: "tuteur_universitaires/registrations"
  }

  devise_scope :tuteur_universitaire do
    # get '/sign_in', to: 'devise/sessions#new'
    get 'f5506526-0a7d-40af-a39f-e456e5991564/sign_up', to: 'tuteur_universitaires/registrations#new'
  end


  devise_for :responsable_stages, controllers: {
    registrations: "responsable_stages/registrations"
  }

  devise_scope :responsable_stage do
    # get '/sign_in', to: 'devise/sessions#new'
    get '505cccad-922c-4251-bae6-55c5f91df05b/sign_up', to: 'responsable_stages/registrations#new'
  end


  # Require a root to for devise
  root to: 'static#index'

  get '/static', to: 'static#index'
  post '/fiche_stages/csend', to: 'fiche_stages#csend'
  patch '/fiche_stages/:id/usend', to: 'fiche_stages#usend', as: :fiche_stages_usend
  get '/fiche_stages/:id/validate', to: 'fiche_stages#validate', as: :fiche_stages_validate

  patch '/fiche_stages/:id/vyes', to: 'fiche_stages#vyes', as: :fiche_stages_vyes
  patch '/fiche_stages/:id/vno', to: 'fiche_stages#vno', as: :fiche_stages_vno

  resources :fiche_stages, except: [:destroy, :edit]
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
  get '/evaluationtemplate', to: 'evaluations#template'
  get '/notationtemplate', to: 'notations#template'
  post '/evaluation/save/(:id)', to: 'evaluations#save'
  get '/evaluation/edit/(:id)', to: 'evaluations#editEvaluation'
  get '/evaluation/view/(:id)', to: 'evaluations#viewEvaluation'
  get '/tableaudebord', to: 'tableau_de_bord#tableauDeBord'
  get '/menuetudiant', to: 'menu#menuEtudiant'
  get '/menurespstage', to: 'menu#menuRespStage'
  get '/menu', to: 'menu#redirection'
  get '/notation/(:id)', to: 'notations#notation'
  get '/notation/view/(:id)', to: 'notations#viewNotation'
  post '/notation/save', to: 'notations#saveNotation'
  get '/evolution', to: 'evolutions#evolution'
  get '/statistiques', to: 'statistiques#statistiques'
  get '/tableEtudiant', to: 'table_etudiant#tableEtudiant'
  resources :ge_formats
  resources :notation_formats
end
