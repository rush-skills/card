json.array!(@networks) do |network|
  json.extract! network, :id, :from, :to
  json.url network_url(network, format: :json)
end
