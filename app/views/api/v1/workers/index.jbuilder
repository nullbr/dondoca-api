# frozen_string_literal: true

json.array! @workers.each do |worker|
  json.partial!('info', worker:)
end
