json.Updates do
  @updates.each{ |update|
  json.file update.name
}
end