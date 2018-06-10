Rails.application.routes.draw do
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
  }
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  get 'home/index'
  get 'welcome/index'
  root 'welcome#index'
end
