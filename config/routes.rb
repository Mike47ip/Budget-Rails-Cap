Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' } do
    root to: 'groups#index'
  end

  resources :users, only: %i[index create]

  resources :groups, only: %i[index show new create] do
    resources :entities, only: %i[index new create]
  end

  authenticated :user do
    root to: 'groups#index', as: :authenticated_root
  end

  root to: 'splash#index'
end
