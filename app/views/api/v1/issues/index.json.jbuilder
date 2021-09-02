json.issues @issues do |issue|
  json.id issue.id
  json.image issue.image
  json.latitude issue.latitude
  json.longitude issue.longitude
  json.altitude issue.altitude
  json.category issue.category

  geolocation = Geocoder.search([issue.latitude, issue.longitude])
  json.address geolocation.first.data['error'].nil? ? geolocation.first.data['address'] : {'error': geolocation.first.data['error']}
end