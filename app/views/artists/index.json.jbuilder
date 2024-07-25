json.result 'success'
json.data do
  json.array! @artists do |artist|
    json.id artist.id
    json.name "#{artist.name} "
    json.dob user.dob
    json.gender artist.gender
    json.address artist.address
    json.first_release_date artist.first_release_date
    json.number_of_albums artist.number_of_albums

  end
end
json.meta do
  json.total_count @artists.total_count
  json.total_pages @artists.total_pages
  json.current_page @artists.current_page
  json.per_page @artists.limit_value
end

