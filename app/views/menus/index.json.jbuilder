json.array!(@menus) do |menu|
  json.extract! menu, :id, :expDesc, :type, :price
  json.url menu_url(menu, format: :json)
end
