Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items
  root "users#index"

  namespace :admin do
    root "items#index"
    resources :items
  end
  resources :users, only: [:edit, :update]
  resources :users ,only: [:show] do
    resources :items, only: [:index]
    member do
      get :works
      get :experiences
      get :contacks
    end
  end

end
