json.array!(@championships) do |championship|
  json.extract! championship, :id, :name, :start, :end
  json.url championship_url(championship, format: :json)
end
