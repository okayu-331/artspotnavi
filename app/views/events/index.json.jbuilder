json.array!(@events) do |event|
  json.id event.id
  json.start event.open_date
  json.end event.open_date
  json.startTime event.open_time
  json.endTime event.close_time
end