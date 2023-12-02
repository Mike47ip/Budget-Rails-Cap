Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations'} do      
    root to: "groups#index"
  end

  resources :users, only: [:index, :create]

  resources :groups, only: [:index, :show, :new, :create] do
    resources :entities, only: [:index, :new, :create]
  end

  authenticated :user do
    root to: 'groups#index', as: :authenticated_root
  end

  root to: "splash#index"
end
