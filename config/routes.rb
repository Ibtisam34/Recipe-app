Rails.application.routes.draw do
  devise_for :users
  root "public_recipes#index"
  resources :users do
    resources :foods, only: [:index, :show, :new, :create, :destroy]
    delete '/recipes/:id', to: 'recipes#destroy', as: 'recipe'
    resources :recipes, only: [:index, :show, :new, :create, :destroy]
  end
end
