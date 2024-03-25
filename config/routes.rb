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
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :meetings
  resources :meetings do
    get 'attendance', on: :collection
  end
  resources :meetings_members
  #resources :events_members
  resources :events_members, only: [:index, :create]

get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
  
end
