# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApiController
      skip_before_action :doorkeeper_authorize!, only: :index

      # GET /categories
      def index
        categories = Category.all
        render json: categories
      end
    end
  end
end
