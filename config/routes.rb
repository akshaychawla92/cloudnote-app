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

  authenticated :user do
	  root "notes#index", as: "authenticated_root"
	end

	root "welcome#index"
end