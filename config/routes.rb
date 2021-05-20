Rails.application.routes.draw do

  resources :promotions do
    member do
      put 'close', to: 'promotions#close'
    end
  end
  resources :formations

  get '/static', to: 'static#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
