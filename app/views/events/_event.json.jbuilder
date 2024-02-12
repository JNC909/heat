# frozen_string_literal: true

json.extract!(event, :event_id, :event_name, :event_link, :event_time, :event_attendance, :created_at, :updated_at)
json.url(event_url(event, format: :json))
