Rails.application.routes.draw do

  root 'pages#welcome'

  post 'api/v1/playlists', to: 'api/v1/playlists#create'
  get '/auth/fitbit_oauth2/callback', to: 'sessions#create'
  get '/auth/spotify/callback', to: 'sessions#complete'
  get '/spotify_login', to: 'pages#spotify_login', as: :spotify_login
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
  get '/logout', to: 'sessions#destroy', as: :logout
  get 'api/v1/playlists/:id', to: 'api/v1/playlists#show', as: :playlist


end
