Rails.application.routes.draw do
  post "login" => "authentication#login"
  post "register" => "users#create"

  get "index" => "users#index"
  put "user/update/:id" => "users#update"
  delete "user/delete/:id" => "users#destroy"

  post "artist/create" => "artists#create"
  get "artist/index" => "artists#index"
  put "artist/update/:id" => "artists#update"
  delete "artist/delete/:id"=> "artists#delete"

  get "show-music/:id" => "artists#show_songs"
  post "music/:id/create" => "musics#create"
  put "music/update/:id" => "musics#update"
  delete "music/delete/:id"=> "musics#delete"

  get "/" => "dashboards#index"


end
