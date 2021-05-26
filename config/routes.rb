Rails.application.routes.draw do
  get '/static', to: 'static#index'
  post '/fiche_stages/csend', to: 'fiche_stages#csend'
  patch '/fiche_stages/:id/usend', to: 'fiche_stages#usend', as: :fiche_stages_usend
  get '/fiche_stages/:id/validate', to: 'fiche_stages#validate', as: :fiche_stages_validate
  resources :fiche_stages, except: [:destroy, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
