Rails.application.routes.draw do

  resources :promotions, only: [:index, :show, :create, :destroy] do
    member do
      put 'close', to: 'promotions#close'
    end
  end
  
  resources :formations, only: [:create, :edit, :update, :destroy]

  get '/static', to: 'static#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
