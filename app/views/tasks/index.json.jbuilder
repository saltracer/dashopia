json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :user_id, :status, :priority, :location_id, :start_at, :duration, :finish_at, :due_at, :due_event, :reminder_at, :reminder_type, :occurance_id, :occurance_deleted, :parent_id, :collapse, :child_duration
  json.url task_url(task, format: :json)
end
