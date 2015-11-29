json.array!(@disputes) do |dispute|
  json.extract! dispute, :id, :description, :status, :championship_id
  json.url dispute_url(dispute, format: :json)
end
