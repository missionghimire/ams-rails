Rails.application.routes.draw do
  post "login" => "authentication#login"
  post "register" => "users#create"

  get "index" => "users#index"
  put "user/update/" => "users#update"
  delete "user/delete/" => "users#destroy"

  post "artist/create" => "artists#create"
  put "artist/update" => "artists#update"

  post "music/create" => "musics#create"

end
