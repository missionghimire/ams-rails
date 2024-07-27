json.result 'success'
json.data do
  json.user_count @user_count
  json.artist_count @artist_count
  json.music_count @music_count

end

