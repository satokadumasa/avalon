Rails.application.routes.draw do
  resources :user_pagecomments
  resources :pagecomment_pages
  resources :pagecomments
  resources :user_pages
  resources :note_pages
  resources :user_notes
  resources :note_categories
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
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
