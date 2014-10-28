json.array!(@activity_items) do |activity_item|
  json.extract! activity_item, :id, :activity_item, :activity_date, :starting_time, :ending_time, :activity_note, :activity_starred, :user_id, :activity_color
  json.url activity_item_url(activity_item, format: :json)
end
