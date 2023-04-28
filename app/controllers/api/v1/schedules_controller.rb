# frozen_string_literal: true

module Api
  module V1
    class SchedulesController < ApiController
      before_action :set_schedule, only: %i[show edit update destroy]

      # GET /schedules or /schedules.json
      def index
        start_date = check_date(schedule_params[:start_date])
        end_date = check_date(schedule_params[:end_date])
        schedules = Schedule.by_date_range(start_date, end_date).includes(:client)
        # schedules = Schedule.all

        schedules = schedules.by_worker(schedule_params[:worker_id]) if schedule_params[:worker_id].to_i.positive?

        render json: {
          data: ActiveModelSerializers::SerializableResource.new(schedules, each_serializer: ScheduleSerializer),
          status: 200,
          type: 'Success'
        }
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
          render json: @schedule, status: :created
        else
          render json: @schedule.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /schedules/1 or /schedules/1.json
      def update
        if @schedule.update(schedule_params)
          render json: @schedule, status: :ok
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
        params.permit(:start_date, :end_date)
      end

      def check_date(date)
        if date.to_i != 0
          Time.zone.at(date.to_i)
        else
          Time.zone.now
        end
      # If the string is in datetime format, datetime will be a valid DateTime object
      rescue ArgumentError
        # If the string is not in datetime format, an ArgumentError will be raised
        Time.zone.now
      end
    end
  end
end
