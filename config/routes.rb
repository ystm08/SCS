Rails.application.routes.draw do

  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    resources :users, only: [:index, :show, :update]
    resources :items
    resources :orders, only: [:show] do
      member do
      patch :update_status
      end
    end
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
    get 'homes/about', as: 'about'
    get 'homes/latest', as: 'latest'
    get 'search' => 'searches#search'
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
    resources :users, only: [:show, :edit, :update] do
      member do
        patch 'withdraw'
        get 'favorites'
        resource :relationships, only: [:create, :destroy]
          get "followings" => "relationships#followings", as: "followings"
          get "followers" => "relationships#followers", as: "followers"
      end
    end
    resources :items, only: [:show]
    resources :reviews do
      resource :favorite, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :orders, only: [:index, :create]
      patch :update_status
      post "orders/confirm" => "orders#confirm"
      get "complete" => "orders#complete"
  end

end
