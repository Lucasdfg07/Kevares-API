FactoryBot.define do
  factory :issue do
    issue_latitude = FFaker::Geolocation.lat
    issue_longitude = FFaker::Geolocation.lng
    
		latitude {issue_latitude}
    longitude {issue_longitude}
		altitude {FFaker::Random.rand(-10000..10000)}
    image {"base64:// Any Image"}
    category {FFaker::Lorem.word}
    lonlat {"POINT(#{issue_longitude} #{issue_latitude})"}
	end
end