# frozen_string_literal: true

module Api
  module V1
    class CategorySerializer < ActiveModel::Serializer
      attributes :id, :name, :created_at, :updated_at, :services

      def serives
        object.services.order(name: :asc)
      end
    end
  end
end
