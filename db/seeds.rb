(1..17).each_with_index do |i, e|
  file = File.read("#{Rails.root}/tmp/images/#{i}.json")
  data_hash = JSON.parse(file)
  
  Issue.create!(
    image: data_hash['front_image'],
    latitude: data_hash['latitude'],
    longitude: data_hash['longitude'],
    altitude: data_hash['altitude'],
    category: data_hash['type']
  )
end