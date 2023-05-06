# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApiController
      before_action :set_category, only: %i[show edit update destroy]
      skip_before_action :doorkeeper_authorize!, only: :index

      # GET /categories
      def index
        categories = Category.all
        render json: categories,
               status: :ok
      end

      # GET /categories/1
      def show
        render json: @category
      end

      # GET /categories/new
      def new
        render json: @category = Category.new
      end

      # GET /categories/1/edit
      def edit
        render json: @category
      end

      # POST /categories
      def create
        @category = Category.new(category_params)

        if @category.save
          render json: @category, status: :created
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /categories/1
      def update
        if @category.update(category_params)
          render json: @category, status: :ok
        else

          render json: @category.errors, status: :unprocessable_entity
        end
      end

      # DELETE /categories/1
      def destroy
        @category.destroy

        head :no_content
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_category
        @category = Category.find_by(id: params[:id])
        render json: { error: t('errors.not_found', resource_name: t('models.category.name')) }, status: :not_found if @category.nil?
      end

      # Only allow a list of trusted parameters through.
      def category_params
        params.permit(:start_date, :end_date)
      end
    end
  end
end
