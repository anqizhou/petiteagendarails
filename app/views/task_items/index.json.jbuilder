json.array!(@task_items) do |task_item|
  json.extract! task_item, :id, :task_name, :task_date, :task_note, :task_starred, :user_id, :task_color
  json.url task_item_url(task_item, format: :json)
end
