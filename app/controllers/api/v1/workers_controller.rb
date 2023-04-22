# frozen_string_literal: true

module Api
  module V1
    class WorkersController < ApiController
      before_action :set_worker, only: %i[show edit update destroy]

      # GET /workers or /workers.json
      def index
        @workers = Worker.all
        render json: @workers
      end

      # GET /workers/1 or /workers/1.json
      def show
        render json: @worker
      end

      # GET /workers/new
      def new
        render json: @worker = Worker.new
      end

      # GET /workers/1/edit
      def edit
        render json: @worker
      end

      # POST /workers or /workers.json
      def create
        @worker = Worker.new(worker_params)

        if @worker.save
          render :show, status: :created, location: @worker
        else
          render json: @worker.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /workers/1 or /workers/1.json
      def update
        if @worker.update(worker_params)
          render :show, status: :ok, location: @worker
        else

          render json: @worker.errors, status: :unprocessable_entity
        end
      end

      # DELETE /workers/1 or /workers/1.json
      def destroy
        @worker.destroy

        head :no_content
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_worker
        @worker = Worker.find_by(id: params[:id])
        render json: { error: 'Worker not found' }, status: :not_found if @worker.nil?
      end

      # Only allow a list of trusted parameters through.
      def worker_params
        params.require(:worker).permit(:first_name, :last_name, :phone_number, :job)
      end
    end
  end
end
