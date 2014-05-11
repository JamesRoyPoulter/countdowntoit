json.array!(@countdowns) do |countdown|
  json.extract! countdown, :id, :name, :description, :link, :countdown_date
  json.url countdown_url(countdown, format: :json)
end
