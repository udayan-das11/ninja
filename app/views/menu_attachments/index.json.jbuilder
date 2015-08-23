json.array!(@menu_attachments) do |menu_attachment|
  json.extract! menu_attachment, :id, :menu_id, :avatar
  json.url menu_attachment_url(menu_attachment, format: :json)
end
