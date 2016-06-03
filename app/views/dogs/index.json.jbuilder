json.array!(@dogs) do |dog|
  json.extract! dog, :id, :name, :breed, :weight, :suburb, :concerns, :image
  json.url dog_url(dog, format: :json)
end
