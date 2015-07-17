json.array!(@users) do |user|
  json.extract! user, :id, :name, :surname, :date_of_birth, :email, :password
  json.url user_url(user, format: :json)
end
