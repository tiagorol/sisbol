json.array!(@matches) do |match|
  json.extract! match, :id, :championship_id, :round_id, :goals_home_team, :goals_away_team, :home_team, :away_team, :day_of_match
  json.url match_url(match, format: :json)
end
