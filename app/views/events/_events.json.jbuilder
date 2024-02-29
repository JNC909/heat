json.extract! events, :id, :name, :date, :location, :created_at, :updated_at
json.url events_url(meeting, format: :json)
