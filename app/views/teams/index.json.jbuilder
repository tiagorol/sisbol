json.array!(@teams) do |team|
  json.extract! team, :id, :description, :full_description, :crest
  json.url team_url(team, format: :json)
end
