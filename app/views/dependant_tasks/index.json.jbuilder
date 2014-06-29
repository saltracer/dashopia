json.array!(@dependant_tasks) do |dependant_task|
  json.extract! dependant_task, :id, :task_id
  json.url dependant_task_url(dependant_task, format: :json)
end
