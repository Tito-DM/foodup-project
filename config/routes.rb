Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'recipes#index'
  resources :user do
    resources :recipes do
      get :view, on: :member
      resources :ingredients
      resources :steps
      resources :rate
      resources :comments
    end
  end


end
