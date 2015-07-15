json.array!(@clubes) do |clube|
  json.extract! clube, :id, :nome
  json.url clube_url(clube, format: :json)
end
