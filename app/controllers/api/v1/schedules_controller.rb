# frozen_string_literal: true

module Api
  module V1
    class SchedulesController < ApiController
      # GET /schedules
      def index
        start_date = check_date(schedule_params[:start_date])
        end_date = check_date(schedule_params[:end_date])
        schedules = Schedule.by_date_range(start_date, end_date).includes(:client)
        # schedules = Schedule.all

        schedules = schedules.by_worker(schedule_params[:worker_id]) if schedule_params[:worker_id].to_i.positive?

        render json: schedules
      end

      private

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
