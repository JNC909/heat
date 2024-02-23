# Rails.application.routes.draw do
#   root 'events#index'

#   devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
#   devise_scope :admin do
#     get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
#     get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
#   end

#   resources :events
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Defines the root path route ("/")
#   # root "articles#index"
# end

Rails.application.routes.draw do
  root 'home#index'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/links', to: 'links#index'
end
