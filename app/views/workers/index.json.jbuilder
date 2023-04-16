# frozen_string_literal: true

json.array! @workers, partial: 'workers/worker', as: :worker
