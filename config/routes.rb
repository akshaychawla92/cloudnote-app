Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :notes

  #routes for cards
  get '/cards', to: 'cards#index', as: 'cards'
  post '/cards', to: 'cards#create'
  get '/cards/new', to: 'cards#new', as: 'new_card'
  get '/cards/:id', to: 'cards#show', as: 'card'
  get '/cards/:id/edit', to: 'cards#edit', as:'edit_card'
  patch '/cards/:id', to: 'cards#update'
  delete '/cards/:id/', to: 'cards#destroy', as: 'destroy_card'

	#routes for scans
  get '/scans', to: 'scans#index', as: 'scans'
  post '/scans', to: 'scans#create'
  get '/scans/new', to: 'scans#new', as: 'new_scan'
  get '/scans/:id', to: 'scans#show', as: 'scan'
  get '/scans/:id/edit', to: 'scans#edit', as:'edit_scan'
  patch '/scans/:id', to: 'scans#update'
  delete '/scans/:id/', to: 'scans#destroy', as: 'destroy_scan'


  authenticated :user do
	  root "notes#index", as: "authenticated_root"
	end

	root "welcome#index"
end