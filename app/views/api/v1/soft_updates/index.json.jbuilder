json.Updates do
  @updates.each{ |update|
  json.url update.name
  json.update update.created_at
}