# frozen_string_literal: true

module Api
  module V1
    class ServicesController < ApplicationController
      # before_action :set_service, only: %i[show edit update destroy]

      # GET /services
      def index
        render json: Service.all.order(name: :asc)
      end
    end
  end
end
