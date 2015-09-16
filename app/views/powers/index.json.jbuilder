json.array!(@powers) do |power|
  json.extract! power, :id
  json.url power_url(power, format: :json)
end
