Rails.application.routes.draw do

  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    resources :users, only: [:index, :show, :update]
    resources :items, only: [:index, :show, :new, :create, :edit, :update]
  end

  devise_for :users, controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  devise_scope :user do
    post "users/guest_sign_in", to: "user/sessions#guest_sign_in"
  end

  scope module: :user do
    root "homes#top"
    get 'search' => 'searches#search'
    get 'homes/about', as: 'about'
    get 'homes/latest', as: 'latest'
    patch  '/users/withdraw' => 'users#withdraw'
    resources :users
    resources :reviews do
      resource :favorite, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    resources :cart_items, only: [:index, :create, :destroy] do
      member do
        patch 'increase'
        patch 'decrease'
      end
    end
  end

end
