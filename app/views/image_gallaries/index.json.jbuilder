json.array!(@image_gallaries) do |image_gallary|
  json.extract! image_gallary, :id, :image_id, :Host_id
  json.url image_gallary_url(image_gallary, format: :json)
end
