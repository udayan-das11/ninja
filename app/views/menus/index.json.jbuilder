json.array!(@menus) do |menu|
  json.extract! menu, :id, :menuType, :experience, :Host_id
  json.url menu_url(menu, format: :json)
end
