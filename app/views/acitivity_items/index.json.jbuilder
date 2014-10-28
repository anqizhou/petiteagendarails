json.array!(@acitivity_items) do |acitivity_item|
  json.extract! acitivity_item, :id, :activity_name, :activity_date, :starting_time, :ending_time, :activity_note, :activity_starred, :calendar_user_id
  json.url acitivity_item_url(acitivity_item, format: :json)
end
