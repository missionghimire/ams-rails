Rails.application.routes.draw do
  post "login" => "authentication#login"
  post "register" => "users#create"

  get "index" => "users#index"
  put "user/update/" => "users#update"
  delete "user/delete/" => "users#destroy"

  post "artist/create" => "artists#create"
  put "artist/update" => "artists#update"
  delete "artist/delete/"=> "artists#destroy"

  post "music/create" => "musics#create"
  put "music/update" => "musics#update"
  delete "music/delete/"=> "musics#destroy"

  get "/" => "dashboards#index"


end
