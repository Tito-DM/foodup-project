Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  root 'recipes#index'
  resources :users do
    resources :recipes  do
      get :view, on: :member
      resources :ingredients
      resources :steps
      resources :rate
      resources :comments
    end
  end


end
