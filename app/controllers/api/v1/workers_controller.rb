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

        respond_to do |format|
          if @worker.save
            format.html { redirect_to api_v1_worker_url(@worker), notice: 'Worker was successfully created.' }
            format.json { render :show, status: :created, location: @worker }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @worker.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /workers/1 or /workers/1.json
      def update
        respond_to do |format|
          if @worker.update(worker_params)
            format.html { redirect_to api_v1_worker_url(@worker), notice: 'Worker was successfully updated.' }
            format.json { render :show, status: :ok, location: @worker }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @worker.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /workers/1 or /workers/1.json
      def destroy
        @worker.destroy

        respond_to do |format|
          format.html { redirect_to api_v1_workers_url, notice: 'Worker was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_worker
        @worker = Worker.find_by_id(params[:id])
        render json: { error: 'Worker not found' }, status: :not_found if @worker.nil?
      end

      # Only allow a list of trusted parameters through.
      def worker_params
        params.require(:worker).permit(:first_name, :last_name, :phone_number, :job)
      end
    end
  end
end
