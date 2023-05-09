# frozen_string_literal: true

module Api
  module V1
    module Users
      class RegistrationsController < ApiController
        skip_before_action :doorkeeper_authorize!, only: %i[create]

        include DoorkeeperRegisterable

        # POST /oauth/token -> Login
        def create
          allowed_params = user_params.except(:client_id)
          @user = User.new(allowed_params)

          if @user.save
            generate_access_token(@user, @client_app)
            render :show
          else
            render json: { errors: @user.errors.messages }, status: :unprocessable_entity
          end
        end

        # POST /oauth/revoke -> Logout
        def edit
          user = current_user

          allowed_params = user_params.except(:client_id)

          # check if email or password are present
          # use current password or email if none is present
          allowed_params[:email] = user.email if allowed_params[:email].blank?
          allowed_params[:password] = user.password if allowed_params[:password].blank?

          if user.update_with_password(allowed_params)
            render json: render_user(user, @client_app), state: :ok
          else
            render json: { errors: [t('activerecord.errors.models.user.attributes.current_password.invalid')] }, status: :unprocessable_entity
          end
        end

        private

        def user_params
          params.require(:registration).permit(:email, :password, :current_password)
        end
      end
    end
  end
end
