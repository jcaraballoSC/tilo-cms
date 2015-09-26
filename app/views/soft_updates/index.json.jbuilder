json.array!(@soft_updates) do |soft_update|
  json.extract! soft_update, :id
  json.url soft_update_url(soft_update, format: :json)
end
