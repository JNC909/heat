# config/routes.rb
Rails.application.routes.draw do
  resources :events
  get 'meetings_members/index'
  resources :members
  root 'pages#home'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :meetings do
    get 'member_view', on: :collection
  end

  resources :meetings_members
  resources :events_members

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
end
