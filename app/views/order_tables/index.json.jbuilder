json.array!(@order_tables) do |order_table|
  json.extract! order_table, :id, :date, :timeslotfrom, :timeslotto, :customization, :status, :paymentid, :Host_id, :User_id
  json.url order_table_url(order_table, format: :json)
end
