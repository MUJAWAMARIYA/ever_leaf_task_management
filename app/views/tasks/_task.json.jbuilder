json.extract! task, :id, :name, :content, :start_date, :end_date, :kind_of_task, :priority, :status, :created_at, :updated_at
json.url task_url(task, format: :json)
