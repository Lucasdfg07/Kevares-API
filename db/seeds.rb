Type.find_or_create_by!(name: "Province MMS")
Type.find_or_create_by!(name: "City Standard")

(1..17).each_with_index do |i, e|
  file = File.read("#{Rails.root}/tmp/images/#{i}.json")
  data_hash = JSON.parse(file)
  
  issue = Issue.find_or_create_by!(
    image: data_hash['front_image'],
    latitude: data_hash['latitude'],
    longitude: data_hash['longitude'],
    altitude: data_hash['altitude'],
    category: data_hash['type']
  )

  IssueType.find_or_create_by!(issue_id: issue.id, type_id: 1)
  Status.find_or_create_by!(issue_id: issue.id, name: "detected")
end
