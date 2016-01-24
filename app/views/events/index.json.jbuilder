json.array!(@events) do |event|
  json.extract! event, :id, :title, :start_time, :food, :swag, :prizes, :confirmed_attendees, :declined_attendees
  json.url event_url(event, format: :json)
end
