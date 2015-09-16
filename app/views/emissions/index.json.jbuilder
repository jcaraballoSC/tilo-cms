json.array!(@emissions) do |emission|
  json.extract! emission, :id
  json.url emission_url(emission, format: :json)
end
