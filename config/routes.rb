Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :offers do
    resources :reservations, only: [:new, :create]
  end
  resources :reservations, only: [:destroy, :update, :edit, :index, :show]
  get 'my_reservations', to: 'reservations#my_reservations', as: 'my_reservations'

  get 'my_offers', to: 'offers#my_offers', as: 'my_offers'
  get 'my_offers/:id', to: 'offers#my_offers_show', as: 'my_offers_show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
