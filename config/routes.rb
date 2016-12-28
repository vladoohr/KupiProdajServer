Rails.application.routes.draw do
  root 'home#index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
  	namespace :v1 do
  		post '/users/signup', to: 'users#signup'
  		post '/users/signin', to: 'users#signin'
  		get  '/users/advertisements/:id', to: 'users#user_ads'
      
      post '/advertisements/new', to: 'advertisements#new'
      post '/advertisements/:id/update', to: 'advertisements#update'
      delete '/advertisements/:id', to: 'advertisements#destroy'
      get  '/advertisements/:id', to: 'advertisements#show'
      get  '/advertisements', to: 'advertisements#index'
      get '/advertisement/featured', to: 'advertisements#featured'

      get '/items/cities', to: 'items#cities' 
      get '/items/categories', to: 'items#categories'

      delete '/photos/:id', to: 'photos#destroy'
  	end
  end

  # For experimentation
  resources :photos
end
