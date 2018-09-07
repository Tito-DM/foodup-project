Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'index', to: 'recipes#index'
  root 'recipes#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users do
    resources :recipes,except: :index  do
      get :view, on: :member
      get :dislike, on: :member
      get :favorite, on: :member
      resources :ingredients
      resources :steps
      resources :comments
      resources :dislikes
      resources :favorites
    end
  end


end
