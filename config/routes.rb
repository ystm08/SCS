Rails.application.routes.draw do

  namespace :admin do
    resources :items, only: [:index, :show, :new, :create, :edit, :update]
  end
    devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
  end

  devise_for :users, controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  scope module: :user do
    root "homes#top"
    get 'homes/about', as: 'about'
    patch  '/users/withdraw' => 'users#withdraw'
    resources :users
  end

  devise_scope :user do
    post "users/guest_sign_in", to: "user/sessions#guest_sign_in"
  end

end
