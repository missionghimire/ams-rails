json.result 'success'
json.data do
  json.array! @users do |user|
    json.id user.id
    json.name "#{user.first_name} #{user.last_name}"
    json.email user.email
    json.phone user.phone
  end
end
json.meta do
  json.total_count @users.total_count
  json.total_pages @users.total_pages
  json.current_page @users.current_page
  json.per_page @users.limit_value
end

