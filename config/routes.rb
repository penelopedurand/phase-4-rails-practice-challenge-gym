Rails.application.routes.draw do
  resources :memberships, only: [:index, :show, :create]
  resources :clients, only: [:index, :show]
  resources :gyms, only: [:index, :show, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
