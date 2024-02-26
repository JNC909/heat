json.extract! meeting, :id, :name, :date, :location, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
