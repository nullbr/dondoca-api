# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApiController
      before_action :current_user

      # GET /me.json
      def me
        return render_errors(['Not Authorized'], :unauthorized) if @current_user.nil?

        render 'api/v1/users/show', formats: :json
      end
    end
  end
end
