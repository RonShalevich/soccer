json.extract! event, :id, :game, :start_time, :created_at, :updated_at
json.url event_url(event, format: :json)