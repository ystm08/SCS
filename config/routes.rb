Rails.application.routes.draw do

  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
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
    get 'homes/about', as: 'about'
    get '/categories/index' => 'categories#index'
    patch  '/users/withdraw' => 'users#withdraw'
    resources :users
    resources :reviews
      resource :favorite, only: [:create, :destroy]
  end

end
