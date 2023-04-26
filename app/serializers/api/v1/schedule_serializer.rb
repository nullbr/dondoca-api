# frozen_string_literal: true

module Api
  module V1
    class ScheduleSerializer < ActiveModel::Serializer
      attributes :id, :start_at, :end_at, :created_at, :updated_at, :client, :worker

      def client
        {
          id: object.client_id,
          first_name: object.client.first_name,
          last_name: object.client.last_name
        }
      end

      def worker
        {
          id: object.worker_id,
          first_name: object.worker.first_name,
          last_name: object.worker.last_name
        }
      end
    end
  end
end
