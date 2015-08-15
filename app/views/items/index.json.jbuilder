json.array!(@items) do |item|
  json.extract! item, :id, :name, :desc, :type, :tastetype, :references
  json.url item_url(item, format: :json)
end
