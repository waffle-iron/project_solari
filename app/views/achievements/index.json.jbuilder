json.array!(@achievements) do |achievement|
  json.extract! achievement, :id, :type, :name, :description, :image, :conunt, :difficulty, :requirement
  json.url achievement_url(achievement, format: :json)
end
