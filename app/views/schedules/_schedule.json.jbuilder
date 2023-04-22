json.extract! schedule, :id, :start_at, :end_at, :client_id, :worker_id, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
