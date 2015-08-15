json.array!(@hosts) do |host|
  json.extract! host, :id, :name, :email-id, :phone, :dob, :card_type, :card_no, :marital_status, :qualification, :profession, :favmusic, :favmovie, :socialprofile, :languages, :favdestination, :amenities, :personalitytype, :descriptionexp, :descriptionself, :rating, :membership
  json.url host_url(host, format: :json)
end
