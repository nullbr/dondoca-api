# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApiController
      before_action :current_user

      # GET /me.json
      def me
        if @current_user.nil?
          render json: { error: 'Not Authorized' }, status: :unauthorized
        else
          render :show
        end
      end
    end
  end
end
