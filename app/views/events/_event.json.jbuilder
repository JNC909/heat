json.extract! event, :id, :event_link, :event_name, :event_datetime, :created_at, :updated_at
json.url event_url(event, format: :json)
