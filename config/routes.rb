Rails.application.routes.draw do
  root 'static_pages#home'
  get :about,        to: 'static_pages#about'
  get :use_of_terms, to: 'static_pages#terms'
  
  get :signup,       to: 'users#new'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :dishes
  
  get    :login,     to: 'sessions#new'
  post   :login,     to: 'sessions#create'
  delete :logout,    to: 'sessions#destroy'
  
  resources :relationships, only: [:create, :destroy]
  
  get :favorites, to: 'favorites#index'
  post   "favorites/:dish_id/create"  => "favorites#create"
  delete "favorites/:dish_id/destroy" => "favorites#destroy"
end
