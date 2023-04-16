# frozen_string_literal: true

json.extract! worker, :id, :first_name, :last_name, :phone_number, :job, :created_at, :updated_at
json.url worker_url(worker, format: :json)
