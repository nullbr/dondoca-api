# frozen_string_literal: true

module Api
  module V1
    class SchedulesController < ApiController
      before_action :set_schedule, only: %i[show edit update destroy]

      # GET /schedules or /schedules.json
      def index
        @schedules = Schedule.all
        render json: @schedules
      end

      # GET /schedules/1 or /schedules/1.json
      def show
        render json: @schedule
      end

      # GET /schedules/new
      def new
        render json: @schedule = Schedule.new
      end

      # GET /schedules/1/edit
      def edit
        render json: @schedule
      end

      # POST /schedules or /schedules.json
      def create
        @schedule = Schedule.new(schedule_params)

        if @schedule.save
          render :show, status: :created, location: @schedule
        else
          render json: @schedule.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /schedules/1 or /schedules/1.json
      def update
        if @schedule.update(schedule_params)
          render :show, status: :ok, location: @schedule
        else

          render json: @schedule.errors, status: :unprocessable_entity
        end
      end

      # DELETE /schedules/1 or /schedules/1.json
      def destroy
        @schedule.destroy

        head :no_content
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_schedule
        @schedule = Schedule.find_by(id: params[:id])
        render json: { error: 'Schedule not found' }, status: :not_found if @schedule.nil?
      end

      # Only allow a list of trusted parameters through.
      def schedule_params
        params.require(:schedule).permit(:first_name, :last_name, :phone_number, :job)
      end
    end
  end
end
