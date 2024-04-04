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
  # resources :meetings do
  #   get 'attendance', on: :collection
  # end
  resources :meetings do
    get 'member_view', on: :collection
  end
  resources :meetings_members
  #resources :events_members
  resources :events_members, only: [:index, :create]

get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'

#for exporting table data
get 'meetings_export', to: 'meetings_members#export', as: 'meetings_export'

get 'events_export', to: 'events_members#export', as: 'events_export'

resources :speeches
  post '/read_and_convert', to: 'speeches#read_and_convert' 
end
