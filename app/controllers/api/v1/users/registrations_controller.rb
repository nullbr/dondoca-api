# frozen_string_literal: true

module Api
  module V1
    module Users
      class RegistrationsController < ApiController
        skip_before_action :doorkeeper_authorize!, only: %i[create]

        include DoorkeeperRegisterable

        # POST /oauth/token -> Login
        def create
          @user = User.new(user_params)

          if @user.save
            generate_access_token(@user, @client_app)
            render :show
          else
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
          end
        end

        # POST /oauth/revoke -> Logout
        def edit
          # check if email or password are present
          # use current password or email if none is present
          user_params[:email] = current_user.email if user_params[:email].blank?
          user_params[:password] = current_user.password if user_params[:password].blank?

          if current_user.update_with_password(user_params)
            render json: :show, status: :ok
          else
            render json: { errors: current_user.errors.full_messages }, status: :unprocessable_entity
          end
        end

        private

        def user_params
          params.require(:registration).permit(:email, :username, :password, :current_password)
        end
      end
    end
  end
end
