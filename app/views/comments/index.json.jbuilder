json.array!(@comments) do |comment|
  json.extract! comment, :id, :message, :walker_id, :owner_id
  json.url comment_url(comment, format: :json)
end
