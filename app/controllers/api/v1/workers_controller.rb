# frozen_string_literal: true

module Api
  module V1
    class WorkersController < ApiController
      before_action :set_worker, only: %i[show update destroy]
      skip_before_action :doorkeeper_authorize!, only: :index

      # GET /workers
      def index
        @workers = Worker.all

        render json: @workers, status: :ok
      end

      # GET /workers/1
      def show
        render json: @worker, status: :ok
      end

      # POST /workers
      def create
        @worker = Worker.new(worker_params)

        if @worker.save
          render json: @worker, status: :created
        else
          render json: @worker.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /workers/1
      def update
        categories = Category.find(worker_params['categories'])
        @worker.categories = categories

        if @worker.update(worker_params.except(:categories))
          render json: @worker, status: :ok

        else
          render json: @worker.errors, status: :unprocessable_entity
        end
      end

      # DELETE /workers/1
      def destroy
        @worker.destroy

        head :no_content
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_worker
        @worker = Worker.find_by(id: params[:id])
        render json: { error: t('errors.not_found', resource_name: t('models.worker.name')) }, status: :not_found if @worker.nil?
      end

      # Only allow a list of trusted parameters through.
      def worker_params
        params.require(:worker).permit(:first_name, :last_name, :phone_number, :job, :instagram, :image_url, categories: [])
      end
    end
  end
end
