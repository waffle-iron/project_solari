json.array!(@matchings) do |matching|
  json.extract! matching, :id, :queue_type, :under30, :unranked, :bronze, :silver, :gold, :plutinum, :diamond, :master, :challenger, :deadline
  json.url matching_url(matching, format: :json)
end
