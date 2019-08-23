Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :albums, only: [:index, :show] do
        resources :songs, only: [:index]
      end
      resources :artists, only: [:index, :show] do
        resources :albums, only: [:index]
      end
      resources :songs, only: [:index, :show]
      resources :users, only: [:index, :show, :create] do
        post "playlists", to:"playlists#create"
        get "playlists", to:"playlists#index"
      end
      resources :playlists, only: [:show] do
        post "songs", to:"songs#create"
        get "songs", to:"songs#index"
      end
      
    end
  end
end
