json.result 'success'
json.data do
  json.array! @musics do |music|
    json.artist_id music.artist_id
    json.title music.title
    json.album_name music.album_name
    json.genre music.genre
  end
end
json.meta do
  json.total_count @users.total_count
  json.total_pages @users.total_pages
  json.current_page @users.current_page
  json.per_page @users.limit_value
end

