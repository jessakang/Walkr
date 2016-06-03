json.array!(@walkers) do |walker|
  json.extract! walker, :id, :name, :experience, :suburbs, :car, :wage, :image
  json.url walker_url(walker, format: :json)
end
