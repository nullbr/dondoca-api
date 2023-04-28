# frozen_string_literal: true

module Api
  module V1
    class ClientsController < ApiController
      before_action :set_client, only: %i[show edit update destroy]

      # GET /clients or /clients.json
      def index
        @clients = Client.all
        render json: @clients
      end

      # GET /clients/1 or /clients/1.json
      def show
        render json: @client
      end

      # GET /clients/new
      def new
        render json: @client = Client.new
      end

      # GET /clients/1/edit
      def edit
        render json: @client
      end

      # POST /clients or /clients.json
      def create
        @client = Client.new(client_params)

        if @client.save
          render json: @client, status: :created
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /clients/1 or /clients/1.json
      def update
        if @client.update(client_params)
          render json: @client, status: :ok
        else

          render json: @client.errors, status: :unprocessable_entity
        end
      end

      # DELETE /clients/1 or /clients/1.json
      def destroy
        @client.destroy

        head :no_content
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_client
        @client = Client.find_by(id: params[:id])
        render json: { error: 'Client not found' }, status: :not_found if @client.nil?
      end

      # Only allow a list of trusted parameters through.
      def client_params
        params.require(:client).permit(:first_name, :last_name, :phone_number, :job)
      end
    end
  end
end
