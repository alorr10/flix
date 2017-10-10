Rails.application.routes.draw do
  resources :genres
  root "movies#index"
  resources :movies do
    resources :reviews
  end
  resources :users
  get      '/signup',           to: 'users#new'
  get      '/signin',           to: 'sessions#new'
  resource :session
end
