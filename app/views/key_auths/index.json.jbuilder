json.array!(@key_auths) do |key_auth|
  json.extract! key_auth, :id
  json.url key_auth_url(key_auth, format: :json)
end
