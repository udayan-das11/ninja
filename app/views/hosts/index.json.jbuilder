json.array!(@hosts) do |host|
  json.extract! host, :id, :username, :emailid, :passwd, :confpasswrd, :name, :addr, :lat, :longi, :age, :phoneno, :qualification, :profession, :languages, :blog, :idcard, :cardtype, :food, :destination, :toddlrReason, :reasonToenjycooking, :frequencyofCooking
  json.url host_url(host, format: :json)
end
