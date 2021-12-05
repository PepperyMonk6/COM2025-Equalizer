Rails.application.routes.draw do
  root 'home#home'
  get 'response', to: 'home#responsive'
  get 'contact', to: 'home#contact'
  post 'request_contact', to: 'home#request_contact'
  post '/addSongToPlaylist/:playlist_id/:id', to: 'songs#addSong', as: 'addSongToPlaylist'
  resources :playlists
  resources :songs

  delete '/removeSong/:id/:song_id', to: 'playlists#removeSong', as: 'removeSong'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
