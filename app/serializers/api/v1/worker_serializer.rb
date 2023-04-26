# frozen_string_literal: true

module Api
  module V1
    class WorkerSerializer < ActiveModel::Serializer
      attributes :id,
                 :first_name,
                 :last_name,
                 :job,
                 :created_at,
                 :updated_at,
                 :instagram,
                 :image_url,
                 :phone_number
    end
  end
end
