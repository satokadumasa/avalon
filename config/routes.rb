Rails.application.routes.draw do
  post 'image_upload/create'
  resources :image_files
  resources :tags
  root 'welcome#index'
  get 'home/index'
  get "home", to: "home#index", as: "user_root"  
  get 'welcome/index'
  resources :user_profiles
  resources :bookmarks
  resources :user_pagecomments
  resources :pagecomments
  resources :categories
  resources :notes do
    resources :pages
  end
  resources :user_roles
  resources :roles
  # devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    # sessions: 'users/sessions'
    # confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    sessions:      'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
